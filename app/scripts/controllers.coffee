'use strict'

angular.module('adhdApp')
  .controller 'MainCtrl', ($scope, Question, QuestionResponse) ->
    $scope.fb = new Formbuilder(
      selector: ".fb-main"
      bootstrapData: [
        {
          label: "Do you have a website?"
          field_type: "website"
          required: false
          field_options: {}
          cid: "c1"
        }
        {
          label: "Please enter your clearance number"
          field_type: "text"
          required: true
          field_options: {}
          cid: "c6"
        }
        {
          label: "Security personnel #82?"
          field_type: "radio"
          required: true
          field_options:
            options: [
              {
                label: "Yes"
                checked: false
              }
              {
                label: "No"
                checked: false
              }
            ]
            include_other_option: true

          cid: "c10"
        }
        {
          label: "Medical history"
          field_type: "file"
          required: true
          field_options: {}
          cid: "c14"
        }
      ]
    )
    $scope.fb.on "save", (payload) ->
      console.log payload
      for q, i in JSON.parse(payload).fields
        question =
          content: q.field_options.description || ''
          label: q.label
          order: i
          questionDataLabel: q.cid
          questionGroup: q.cid
          responseGroupId: q.cid
          required: q.required
          type: q.field_type
        Question.save question, (new_question) ->
          console.log new_question
        if q.field_options.options?
          for r, j in q.field_options.options
            response =
              label: r.label
              order: j
              responseGroupId: q.cid
              responseGroupLabel: "#{q.cid}q#{j}"
              value: r.label
        QuestionResponse.save response, (new_response) ->
          console.log new_response
  .controller 'AboutCtrl', ($scope) ->
    return
