app.controller('AppCtrl', function ($scope, $mdDialog, $http) {
    $scope.$on('event:auth-loginRequired', function (event, data) {
        console.log('sdsdsdsdsdsdsdsd')
        $mdDialog.show({
            templateUrl: 'views/login_dialog.html',
            escapeToClose: false,
            clickOutsideToClose: false,
            controller: 'LoginCtrl'
        })

    });
    $http.get('api/project')
        .success(function (data) {
            $scope.projects = data;
        });
});