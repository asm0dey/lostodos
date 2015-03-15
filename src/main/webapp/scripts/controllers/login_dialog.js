app.controller('LoginCtrl', function ($http, $mdDialog) {
    this.createUser = function (login) {
        $http
            .post('rest/user', angular.toJson(login))
            .success(function (data) {
                $mdDialog.hide()
            })
    }
});