'use strict';

/**
 * @ngdoc function
 * @name demoAngularAppApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the demoAngularAppApp
 */
angular.module('demoAngularAppApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
