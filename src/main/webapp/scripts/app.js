var app = angular.module('LosTodos', ['ngMaterial','http-auth-interceptor'])
    .config(function ($httpProvider) {
        $httpProvider.defaults.xsrfCookieName = 'CSRF-TOKEN';
        $httpProvider.defaults.xsrfHeaderName = 'X-CSRF-TOKEN';
    });