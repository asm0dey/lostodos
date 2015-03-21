app.controller('AppCtrl', function ($scope, $mdDialog, $http) {
    $http.get('/rest/task');
    $mdDialog.show({
        templateUrl: 'views/login_dialog.html',
        escapeToClose: false,
        clickOutsideToClose: false,
        controller: 'LoginCtrl',
        controllerAs: 'login'
    })
});