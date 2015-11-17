(function () {
  'use strict';

  angular.module('app.meals').controller('MealsController', MealsController);

  function MealsController($scope, mealService) {
    var vm = this;
    // vm.startDatetime = moment().startOf('week');
    // vm.endDatetime = moment().endOf('week');
    vm.startDatetime = moment().subtract(10, 'days');
    vm.endDatetime = moment().add(1, 'days');

    var mealResource = mealService.resourceForUser($scope.currentUserService.getCurrentUser());

    vm.meals = mealResource.query();

    vm.timeOfDay = 'all';

    vm.new = function () {
      var now = new Date();
      vm.newMeal = {
        'consumed_at': now
      }
    };

    vm.newCancel = function () {
      vm.newMeal = null;
    };

    vm.create = function () {
      var meal = mealResource.save(vm.newMeal);
      vm.meals.push(meal);
      vm.newMeal = null;
    };

    vm.edit = function (meal) {
      vm.editedMealMarker = meal;
      vm.clonedMeal = angular.extend({}, meal);
    };

    vm.editCancel = function () {
      vm.editedMealMarker = null;
      vm.clonedMeal = null;
    };

    vm.update = function () {
      mealResource.update(vm.clonedMeal);
      vm.meals.splice(vm.meals.indexOf(vm.editedMealMarker), 1, vm.clonedMeal);
      vm.editedMealMarker = null;
      vm.clonedMeal = null;
    };

    vm.destroy = function (meal) {
      mealResource.delete(meal);
      vm.meals.splice(vm.meals.indexOf(meal), 1);
    }
  }

})();
