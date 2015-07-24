# -*-coding: utf-8-*-

import logging

from pyramid.view import view_config, view_defaults
from pyramid.httpexceptions import HTTPFound

from . import BaseView
from ..models import DBSession
from ..models.structure import Structure
from ..lib.utils.common_utils import translate as _
from ..forms.structures import (
    StructureForm, 
    StructureSearchForm
)


log = logging.getLogger(__name__)


@view_defaults(
    context='..resources.structures.StructuresResource',
)
class StructuresView(BaseView):

    @view_config(
        request_method='GET',
        renderer='travelcrm:templates/structures/index.mako',
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
        form = StructureSearchForm(self.request, self.context)
        form.validate()
        qb = form.submit()
        return qb.get_serialized()

    @view_config(
        name='view',
        request_method='GET',
        renderer='travelcrm:templates/structures/form.mako',
        permission='view'
    )
    def view(self):
        if self.request.params.get('rid'):
            resource_id = self.request.params.get('rid')
            structure = Structure.by_resource_id(resource_id)
            return HTTPFound(
                location=self.request.resource_url(
                    self.context, 'view', query={'id': structure.id}
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
        renderer='travelcrm:templates/structures/form.mako',
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
        form = StructureForm(self.request)
        if form.validate():
            structure = form.submit()
            DBSession.add(structure)
            return {'success_message': _(u'Saved')}
        else:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': form.errors
            }

    @view_config(
        name='edit',
        request_method='GET',
        renderer='travelcrm:templates/structures/form.mako',
        permission='edit'
    )
    def edit(self):
        structure = Structure.get(self.request.params.get('id'))
        return {
            'title': self._get_title(_(u'Edit')),
            'item': structure,
        }

    @view_config(
        name='edit',
        request_method='POST',
        renderer='json',
        permission='edit'
    )
    def _edit(self):
        structure = Structure.get(self.request.params.get('id'))
        form = StructureForm(self.request)
        if form.validate():
            form.submit(structure)
            return {'success_message': _(u'Saved')}
        else:
            return {
                'error_message': _(u'Please, check errors'),
                'errors': form.errors
            }

    @view_config(
        name='copy',
        request_method='GET',
        renderer='travelcrm:templates/structures/form.mako',
        permission='add'
    )
    def copy(self):
        structure = Structure.get(self.request.params.get('id'))
        return {
            'title': self._get_title(_(u'Copy')),
            'item': structure,
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
        renderer='travelcrm:templates/structures/delete.mako',
        permission='delete'
    )
    def delete(self):
        return {
            'title': self._get_title(_(u'Delete')),
            'id': self.request.params.get('id')
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
                (
                    DBSession.query(Structure)
                    .filter(Structure.id.in_(ids))
                    .delete()
                )
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
