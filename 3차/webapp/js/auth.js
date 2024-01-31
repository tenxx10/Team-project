/**
 * 
 */

// 구글 로그인 
function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    console.log('Family Name: ' + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail());

    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
};



//네이버

const naverLogin = new naver.LoginWithNaverId(
            {
                clientId: "QX108IAbo5hjchW6okq5",     //클라아이디
                callbackUrl: "http://localhost:8088/team/view/index.jsp",   // 콜백페이지 각자변경해야함
                loginButton: {color: "green", type: 2, height: 40}
            }
        );
 naverLogin.init(); // 로그인 설정
 
 
/*
// 네이버 로그인 스크립트 

var naverLoginInstance = new naver.LoginWithNaverId({
    clientId: 'QX108IAbo5hjchW6okq5',
    callbackUrl: 'http://localhost:8088/',
    isPopup: false,
    loginButton: {color: 'green', type: 3, height: 40},
});

function redirectToNaverLogin() {
    naverLoginInstance.init();
    naverLoginInstance.getLoginStatus(function (status) {
        if (status) {
            var email = naverLoginInstance.user.getEmail();
            var nickname = naverLoginInstance.user.getNickName();

            // 로그인 성공 시 처리할 내용
            console.log('네이버 로그인 성공');
            console.log('이메일: ' + email);
            console.log('닉네임: ' + nickname);
        } else {
            // 로그인 실패 시 처리할 내용
            console.log('네이버 로그인 실패');
        }
    });
}
*/