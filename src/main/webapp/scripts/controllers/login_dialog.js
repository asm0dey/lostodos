app.controller('LoginCtrl', function ($http, $mdDialog, authService, $scope) {
    $scope.loginType = 'login';
    $scope.login = {};
    $scope.createUser = function () {
        $http
            .post('api/register', JSON.stringify($scope.login))
            .success(function (data) {
                signIn();
            });
    };
    $scope.signIn = function () {
        var data = 'j_username=' + encodeURIComponent($scope.login.username) + '&j_password=' + encodeURIComponent($scope.login.password) + '&_spring_security_remember_me='+$scope.login.rememberMe+'&submit=Login'
        $http.post('api/authentication', data, {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        })
            .success(function (data) {
                authService.loginConfirmed();
                $mdDialog.hide();
            })
    };
});