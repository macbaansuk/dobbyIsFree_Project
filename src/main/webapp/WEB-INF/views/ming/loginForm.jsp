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
    <script>
        // 버튼 클릭 시 이벤트 핸들러
        const viewKeyboard = document.querySelector('.view_keyboard');
        if (viewKeyboard) {
            viewKeyboard.addEventListener('click', function() {
                // 이미 열려있다면 닫기
                if (this.parentNode.classList.contains('is_open')) {
                    this.parentNode.classList.remove('is_open');
                }
                // 열려있지 않다면 열기
                else {
                    this.parentNode.classList.add('is_open');
                }
            });
        }
        else {
            console.error('.view_keyboard 요소를 찾을 수 없습니다.');
        }

        $(document).ready(function () {
            const btnKeyboardJq = $('.btn_keyboard').get(0);
            if (btnKeyboardJq) {
                $(btnKeyboardJq).click(function () {
                    // 클릭 이벤트 핸들러의 코드를 작성합니다.
                    console.log('btn_keyboard is clicked!');
                });
            }
            else {
                console.error('.btn_keyboard 요소를 찾을 수 없습니다.');
            }
        });
    </script>
</head>
<body>
<!--header-->
<header class="header">
    <div class="headerBox">
        <div class="inner">
            <h1 class="page_tit">로그인</h1>
            <button>
                <a href="http://localhost/" type="button" class="btn_page_close">
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
            <button class="btn_keyboard"  id="btn_keyboard">PC 키보드 열기</button>
            <span class="img_keyboard">
                    <img src="https://one-ap.amorepacific.com/auth/images/common/img_keyboard.png" alt="키보드 배열 이미지";>
                    </span>
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
                    <p id="login-noti-msg" class="form_guide_txt" style="display: block; margin-left: auto; margin-right: auto;"></p>
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
            </form>

            <div class="etc_login">
                <button class="sns-btn" type="button" data-key="KA" data-val="KAKAO">
                    <img src="./img/ming/login_img/kakao_login_large_wide２.png" alt  style="width: 510px; display: block; margin-left: auto; margin-right: auto;">
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
</body>
</html>