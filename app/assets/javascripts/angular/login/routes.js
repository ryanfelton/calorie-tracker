(function () {
  'use strict';

  angular.module('app.login').config(config);

  function config($stateProvider, $urlRouterProvider) {
    $stateProvider.state('login', {
      url: '/login',
      templateUrl: 'angular/login/_form.html'
    })
  }

})();
