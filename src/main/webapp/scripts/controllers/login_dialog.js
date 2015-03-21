app.controller('LoginCtrl', function ($http, $mdDialog) {
    this.loginType = 'login';
    this.createUser = function (login) {
        $http
            .post('rest/user', JSON.stringify(login))
            .success(function (data) {
                $mdDialog.hide()
            })
    }
    this.signIn = function(user){
        $http.post('rest/user/login',JSON.stringify(user))
            .success(function (data) {
                $mdDialog.hide();
            })
    }
});