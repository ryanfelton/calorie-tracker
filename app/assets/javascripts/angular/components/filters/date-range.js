(function () {
  'use strict';

  angular.module('app').filter('timeOfDayFilter', timeOfDayFilter);

  function timeOfDayFilter() {
    return function (items, field, timeOfDay) {
      return items.filter(function (item) {
        // var date = new Date(item[field]);
        var mealDatetime = moment(item[field]);
        var mealHour = mealDatetime.hour();

        console.log("mealHour: "+ mealHour);

        if (timeOfDay === 'breakfast') {
          return (mealHour >= 6 && mealHour < 12);
        } else if (timeOfDay === 'lunch') {
          return (mealHour >= 12 && mealHour < 16);
        } else if (timeOfDay === 'dinner') {
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
      var s = moment(startDatetime);
      var e = moment(endDatetime);

      console.log("s: " + moment(s).format('LLLL'));
      console.log("e: " + moment(e).format('LLLL'));

      return items.filter(function (item) {
        var item_date = moment(item[field])
        console.log("item_date: " + moment(item_date).format('LLLL'));
        console.log("isAfter: " + item_date.isAfter(s));
        console.log("isBefore: " + item_date.isBefore(e));
        if (item_date.isAfter(s) && item_date.isBefore(e) ) {
          return true
        }
        return false;
      });
    };
  }


})();
