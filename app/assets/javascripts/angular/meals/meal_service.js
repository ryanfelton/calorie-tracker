(function () {
  'use strict';

  angular.module('app.meals').factory('mealService', mealService);

  function mealService($resource) {

    var resourceForUser = function (user) {
      return $resource('/api/users/:user_id/meals/:id.json', { id: '@id', user_id: user.user_id }, {
        update: {
          method: 'PATCH'
        }});
    };

    return {
      resourceForUser: resourceForUser
    }
  }

})();
