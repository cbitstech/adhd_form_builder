question_schema = {
    'questionGroup': {'type': 'string'},
    'order': {'type': 'int'},
    'type': {
        'type': 'string',
        'allowed': ['color',
                    'date',
                    'datetime',
                    'datetime-local',
                    'email',
                    'month',
                    'number',
                    'range',
                    'search',
                    'tel',
                    'time',
                    'url',
                    'week']
    },
    'content': {'type': 'string'},
    'questionDataLabel': {'type': 'string'},
    'responseGroupId': {'type': 'string'},
    'required': {'type': 'boolean', 'default': True},
}

question_response_schema = {
    'responseGroupId': {'type': 'string'},
    'responseGroupLabel': {'type': 'string'},
    'order': {'type': 'int'},
    'label': {'type': 'string'},
    'value': {'type': 'string'},
}

user_response_schema = {
    'userId': {'type': 'string'},
    'questionDataLabel': {'type': 'string'},
    'value': {'type': 'string'},
    'sessionGUID': {'type': 'uuid'}
}
