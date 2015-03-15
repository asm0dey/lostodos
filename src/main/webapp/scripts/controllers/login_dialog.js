app.controller('LoginCtrl', function ($http, $mdDialog) {
    this.createUser = function (login) {
        $http
            .post('rest/user', JSON.stringify(login))
            .success(function (data) {
                $mdDialog.hide()
            })
    }
});