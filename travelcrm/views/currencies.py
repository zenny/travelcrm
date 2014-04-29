# -*-coding: utf-8-*-

import logging
import colander

from pyramid.view import view_config

from ..models import DBSession
from ..models.currency import Currency
from ..lib.qb.currencies import CurrenciesQueryBuilder
from ..lib.utils.common_utils import translate as _

from ..forms.currencies import CurrencySchema


log = logging.getLogger(__name__)


class Currencies(object):

    def __init__(self, context, request):
        self.context = context
        self.request = request

    @view_config(
        context='..resources.currencies.Currencies',
        request_method='GET',
        renderer='travelcrm:templates/currencies/index.mak',
        permission='view'
    )
    def index(self):
        return {}

    @view_config(
        name='list',
        context='..resources.currencies.Currencies',
        xhr='True',
        request_method='POST',
        renderer='json',
        permission='view'
    )
    def list(self):
        qb = CurrenciesQueryBuilder(self.context)
        qb.search_simple(
            self.request.params.get('q'),
        )
        qb.advanced_search(
            updated_from=self.request.params.get('updated_from'),
            updated_to=self.request.params.get('updated_to'),
            modifier_id=self.request.params.get('modifier_id'),
        )
        id = self.request.params.get('id')
        if id:
            qb.filter_id(id.split(','))
        qb.sort_query(
            self.request.params.get('sort'),
            self.request.params.get('order', 'asc')
        )
        qb.page_query(
            int(self.request.params.get('rows')),
            int(self.request.params.get('page'))
        )
        return {
            'total': qb.get_count(),
            'rows': qb.get_serialized()
        }

    @view_config(
        name='add',
        context='..resources.currencies.Currencies',
        request_method='GET',
        renderer='travelcrm:templates/currencies/form.mak',
        permission='add'
    )
    def add(self):
        return {'title': _(u'Add Currency')}

    @view_config(
        name='add',
        context='..resources.currencies.Currencies',
        request_method='POST',
        renderer='json',
        permission='add'
    )
    def _add(self):
        schema = CurrencySchema().bind(request=self.request)

        try:
            controls = schema.deserialize(self.request.params)
            currency = Currency(
                iso_code=controls.get('iso_code'),
                resource=self.context.create_resource()
            )
            DBSession.add(currency)
            DBSession.flush()
            return {
                'success_message': _(u'Saved'),
                'response': currency.id
            }
        except colander.Invalid, e:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': e.asdict()
            }

    @view_config(
        name='edit',
        context='..resources.currencies.Currencies',
        request_method='GET',
        renderer='travelcrm:templates/currencies/form.mak',
        permission='edit'
    )
    def edit(self):
        currency = Currency.get(self.request.params.get('id'))
        return {'item': currency, 'title': _(u'Edit Currency')}

    @view_config(
        name='edit',
        context='..resources.currencies.Currencies',
        request_method='POST',
        renderer='json',
        permission='edit'
    )
    def _edit(self):
        schema = CurrencySchema().bind(request=self.request)
        currency = Currency.get(self.request.params.get('id'))
        try:
            controls = schema.deserialize(self.request.params)
            currency.iso_code = controls.get('iso_code')
            return {
                'success_message': _(u'Saved'),
                'response': currency.id
            }
        except colander.Invalid, e:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': e.asdict()
            }

    @view_config(
        name='delete',
        context='..resources.currencies.Currencies',
        request_method='GET',
        renderer='travelcrm:templates/currencies/delete.mak',
        permission='delete'
    )
    def delete(self):
        return {
            'id': self.request.params.get('id')
        }

    @view_config(
        name='delete',
        context='..resources.currencies.Currencies',
        request_method='POST',
        renderer='json',
        permission='delete'
    )
    def _delete(self):
        for id in self.request.params.getall('id'):
            currency = Currency.get(id)
            if currency:
                DBSession.delete(currency)
        return {'success_message': _(u'Deleted')}
