var app = angular.module('LosTodos', ['ngMaterial','http-auth-interceptor','ng-mfb'])
    .config(function ($httpProvider) {
        $httpProvider.defaults.xsrfCookieName = 'CSRF-TOKEN';
        $httpProvider.defaults.xsrfHeaderName = 'X-CSRF-TOKEN';
    });