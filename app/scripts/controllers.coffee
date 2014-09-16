'use strict'

angular.module('adhdApp')
  .controller 'MainCtrl', ($scope, Question, QuestionResponse) ->
    $scope.fb = new Formbuilder(
      selector: ".fb-main"
      bootstrapData: [
          label: "Fail to give close attention to details or made careless mistakes in my work"
          field_type: "radio"
          required: true
          field_options:
            options: [
                label: "Never or Rarely"
                checked: false
              ,
                label: "Sometimes"
                checked: false
              ,
                label: "Often"
                checked: false
              ,
                label: "Very Often"
                checked: false
            ]
          cid: "c1"
        ,
          label: "Fidget with hands or feet or squirm"
          field_type: "radio"
          required: true
          field_options:
            options: [
                label: "Never or Rarely"
                checked: false
              ,
                label: "Sometimes"
                checked: false
              ,
                label: "Often"
                checked: false
              ,
                label: "Very Often"
                checked: false
            ]
          cid: "c1"
        ,
          label: "Have difficulty sustaining my attention in tasks or fun activities"
          field_type: "radio"
          required: true
          field_options:
            options: [
                label: "Never or Rarely"
                checked: false
              ,
                label: "Sometimes"
                checked: false
              ,
                label: "Often"
                checked: false
              ,
                label: "Very Often"
                checked: false
            ]
          cid: "c1"
        ,
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
