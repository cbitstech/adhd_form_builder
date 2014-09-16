'use strict'

angular.module('adhdApp')
  .controller 'MainCtrl', ($scope) ->
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
  .controller 'AboutCtrl', ($scope) ->
    return
