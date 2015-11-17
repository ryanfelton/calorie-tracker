(function () {
  'use strict';

  angular.module('app.signup').factory('signupService', signupService);

  function signupService($http, $q) {

    function create(email, password, password_confirmation) {

      var deferred = $q.defer();

      $http.post("/api/users.json", {
        user: {
          email: email,
          password: password,
          password_confirmation: password_confirmation
        }
      }).then(function (result) {
        deferred.resolve(result);
      }, function (error) {
        deferred.reject(error);
      });

      return deferred.promise;
    }

    return {
      create: create
    };
  }

})();
