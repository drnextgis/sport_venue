from pyramid.response import Response
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPNotFound

from sqlalchemy.exc import DBAPIError
from sqlalchemy import func

from .models import (
    Base,
    DBSession,
    Coach,
    Organization,
    Competition
    )


@view_config(route_name='home', renderer='home.jinja2')
def my_view(request):
    return dict()


@view_config(route_name='collection', renderer='json')
def cget(request):
    cls = None
    result = []

    table_name = request.matchdict['table_name']
    for c in Base._decl_class_registry.values():
        if hasattr(c, '__table__') and c.__table__.fullname == table_name:
            cls = c

    if cls is None:
        raise HTTPNotFound
    else:
        query = DBSession.query(cls)
        for itm in query.all():
            result.append(itm.as_json_dict())

    return result


@view_config(route_name='sql10', renderer='table.jinja2')
def sql10(request):
    result = []
    sport_type = request.GET.get('sport_type')

    query = DBSession.query(Coach).filter_by(sport_type_id=int(sport_type))

    if sport_type is not None:
        query = query.filter_by(sport_type_id=int(sport_type))

    for itm in query.all():
        result.append(itm.as_json_dict())

    return dict(result=result)


@view_config(route_name='sql12', renderer='table.jinja2')
def sql12(request):
    result = []
    date_start = request.GET.get('date_start')
    date_end = request.GET.get('date_end')

    query = DBSession.query(
        Organization.id,
        Organization.name,
        func.count(Competition.id).label('count')
    ). \
        join(Competition). \
        filter(Competition.date_start > date_start). \
        filter(Competition.date_end < date_end). \
        group_by(Organization.id)

    for itm in query.all():
        result.append(dict(id=itm.id, name=itm.name, count=itm.count))

    return dict(result=result)
