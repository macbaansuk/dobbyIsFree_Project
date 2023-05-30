<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>아이디 찾기 | 도비스프리</title>
    <link rel="stylesheet" href="./css/user/findID.css"/>
</head>
<body>
<!--header-->
<header class="header">
    <div class="headerBox">
        <div class="inner">
            <h1 class="page_tit">아이디 찾기</h1>
            <button>
                <a href="/login" type="button" class="btn_prev_page">
                    <span class="blind">이전</span>
                </a>
            </button>
        </div>
    </div>
</header>
<section class="container">
    <div class="page_top_area">
        <img src="./img/user/findID_img/logo_black.jpg"
             style="width: 450px; display: block; margin-left: auto; margin-right: auto; margin-top: 20px"
             class="login-img" />
    </div>
    <div class="page_top_area">
        <h2 >가입 시 입력한 정보로 아이디를 찾아보세요.</h2>
    </div>
    <div class="sec_login">
        <div class="input_form">
                <span class="inp">
                    <input id="name" type="text" required autocomplete="off" class="inp_text" placeholder="이름">
                    <button type="button" class="btn_del" style="display: none;">
                    <span class="blind">삭제</span>
                    </button>
                </span>
        </div>
        <div class="input_form">
                <span class="inp">
                    <input id="phone" type="tel" required autocomplete="off" class="inp_text" placeholder="휴대폰 번호 입력('-'생략)">
                    <button type="button" class="btn_del" style="display: none;">
                    <span class="blind">삭제</span>
                    </button>
                </span>
        </div>
        <div class="btn_submit">
            <button type="button" id="btn_submit" class="btnA btn_blue loginbtn"> <a href="/findIDResult"style="text-decoration: none; color: #FFFFFF"; >아이디 찾기</a></button>
        </div>
        </form>
        <button class="btnA btn_white btn_join_membership">
            <span></span>
            <span>아직 회원이 아니세요?</span>
            <em>회원가입</em>
        </button>
    </div>
</section>
</body>

</html>