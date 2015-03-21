'use strict';

angular.module('lostodosApp')
    .controller('LogoutController', function (Auth) {
        Auth.logout();
    });
