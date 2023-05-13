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
<!--header-->
<header class="header">
    <div class="headerBox">
        <div class="inner">
            <h1 class="page_tit">로그인</h1>
            <button>
                <a href="http://localhost:80/" type="button" class="btn_page_close">
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
        <div id="msg" class="msg">
            <c:if test="${not empty param.msg}">
            <span class="fa-stack fa-lg">
            <span class="fa-stack-1x">${URLDecoder.decode(param.msg)}
            </span>
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
            </span>
                </div>
                <div class="input_form">
            <span class="inp" id="PWD-span">
                <input id="PWD" name="PWD" type="password" required autocomplete="off" class="inp_text" placeholder="비밀번호 입력">
                <button type="button" class="btn_del" style="display: none;">
                    <span class="blind">삭제</span>
                </button>
            </span>
                </div>
                <div id="login-noti-panel" >
                    <p id="login-noti-msg" class="form_guide_txt" style="display: none;"></p>
                </div>
                <div class="btn_submit mt20">
           <span class="checkboxA">
               <input type="checkbox" id="saveid" name="saveid" title="아이디 저장">
                    <label for="saveid">아이디 저장</label>
            </span>
                </div>
                <div class="login-opt">
                    <button  id="dologin" class="btnA btn_blue loginbtn">로그인</button>
                </div>
                <rm>

                    <div class="etc_login">
                        <button class="kakao-btn" type="button" data-key="KA" data-val="KAKAO">
                            <img src="./img/ming/login_img/kakao_login_large_wide２.png" id="kakao-login-btn" alt  style="width: 510px; display: block; margin-left: auto; margin-right: auto;">
                        </button>
                        <button class="kakao-btn" type="button" data-key="KA" data-val="KAKAO" id="kakao-logout-btn" style="display: none"></button>
                    </div>
                    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
                    <script>
                        const token = document.cookie
                            ?.split(";")
                            .find((cookie) => cookie.startsWith("token="))
                            ?.split("=")[1];

                        console.log(token);

                        Kakao.init("b4040bd0971985c1a504bc16b1bc1966");


                        // 카카오 로그인 버튼을 클릭할 때
                        document
                            .querySelector("#kakao-login-btn")
                            .addEventListener("click", function () {
                                Kakao.Auth.authorize({
                                    redirectUri: "http://localhost:80/kakaologin",
                                    prompts: "login",
                                });
                            });

                        // 로그아웃 버튼을 클릭할 때
                        document
                            .querySelector("#kakao-logout-btn")
                            .addEventListener("click", function () {
                                Kakao.Auth.logout(function () {
                                    console.log("로그아웃 되었습니다.");
                                    document.querySelector("#kakao-logout-btn").style.display = "none";
                                    document.querySelector("#kakao-login-btn").style.display = "block";
                                });
                            });

                        // 로그인 상태 변경 이벤트
                        Kakao.Auth.createLoginButton({
                            container: "#kakao-login-btn",
                            success: function (authObj) {
                                console.log(authObj);
                                document.querySelector("#kakao-login-btn").style.display = "none";
                                document.querySelector("#kakao-logout-btn").style.display = "block";
                            },
                            fail: function (err) {
                                console.log(err);
                            },
                        });
                    </script>
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
</body>
</html>