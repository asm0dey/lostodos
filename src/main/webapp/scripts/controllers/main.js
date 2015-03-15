app.controller('AppCtrl', function ($scope, $mdDialog) {
    $mdDialog.show({
        templateUrl: 'views/login.html',
        escapeToClose: false,
        clickOutsideToClose: false,
        controller: 'LoginCtrl',
        controllerAs: 'login'
    })
});