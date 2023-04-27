<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<% String cookieId ="";

    Cookie[] cookies = request.getCookies();

    if(cookies != null){
        for(Cookie c :cookies){
            String name = c.getName();
            if("MBR_ID".equals(name))
                cookieId = c.getValue();
        }
    }
    //${request.cookie.MBR_ID}로 해볼 것
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 | 도비스프리</title>
    <link rel="stylesheet" href="./css/ming/login.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script>
    window.onload = function() {
        // 버튼 클릭 시 이벤트 핸들러
        const btn_keyboard = document.querySelector('.btn_keyboard');
        if (btn_keyboard) {
            console.log('btn_keybord',btn_keyboard);
            btn_keyboard.addEventListener('click', function () {
                // 이미 열려있다면 닫기
                if (this.parentNode.classList.contains('is_open')) {
                    console.log('isopen',this.parentNode.classList.contains('is_open'));
                    this.parentNode.classList.remove('is_open');
                    this.textContent = this.dataset.text; // 닫혔을 때의 텍스트 값으로 변경
                }
                // 열려있지 않다면 열기
                else {
                    this.parentNode.classList.add('is_open');
                    this.textContent = this.dataset.openText; // 열렸을 때의 텍스트 값으로 변경
                    console.log('안열려있을때 열기',this.parentNode.classList);
                    console.log('img_keyboard visibility: ' + document.querySelector('.img_keyboard').style.display);
                }
            });
        } //둘을 하나로 합쳐볼것
        $(document).ready(function () {
            const btn_keyboardJq = $('.btn_keyboard').get(0);
            if (btn_keyboardJq) {
                $(btn_keyboardJq).click(function () {
                    // 클릭 이벤트 핸들러의 코드를 작성합니다.
                    console.log('btn_Keyboard is clicked!');
                });
            }
        })
    };
</script>
<script>
    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = ` ${'${msg}'}`;

        if(element) {
            element.select();
        }
    }
</script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
    kakao.init("b4040bd0971985c1a504bc16b1bc1966");

    //카카오 로그인 버튼을 클릭할 때
    document.querySelector('#kakao-btn').addEventListener("click", function(){
        Kakao.Auth.authorize({
            redirectUri:"http://localhost:3000/oauth/kakao/callback",
            prompts:"login", //key값이 시도, 로그인을 시도한다는 뜻
        });
    });
</script>

   <!-- function kakaoLogin() {
        window.kakao.Auth.login({ //실제로 로그인 버튼을 눌렀을 때 실행된 함수
            scope: 'profile_nickname, account_email, gender', //동의항목에서 받아올 애들
            success: function(authObj) { //실제 로그인이 되면 success 콜백 함수가 일어남
                console.log(authObj); //받아온 오브젝트들 콘솔로 찍어보자
                window.Kakao.API.request({ //로그인 된 상태에서 유저정보 가져오자(API로)
                    url: '/v2/user/me', //현재 로그인한 사용자의 정보를 가져오라는 뜻
                    success: res => { //success 콜백함수 일 때
                        const kakao_account = res.kakao_account; //사용자 정보 콘솔에 찍어볼까
                        consloe.log(kakao_account); //닉네임이랑 메일이랑 잘 가지고 오나 확인하기
                    }
                });
            }
        })
    }-->

<%--<script>
    function loginWithKakao() {
        Kakao.Auth.authorize({
            redirectUri: 'http://localhost/login',
        });
    }

    function requestUserInfo() {
        Kakao.API.request({
            url: '/v2/user/me',
        })
            .then(function(res) {
            alert(JSON.stringify(res));
            })
            .catch(function(err) {
            alert(
            'failed to request user information: ' + JSON.stringify(err)
            );
        });
    }
</script>--%>
<!--header-->
<header class="header">
    <div class="headerBox">
        <div class="inner">
            <h1 class="page_tit">로그인</h1>
            <button>
                <a href="http://localhost:8080/" type="button" class="btn_page_close">
                    <span class="blind">이전</span>
                </a>
            </button>
        </div>
    </div>
