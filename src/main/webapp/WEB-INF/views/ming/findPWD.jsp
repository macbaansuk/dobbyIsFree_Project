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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script>
    /*  $(document).ready(function() {
      $('.inp .btn_del').each(function () {
          var $target_inp = $(this).parent('.inp').find('.inp_text');
          //var $guide = $(this).parent('.inp').next($('p'));
          $(this).toggle(Boolean($target_inp.val()));
          $(this).click(function () {
              $target_inp.empty().removeClass('is_error is_success')/!*.focus()*!/;
              $(this).hide();
              $('#login-noti-msg').empty();
              $('#login-noti-msg').removeClass('is_success is_error');
              $('#login-noti-msg').hide();
              //$guide.hide();
              $('#dologin').attr('disabled', 'disabled');
          })
          })
      });*/
    $('#mail-Check-Btn').click(function() {
        const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
        console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
        const checkInput = $('.mail-check-input') // 인증번호 입력하는곳
    }); // end send eamil
</script>
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
        <p>이메일 입력 후 전송 코드를 통해 이메일 인증을 완료해주세요.</p>
    </div>
    <div class="input_form inp_email">
                <span class="inp">
                    <input id="EMAIL" type="text" required autocomplete="off" class="inp_text" placeholder="이메일 입력">
                    <button type="button" class="btn_del" style="display: none;">
                    <span class="blind">삭제</span>
                    </button>
                </span>
    </div>
    <div class="btn_joins bdb_n">
        <button type="button" class="btn btn-primary" id="mail-Check-Btn">
            <!--<a href="javascript::" rel="opener" class="is_disabled" id="email-cert">-->
            <i class="ico i_email"></i>
            <span>이메일 인증</span>
            </a>
        </button>
        <%--<button type="button" class="btn btn-primary" id="mail-Check-Btn">Verify</button>--%>
    </div>
    <div class="input_form inp_email">
                <span class="inp_code">
                    <input id="EMAIL_code" type="text" required autocomplete="off" class="inp_text" placeholder="인증번호 6자리를 입력해주세요">
                    <button type="button" class="btn_del" style="display: none;">
                    <span class="blind">삭제</span>
                    </button>
                </span>
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