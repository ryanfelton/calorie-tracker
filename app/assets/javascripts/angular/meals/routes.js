(function () {
  'use strict';

  angular.module('app.meals').config(config);

  function config($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('meals');

    $stateProvider.state('meals', {
      url: '/meals',
      templateUrl: 'angular/meals/_meals.html',
      resolve: {
        auth: ["$q", "currentUserService", function ($q, currentUserService) {

          var currentUser = currentUserService.getCurrentUser();

          if (currentUser) {
            return $q.when(currentUser);
          } else {
            return $q.reject({ authenticated: false });
          }
        }]
      }
    })
  }

})();
