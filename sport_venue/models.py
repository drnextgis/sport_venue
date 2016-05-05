# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from sqlalchemy import (
    Table,
    Column,
    ForeignKey,
    Integer,
    Unicode,
    Date,
    Enum,
    CheckConstraint,
    PrimaryKeyConstraint,
    )

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import (
    scoped_session,
    sessionmaker,
    relationship
    )

from zope.sqlalchemy import ZopeTransactionExtension


DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
Base = declarative_base()

sportsman_class_types = (
    'Кандидат в мастера спорта России',
    '1-й спортивный разряд',
    '2-й спортивный разряд',
    '3-й спортивный разряд',
    '4-й спортивный разряд по шахматам',
    '1-й юношеский разряд',
    '2-й юношеский разряд',
    '3-й юношеский разряд')

sportsman_coach = Table('sportsman_coach', Base.metadata,
                        Column('sportsman_id', Integer,
                               ForeignKey('sportsman.id')),
                        Column('coach_id', Integer,
                               ForeignKey('coach.id')),
                        PrimaryKeyConstraint('sportsman_id', 'coach_id'))

competition_venue = Table('competition_venue', Base.metadata,
                          Column('competition_id', Integer,
                                 ForeignKey('competition.id')),
                          Column('venue_id', Integer,
                                 ForeignKey('venue.id')),
                          PrimaryKeyConstraint('competition_id', 'venue_id'))


class VenueType(Base):
    __tablename__ = 'venue_type'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)

    def __repr__(self):
        return '%s' % (self.name,)


class VenueTypeAttribute(Base):
    __tablename__ = 'venue_type_attribute'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)
    venue_type_id = Column(Integer, ForeignKey('venue_type.id'),
                           nullable=False)
    venue_type = relationship('VenueType')

    def __repr__(self):
        return '%s (%s)' % (self.name, self.venue_type)


class Venue(Base):
    __tablename__ = 'venue'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)
    address = Column(Unicode, nullable=False)
    venue_type_id = Column(Integer, ForeignKey('venue_type.id'),
                           nullable=False)
    venue_type = relationship('VenueType')

    def __repr__(self):
        return '%s' % (self.name,)


class VenueAttribute(Base):
    __tablename__ = 'venue_attribute'
    attribute_id = Column(Integer, ForeignKey('venue_type_attribute.id'),
                          primary_key=True)
    venue_id = Column(Integer, ForeignKey('venue.id'),
                      primary_key=True)
    value = Column(Unicode)
    attribute = relationship('VenueTypeAttribute')
    venue = relationship('Venue')


class Club(Base):
    __tablename__ = 'club'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)

    def __repr__(self):
        return '%s' % (self.name,)


class Sportsman(Base):
    __tablename__ = 'sportsman'
    id = Column(Integer, primary_key=True)
    firstname = Column(Unicode, nullable=False)
    lastname = Column(Unicode, nullable=False)
    club_id = Column(Integer, ForeignKey('club.id'))
    coaches = relationship('Coach',
                           secondary=sportsman_coach,
                           backref='sportsmen')
    club = relationship('Club')

    def __repr__(self):
        return '%s %s' % (self.firstname, self.lastname)


class Coach(Base):
    __tablename__ = 'coach'
    id = Column(Integer, primary_key=True)
    firstname = Column(Unicode, nullable=False)
    lastname = Column(Unicode, nullable=False)
    sport_type_id = Column(Integer, ForeignKey('sport_type.id'),
                           nullable=False)
    sport_type = relationship('SportType')

    def __repr__(self):
        return '%s %s' % (self.firstname, self.lastname)


class SportsmanClass(Base):
    __tablename__ = 'sportsman_class'
    sportsman_id = Column(Integer, ForeignKey('sportsman.id'),
                          nullable=False, primary_key=True)
    sport_type_id = Column(Integer, ForeignKey('sport_type.id'),
                           nullable=False, primary_key=True)
    class_ = Column('class', Enum(*sportsman_class_types,
                                  name='sportsman_class_types'))
    sport_type = relationship('SportType')


class SportType(Base):
    __tablename__ = 'sport_type'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)

    def __repr__(self):
        return '%s' % (self.name,)


class Organization(Base):
    __tablename__ = 'organization'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)

    def __repr__(self):
        return '%s' % (self.name,)


class Competition(Base):
    __tablename__ = 'competition'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)
    organization_id = Column(Integer, ForeignKey('organization.id'),
                             nullable=False)
    sport_type_id = Column(Integer, ForeignKey('sport_type.id'),
                           nullable=False)
    date_start = Column(Date, nullable=False)
    date_end = Column(Date, nullable=False)
    venues = relationship('Venue',
                          secondary=competition_venue,
                          backref='competitions')
    organization = relationship('Organization')
    sport_type = relationship('SportType')

    def __repr__(self):
        return '%s (%s - %s) [%s]' % (self.name,
                                     self.date_start.strftime('%d.%m.%Y'),
                                     self.date_end.strftime('%d.%m.%Y'),
                                     self.sport_type)


class CompetitionResult(Base):
    __tablename__ = 'competition_result'
    id = Column(Integer, primary_key=True)
    competition_id = Column(Integer, ForeignKey('competition.id'),
                            nullable=False)
    sportsman_id = Column(Integer, ForeignKey('sportsman.id'),
                          nullable=False)
    place = Column(Integer, CheckConstraint('place>0'), nullable=False)
    competition = relationship('Competition')
    sportsman = relationship('Sportsman')
