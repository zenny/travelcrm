# -*-coding: utf-8 -*-

import colander

from . import ResourceSchema
from ..models.touroperator import Touroperator
from ..lib.utils.common_utils import translate as _


@colander.deferred
def name_validator(node, kw):
    request = kw.get('request')

    def validator(node, value):
        touroperator = Touroperator.by_name(value)
        if (
            touroperator
            and str(touroperator.id) != request.params.get('id')
        ):
            raise colander.Invalid(
                node,
                _(u'Room category with the same name exists'),
            )
    return colander.All(colander.Length(max=32), validator,)


class TouroperatorSchema(ResourceSchema):
    name = colander.SchemaNode(
        colander.String(),
    )
    licence_id = colander.SchemaNode(
        colander.Set(),
        missing=[],
    )
    bperson_id = colander.SchemaNode(
        colander.Set(),
        missing=[],
    )
    bank_detail_id = colander.SchemaNode(
        colander.Set(),
        missing=[],
    )

    def deserialize(self, cstruct):
        if (
            'licence_id' in cstruct
            and not isinstance(cstruct.get('licence_id'), list)
        ):
            val = cstruct['licence_id']
            cstruct['licence_id'] = list()
            cstruct['licence_id'].append(val)

        if (
            'bperson_id' in cstruct
            and not isinstance(cstruct.get('bperson_id'), list)
        ):
            val = cstruct['bperson_id']
            cstruct['bperson_id'] = list()
            cstruct['bperson_id'].append(val)

        if (
            'bank_detail_id' in cstruct
            and not isinstance(cstruct.get('bank_detail_id'), list)
        ):
            val = cstruct['bank_detail_id']
            cstruct['bank_detail_id'] = list()
            cstruct['bank_detail_id'].append(val)

        return super(TouroperatorSchema, self).deserialize(cstruct)
