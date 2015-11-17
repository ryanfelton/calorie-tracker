(function () {
  'use strict';

  angular.module('app').filter('timeOfDayFilter', timeOfDayFilter);

  function timeOfDayFilter() {
    return function (items, field, timeOfDay) {
      return items.filter(function (item) {
        // var date = new Date(item[field]);
        var mealDatetime = moment(item[field]);
        var mealHour = mealDatetime.hour();
        console.log("mealDatetime: " + mealDatetime);
        console.log("mealDatetime Hour: " + mealHour);

        if (timeOfDay === 'breakfast') {
          return (mealHour >= 6 && mealHour < 12);
        } else if (timeOfDay === 'lunch') {
          return (mealHour >= 12 && mealHour < 16);
        } else if (timeOfDay === 'dinner') {
          console.log("mealHour >= 16: " + (mealHour >= 16));
          console.log("mealHour < 23: " + (mealHour < 23));
          return (mealHour >= 16 && mealHour < 23);
        } else if (timeOfDay === 'all') {
          return true;
        }
      });
    };
  }


  angular.module('app').filter('dateRange', dateRange);

  function dateRange() {
    return function (items, field, startDatetime, endDatetime) {
      var s = moment(startDatetime, "YYYY-MM-DD");
      var e = moment(endDatetime, "YYYY-MM-DD");

      return items.filter(function (item) {
        var item_date = moment(item[field], "YYYY-MM-DD")
        if (item_date.isAfter(s) && item_date.isBefore(e) ) {
          return true
        }
        return false;
      });
    };
  }


})();
