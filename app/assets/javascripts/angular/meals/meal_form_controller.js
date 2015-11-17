(function () {
  'use strict';

  angular.module('app.meals').controller('MealFormController', MealFormController);

  function MealFormController($scope) {
    $scope.closeDropdown = function () {
      $scope.dropdownOpen = false;
    }
  }

})();
