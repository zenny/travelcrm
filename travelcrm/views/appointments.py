# -*-coding: utf-8-*-

import logging

from pyramid.view import view_config, view_defaults
from pyramid.httpexceptions import HTTPFound

from . import BaseView
from ..models import DBSession
from ..models.appointment import Appointment
from ..lib.bl.subscriptions import subscribe_resource
from ..lib.utils.common_utils import translate as _
from travelcrm.forms.appointments import (
    AppointmentForm, 
    AppointmentSearchForm,
    AppointmentAssignForm,
)
from ..lib.events.resources import (
    ResourceCreated,
    ResourceChanged,
    ResourceDeleted,
)


log = logging.getLogger(__name__)


@view_defaults(
    context='..resources.appointments.AppointmentsResource',
)
class AppointmentsView(BaseView):

    @view_config(
        request_method='GET',
        renderer='travelcrm:templates/appointments/index.mako',
        permission='view'
    )
    def index(self):
        return {
            'title': self._get_title(),
        }

    @view_config(
        name='list',
        xhr='True',
        request_method='POST',
        renderer='json',
        permission='view'
    )
    def list(self):
        form = AppointmentSearchForm(self.request, self.context)
        form.validate()
        qb = form.submit()
        return {
            'total': qb.get_count(),
            'rows': qb.get_serialized()
        }

    @view_config(
        name='view',
        request_method='GET',
        renderer='travelcrm:templates/appointments/form.mako',
        permission='view'
    )
    def view(self):
        if self.request.params.get('rid'):
            resource_id = self.request.params.get('rid')
            appointment = Appointment.by_resource_id(resource_id)
            return HTTPFound(
                location=self.request.resource_url(
                    self.context, 'view', query={'id': appointment.id}
                )
            )
        result = self.edit()
        result.update({
            'title': self._get_title(_(u'View')),
            'readonly': True,
        })
        return result

    @view_config(
        name='add',
        request_method='GET',
        renderer='travelcrm:templates/appointments/form.mako',
        permission='add'
    )
    def add(self):
        return {
            'title': self._get_title(_(u'Add')),
        }

    @view_config(
        name='add',
        request_method='POST',
        renderer='json',
        permission='add'
    )
    def _add(self):
        form = AppointmentForm(self.request)
        if form.validate():
            appointment = form.submit()
            DBSession.add(appointment)
            DBSession.flush()
            event = ResourceCreated(self.request, appointment)
            event.registry()
            return {
                'success_message': _(u'Saved'),
                'response': appointment.id
            }
        else:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': form.errors
            }

    @view_config(
        name='edit',
        request_method='GET',
        renderer='travelcrm:templates/appointments/form.mako',
        permission='edit'
    )
    def edit(self):
        appointment = Appointment.get(self.request.params.get('id'))
        return {
            'item': appointment,
            'title': self._get_title(_(u'Edit')),
        }

    @view_config(
        name='edit',
        request_method='POST',
        renderer='json',
        permission='edit'
    )
    def _edit(self):
        appointment = Appointment.get(self.request.params.get('id'))
        form = AppointmentForm(self.request)
        if form.validate():
            form.submit(appointment)
            event = ResourceChanged(self.request, appointment)
            event.registry()
            return {
                'success_message': _(u'Saved'),
                'response': appointment.id
            }
        else:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': form.errors
            }

    @view_config(
        name='copy',
        request_method='GET',
        renderer='travelcrm:templates/appointments/form.mako',
        permission='add'
    )
    def copy(self):
        resources_type = Appointment.get_copy(self.request.params.get('id'))
        return {
            'action': self.request.path_url,
            'item': resources_type,
            'title': self._get_title(_(u'Copy')),
        }

    @view_config(
        name='copy',
        request_method='POST',
        renderer='json',
        permission='add'
    )
    def _copy(self):
        return self._add()

    @view_config(
        name='delete',
        request_method='GET',
        renderer='travelcrm:templates/appointments/delete.mako',
        permission='delete'
    )
    def delete(self):
        return {
            'title': self._get_title(_(u'Delete')),
            'rid': self.request.params.get('rid')
        }

    @view_config(
        name='delete',
        request_method='POST',
        renderer='json',
        permission='delete'
    )
    def _delete(self):
        errors = False
        ids = self.request.params.getall('id')
        if ids:
            try:
                items = DBSession.query(Appointment).filter(
                    Appointment.id.in_(ids)
                )
                for item in items:
                    DBSession.delete(item)
                    event = ResourceDeleted(self.request, item)
                    event.registry()
                DBSession.flush()
            except:
                errors=True
                DBSession.rollback()
        if errors:
            return {
                'error_message': _(
                    u'Some objects could not be delete'
                ),
            }
        return {'success_message': _(u'Deleted')}

    @view_config(
        name='assign',
        request_method='GET',
        renderer='travelcrm:templates/appointments/assign.mako',
        permission='assign'
    )
    def assign(self):
        return {
            'id': self.request.params.get('id'),
            'title': self._get_title(_(u'Assign Maintainer')),
        }

    @view_config(
        name='assign',
        request_method='POST',
        renderer='json',
        permission='assign'
    )
    def _assign(self):
        form = AppointmentAssignForm(self.request)
        if form.validate():
            form.submit(self.request.params.getall('id'))
            return {
                'success_message': _(u'Assigned'),
            }
        else:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': form.errors
            }

    @view_config(
        name='subscribe',
        request_method='GET',
        renderer='travelcrm:templates/appointments/subscribe.mako',
        permission='view'
    )
    def subscribe(self):
        return {
            'id': self.request.params.get('id'),
            'title': self._get_title(_(u'Subscribe')),
        }

    @view_config(
        name='subscribe',
        request_method='POST',
        renderer='json',
        permission='view'
    )
    def _subscribe(self):
        ids = self.request.params.getall('id')
        for id in ids:
            appointment = Appointment.get(id)
            subscribe_resource(self.request, appointment.resource)
        return {
            'success_message': _(u'Subscribed'),
        }
