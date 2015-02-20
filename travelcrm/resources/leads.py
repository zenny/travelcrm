# -*-coding: utf-8 -*-
from zope.interface import implementer

from ..interfaces import (
    IResourceType,
)
from ..resources import (
    Root,
)
from ..resources import (
    ResourceTypeBase,
)
from ..lib.utils.common_utils import translate as _


@implementer(IResourceType)
class Leads(ResourceTypeBase):

    __name__ = 'leads'

    def __init__(self, request):
        self.__parent__ = Root(request)
        self.request = request

    @property
    def allowed_permisions(self):
        return [
            ('add', _(u'add')),
            ('view', _(u'view')),
            ('edit', _(u'edit')),
            ('delete', _(u'delete')),
        ]
