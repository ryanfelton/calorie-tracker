(function () {
  'use strict';

  angular.module('app.signup').config(config);

  function config($stateProvider, $urlRouterProvider) {
    $stateProvider.state('createUser', {
      url: '/create-user',
      templateUrl: 'angular/signup/_form.html'
    })
  }

})();
