# -*-coding: utf-8-*-

import logging
import colander

from pyramid.view import view_config

from ..models import DBSession
from ..models.user import User
from ..lib.qb.users import UsersQueryBuilder

from ..forms.users import (
    UserAddSchema,
    UserEditSchema
)


log = logging.getLogger(__name__)


class Users(object):

    def __init__(self, context, request):
        self.context = context
        self.request = request

    @view_config(
        context='..resources.users.Users',
        request_method='GET',
        renderer='travelcrm:templates/users/index.mak',
        permission='view'
    )
    def index(self):
        return {}

    @view_config(
        name='list',
        context='..resources.users.Users',
        xhr='True',
        request_method='POST',
        renderer='json',
        permission='view'
    )
    def list(self):
        qb = UsersQueryBuilder(self.context)
        qb.search_simple(self.request.params.get('q'))
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
        context='..resources.users.Users',
        request_method='GET',
        renderer='travelcrm:templates/users/form.mak',
        permission='add'
    )
    def add(self):
        _ = self.request.translate
        return {'title': _(u'Add User')}

    @view_config(
        name='add',
        context='..resources.users.Users',
        request_method='POST',
        renderer='json',
        permission='add'
    )
    def _add(self):
        _ = self.request.translate
        schema = UserAddSchema().bind(request=self.request)

        try:
            controls = schema.deserialize(self.request.params)
            user = User(
                username=controls.get('username'),
                password=controls.get('password'),
                employee_id=controls.get('employee_id'),
                resource=self.context.create_resource(controls.get('status'))
            )
            DBSession.add(user)
            return {'success_message': _(u'Saved')}
        except colander.Invalid, e:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': e.asdict()
            }

    @view_config(
        name='edit',
        context='..resources.users.Users',
        request_method='GET',
        renderer='travelcrm:templates/users/form.mak',
        permission='edit'
    )
    def edit(self):
        _ = self.request.translate
        user = User.get(self.request.params.get('id'))
        return {'item': user, 'title': _(u'Edit User')}

    @view_config(
        name='edit',
        context='..resources.users.Users',
        request_method='POST',
        renderer='json',
        permission='edit'
    )
    def _edit(self):
        _ = self.request.translate
        schema = UserEditSchema().bind(request=self.request)
        user = User.get(self.request.params.get('id'))
        try:
            controls = schema.deserialize(self.request.params)
            user.username = controls.get('username')
            user.employee_is = controls.get('employee_id')
            user.resource.status = controls.get('status')
            if controls.get('password'):
                user.password = controls.get('password')
            return {'success_message': _(u'Saved')}
        except colander.Invalid, e:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': e.asdict()
            }

    @view_config(
        name='delete',
        context='..resources.users.Users',
        request_method='GET',
        renderer='travelcrm:templates/users/delete.mak',
        permission='delete'
    )
    def delete(self):
        return {
            'rid': self.request.params.get('rid')
        }

    @view_config(
        name='delete',
        context='..resources.users.Users',
        request_method='POST',
        renderer='json',
        permission='delete'
    )
    def _delete(self):
        _ = self.request.translate
        for id in self.request.params.getall('id'):
            user = User.get(id)
            if user:
                DBSession.delete(user)
        return {'success_message': _(u'Deleted')}