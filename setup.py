import os

from setuptools import setup, find_packages

requires = [
    'pyramid',
    'pyramid_chameleon',
    'pyramid_debugtoolbar',
    'pyramid_tm',
    'SQLAlchemy',
    'transaction',
    'zope.sqlalchemy',
    'waitress',
    'psycopg2',
    'pyramid_sacrud',
    'ps_alchemy',
    ]

setup(name='sport_venue',
      version='0.0',
      description='sport_venue',
      long_description="",
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pyramid",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author='',
      author_email='',
      url='',
      keywords='web wsgi bfg pylons pyramid',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      test_suite='sport_venue',
      install_requires=requires,
      entry_points="""\
      [paste.app_factory]
      main = sport_venue:main
      [console_scripts]
      initialize_sport_venue_db = sport_venue.scripts.initializedb:main
      """,
      )