</header>
<!--header-->
<!--container-->
<section class="container">
    <div class="login-title">
        <img src="./img/ming/login_img/logo.jpg" style="width: 450px; display: block; margin-left: auto; margin-right: auto; margin-top: 20px" class="login-img" />
        <span> <h1 class="login-title_maintext">
            아모레퍼시픽 뷰티포인트 통합회원</br>
            아이디로 로그인해주세요.</h1>
            </span>
    </div>
    <div class="sec_login">
        <div class="view_keyboard" id="view_keyboard">
            <button class="btn_keyboard"  id="btn_keyboard" data-text="PC 키보드 열기" data-open-text="PC 키보드 닫기">PC 키보드 열기</button>
            <span class="img_keyboard">
                    <img src="https://one-ap.amorepacific.com/auth/images/common/img_keyboard.png" alt="키보드 배열 이미지";>
                    </span>
        </div>
        <div id="msg">
            <c:if test="${not empty param.msg}">
                <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
            </c:if>
        </div>
        <div class="input_form">
            <form action="/login" class="loginForm" method="post">
                <div class="input_form">
            <span class="inp" id="MBR_ID-span">
                <input id="MBR_ID" name="MBR_ID" type="text" required autocomplete="off" class="inp_text" placeholder="아이디 입력" value="<%=cookieId%>">
                <button type="button" class="btn_del" style="display: none;">
                    <span class="blind">삭제</span>
                </button>
            </span> <!--이 사이에 login-guide msg어쩌고 있었는데 필요없을듯하여 일단 생략-->
                </div>
                <div class="input_form">
            <span class="inp" id="PWD-span">
                <input id="PWD" name="PWD" type="password" required autocomplete="off" class="inp_text" placeholder="비밀번호 입력">
                <button type="button" class="btn_del" style="display: none;">
                    <span class="blind">삭제</span>
                </button>
            </span> <!--이 사이에 password-guide msg어쩌고 있었는데 필요없을듯하여 일단 생략-->
                </div>
                <div id="login-noti-panel" >
                    <p id="login-noti-msg" class="form_guide_txt" style="display: none;"></p>
                </div>
                <div class="btn_submit mt20">
           <span class="checkboxA">
                <%--@declare id="checkbox"--%><input type="checkbox" id="saveid" name="saveid" title="아이디 저장">
                    <label for="saveid">아이디 저장</label>
            </span>
                </div>
                <div class="login-opt">
                    <button  id="dologin" class="btnA btn_blue loginbtn">로그인</button>
                    <!-- <button type="button" id="dologin" class="btnA btn_blue loginbtn" disabled="disabled">로그인</button> -->
                </div>
            <rm>

            <div class="etc_login">
                <button class="kakao-btn" type="button" data-key="KA" data-val="KAKAO">
                    <a href="javascript:loginWithKakao();"> <img src="./img/ming/login_img/kakao_login_large_wide２.png" id="kakao-login-btn" alt  style="width: 510px; display: block; margin-left: auto; margin-right: auto;"></a>
                </button>
            </div>
            <ul class="bottom_menu">
                <li>
                    <a href="/findID" id="search_id">아이디 찾기</a>
                </li>
                <li><span class="just_line" style="color:#898989">|</span></li>
                <li>
                    <a href="/findPWD" id="search_pwd">비밀번호 찾기</a>
                </li>
            </ul>
            <button class="btnA btn_white btn_join_membership">
                <span>아직 회원이 아니세요?</span>
                <em><a href="/register" style="text-decoration: none; color: #252525";>회원가입</a></em>
            </button>
        </div>
    </div>
</section>
<!--container-->
<script>
    <!--로그인 실패 시 오류메시지 표출 관련 추후 정리해볼 것-->
    /*this.loginFailNotiMsg = function(msg) {
        $('#login-noti-msg').empty();
        $('#login-noti-msg').addClass('is_error');
        $('#login-noti-msg').html(msg).show();
    };

    if (data.status === 0) // 존재하지 않는 회원
        {
    OMNI.auth.loginFailNotiMsgInit();
    OMNI.auth.loginFailNotiMsg('아이디 또는 비밀번호가 맞지 않습니다.');
        }*/
</script>
</body>
</html>