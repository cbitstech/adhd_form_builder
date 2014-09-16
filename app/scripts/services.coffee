'use strict'

angular.module('adhdApp')

  .factory 'ApiResource', ($resource, $http) ->
    (resource, args) ->
      Resource = $resource "/api/#{resource}/:id"
      , # Default arguments
        args
      , # Override methods
        query:
          method: 'GET'
          isArray: false
      Resource.update = (id, data) ->
        # We need to remove special attributes starting with _ since they are
        # not defined in the schema and the data will not validate and the
        # update be rejected
        putdata = {}
        for k, v of data when k[0] != '_'
          putdata[k] = v
        $http.put("/api/#{resource}/"+id, putdata,
                  headers: {'If-Match': data._etag})
        .success (res, status) ->
          if status == 200 and res._status == 'OK'
            data._etag = res._etag
          if status == 200 and res._status == 'ERR'
            console.log res._issues
      Resource.patch = (id, data, etag) ->
        $http
          method: 'PATCH'
          url: "/api/#{resource}/"+id
          data: data
          headers: {'If-Match': etag}
      return Resource

  .factory 'Question', (ApiResource) ->
    ApiResource 'questions'

  .factory 'QuestionResponse', (ApiResource) ->
    ApiResource 'question_responses'

  .factory 'UserResponse', (ApiResource) ->
    ApiResource 'user_responses'
