(function () {
  'use strict';

  angular.module('app.signup').controller('SignupController', SignupController);

  function SignupController($scope, signupService, $state) {
    var vm = this;

    vm.newUser = {};

    vm.create = function () {

      var promise = signupService.create(vm.newUser.email, vm.newUser.password, vm.newUser.password_confirmation);

      promise.then(
        function (result) {
          $scope.showAlert('User created, please login.');
          $state.go('login');

        }, function (error) {
          try {
            _.each(error.data, function (errors, key) {
              _.each(errors, function (e) {
                $scope.form[key].$dirty = true;
                // TODO: there's a bug here, this invalidity is not cleared when changing the form ...
                $scope.form[key].$setValidity(e.replace(/ /g, "_"), false);
              });
            });
          } catch (e) {
            // If something's wrong with the server.
            $scope.showAlert('Error, please try again.', 'danger');
          }
        });
    };
  }

})();
