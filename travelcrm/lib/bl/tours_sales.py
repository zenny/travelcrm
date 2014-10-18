# -*coding: utf-8-*-

from sqlalchemy import func

from ...models import DBSession
from ...models.resource import Resource
from ...models.tour_sale import TourSale
from ...models.person import Person
from ...models.invoice import Invoice
from ...models.service import Service
from ...models.account_item import AccountItem

from ...lib.bl import InvoiceFactory
from ...lib.bl.currencies_rates import query_convert_rates
from ...lib.utils.common_utils import money_cast


def calc_base_price(tour_sale):
    assert isinstance(tour_sale, TourSale), u"Must be TourSale instance"
    base_tour_sale_rate = (
        query_convert_rates(tour_sale.currency_id, tour_sale.deal_date)
        .scalar()
    )
    if base_tour_sale_rate is None:
        base_tour_sale_rate = 1
    tour_sale.base_price = money_cast(base_tour_sale_rate * tour_sale.price)

    return tour_sale


class TourSaleInvoiceFactory(InvoiceFactory):

    @classmethod
    def bind_invoice(cls, resource_id, invoice):
        tour_sale = (
            DBSession.query(TourSale)
            .filter(TourSale.resource_id == resource_id)
            .first()
        )
        tour_sale.invoice = invoice
        return tour_sale

    @classmethod
    def get_invoice(cls, resource_id):
        tour_sale = (
            DBSession.query(TourSale)
            .filter(TourSale.resource_id == resource_id)
            .first()
        )
        return tour_sale.invoice

    @classmethod
    def get_base_sum(cls, resource_id):
        tour_sale = (
            DBSession.query(TourSale)
            .filter(TourSale.resource_id == resource_id)
            .first()
        )
        return tour_sale.base_sum

    @classmethod
    def query_list(cls):
        query = (
            DBSession.query(
                Resource.id.label('resource_id'),
                Person.name.label('customer'),
                TourSale.base_price.label('sum'),
                Invoice.id.label('invoice_id'),
            )
            .join(Resource, TourSale.resource)
            .join(Person, TourSale.customer)
            .join(Invoice, TourSale.invoice)
        )
        return query

    @classmethod
    def services_info(cls, resource_id, currency_id=None):
        tour_sale = (
            DBSession.query(TourSale)
            .filter(TourSale.resource_id == resource_id)
            .first()
        )
        rate = query_convert_rates(currency_id, tour_sale.deal_date).scalar()
        if not rate:
            rate = 1
        query = (
            DBSession.query(
                Service.id.label('id'),
                Service.name.label('name'),
                TourSale.base_price.label('base_price')
            )
            .join(Service, TourSale.service)
            .filter(TourSale.id == tour_sale.id)
        )
        subq = query.subquery()
        return (
            DBSession.query(
                subq.c.name,
                func.count(subq.c.id).label('cnt'),
                money_cast(subq.c.base_price / rate).label('unit_price'),
                money_cast(func.sum(subq.c.base_price) / rate).label('price')
            )
            .group_by(subq.c.id, subq.c.name, subq.c.base_price)
            .order_by(subq.c.name)
        )

    @classmethod
    def accounts_items_info(cls, resource_id, currency_id=None):
        tour_sale = (
            DBSession.query(TourSale)
            .filter(TourSale.resource_id == resource_id)
            .first()
        )
        rate = query_convert_rates(currency_id, tour_sale.deal_date).scalar()
        if not rate:
            rate = 1
        query = (
            DBSession.query(
                AccountItem.id.label('id'),
                AccountItem.name.label('name'),
                TourSale.base_price.label('base_price')
            )
            .join(Service, TourSale.service)
            .join(AccountItem, Service.account_item)
            .filter(TourSale.id == tour_sale.id)
        )
        subq = query.subquery()
        return (
            DBSession.query(
                subq.c.id,
                subq.c.name,
                func.count(subq.c.id).label('cnt'),
                money_cast(func.sum(subq.c.base_price) / rate).label('price')
            )
            .group_by(subq.c.id, subq.c.name)
            .order_by(subq.c.name)
        )
