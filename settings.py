"""Global API configuration."""

from os import environ
from urlparse import urlparse

API_NAME = 'ADHD'
URL_PREFIX = 'api'
if 'EVE_DEBUG' in environ:
    DEBUG = True

if 'MONGOLAB_URI' in environ:
    url = urlparse(environ['MONGOLAB_URI'])
    MONGO_HOST = url.hostname
    MONGO_PORT = url.port
    MONGO_USERNAME = url.username
    MONGO_PASSWORD = url.password
    MONGO_DBNAME = url.path[1:]
else:
    MONGO_DBNAME = API_NAME

questions = {
    "item_title": "questions",
    "schema": {},
    "resource_methods": ['GET', 'POST', 'DELETE'],
}

question_responses = {
    "item_title": "question_responses",
    "schema": {},
    "resource_methods": ['GET', 'POST', 'DELETE'],
}

user_responses = {
    "item_title": "user_responses",
    "schema": {},
    "resource_methods": ['GET', 'POST', 'DELETE'],
}

DOMAIN = {
    'questions': questions,
    'question_responses': question_responses,
    'user_responses': user_responses,
}

# FIXME: Temporarily allow CORS requests for development purposes
X_DOMAINS = "*"
