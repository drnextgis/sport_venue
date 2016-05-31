# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from .models import (
    DBSession,
    Base,
    Club,
    Coach,
    Competition,
    CompetitionResult,
    Organization,
    Sportsman,
    SportsmanClass,
    SportType,
    Venue,
    VenueType,
    VenueAttribute,
    VenueTypeAttribute,
    )


def sacrud_settings(config):
    config.include('pyramid_sacrud', route_prefix='admin')
    config.registry.settings['pyramid_sacrud.models'] = (
        ('Сооружения',
            (Venue,
             VenueType,
             VenueAttribute,
             VenueTypeAttribute)),
        ('Спортсмены',
            (Sportsman,
             SportsmanClass,
             Coach,
             Club,
             SportType)),
        ('Соревнования',
            (Competition,
             CompetitionResult,
             Organization)))


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.bind = (engine)
    config = Configurator(settings=settings)
    config.include('ps_alchemy')
    config.include(sacrud_settings)
    config.add_jinja2_search_path('templates/')
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('home', '/')

    config.add_route('collection', '/api/{table_name}/collection/')
    config.add_route('sql10', '/api/query/10')
    config.add_route('sql12', '/api/query/12')

    config.scan()
    return config.make_wsgi_app()
