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
    <title>비밀번호 찾기 | 도비스프리</title>
    <link rel="stylesheet" href="./css/ming/findPWD.css"/>
</head>
<body>
<!--header-->
<header class="header">
    <div class="headerBox">
        <div class="inner">
            <h1 class="page_tit">비밀번호 찾기</h1>
            <button>
                <a href="/login" type="button" class="btn_prev_page">
                    <span class="blind">이전</span>
                </a>
            </button>
        </div>
    </div>
</header>
<!--header-->
<!--container-->
<section class="container">
    <div class="page_top_area">
        <img src="./img/ming/findID_img/logo_black.jpg"
             style="width: 450px; display: block; margin-left: auto; margin-right: auto; margin-top: 20px"
             class="login-img" />
    </div>
    <div class="page_top_area">
        <h2 >가입 시 입력한 정보로 비밀번호를 찾아보세요.</h2>
        <p>아이디 입력 후 본인인증 방식을 선택해주세요.</p>
    </div>
    <div class="input_form inp_id">
                <span class="inp">
                    <input id="memberId" type="text" required autocomplete="off" class="inp_text" placeholder="아이디 입력">
                    <button type="button" class="btn_del" style="display: none;">
                    <span class="blind">삭제</span>
                    </button>
                </span>
    </div>
    <div class="btn_joins bdb_n">
        <a href="javascript::" rel="opener" class="is_disabled" id="phone-cert">
            <i class="ico i_phone"></i>
            휴대폰 인증
        </a>
    </div>
    </form>
    <button class="btnA btn_white btn_join_membership">
        <span></span>
        <span>아직 회원이 아니세요?</span>
        <em><a href="/register" style="text-decoration: none; color: #252525";>회원가입</a></em>
    </button>
    </div>
</section>
<!--container-->
</body>

</html>