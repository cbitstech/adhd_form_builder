'use strict'

###*
 # @ngdoc overview
 # @name adhdFormBuilderApp
 # @description
 # # adhdFormBuilderApp
 #
 # Main module of the application.
###
angular
  .module('adhdApp', [
    'ngResource',
    'ngRoute'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

