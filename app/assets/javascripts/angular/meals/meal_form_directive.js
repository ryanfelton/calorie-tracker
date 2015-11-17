(function () {
  'use strict';

  angular.module('app.meals').directive('mealForm', mealForm);

  function mealForm() {
    return {
      restrict: 'E',
      controller: 'MealFormController',
      scope: {
        meal: '=meal'
      },
      templateUrl: 'angular/meals/_form.html'
    }
  }

})();
