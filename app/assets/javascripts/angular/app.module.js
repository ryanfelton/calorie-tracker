angular.module('app',
  [
    'ui.bootstrap',
    'ui.router',
    'templates',

    'app.login',
    'app.meals',
    'app.signup'
  ]);

  angular.module('app.meals', [
    'ui.bootstrap.datetimepicker',
    'ngResource'
  ]);

angular.module('app.login', []);
angular.module('app.signup', []);
