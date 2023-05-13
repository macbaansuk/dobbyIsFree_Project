<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.dobby.project.ming.*" %>
<%@ page import="com.dobby.project.ming.domain.User" %>
<%@ page import="com.dobby.project.ming.dao.UserDao" %>
<%@ page import="com.dobby.project.ming.domain.UserDto" %>
<%
  String MBR_ID = request.getParameter("MBR_ID");
  request.setAttribute("MBR_ID", MBR_ID);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 완료 | 도비스프리</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <link rel="stylesheet" href="./css/ming/registerSuccess.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
    window.onload =  function() {
      var today = new Date();
      var day = today.getDate();
      var month = today.getMonth() + 1;
      var year = today.getFullYear();
      var formattedDate = year + "년 " + month + "월 " + day + "일";
      document.getElementById("date").innerHTML = formattedDate;
    }
  </script>
</head>
<body>
<!--header-->
<header class="header">
  <div class="headerBox">
    <div class="inner">
      <h1 class="page_tit">회원가입 완료</h1>
      <a href="http://localhost:80/" button type="button" class="btn_page_close">
        <span class="blind">닫기</span></a>
      </button>
    </div>
  </div>
</header>
<!--header-->
<!--container-->
<section class="container">
  <div class="page_top_area">
    <h2>도비스프리에 회원가입 되었습니다.</h2></br>
  </div>
  <div class="user_info mb13">
    <span></span>
    <h3>
      <em class="tit tit_w33">아이디</em>
       ${MBR_ID}
    </h3>
    <input type="hidden" id="userid" value="[${MBR_ID}]">
    <h3>
      <em class="tit tit_w33">가입일</em>
      <span id="date"></span>
    </h3>
    <input type="hidden" id="registerdate" value="[ date ]">
  </div>
  <div class="btn_submit">
    <button type="button" id="dologin" class="btnA btn_blue"><a href="/" style="text-decoration: none; color: #FFFFFF"; >메인화면 바로가기</a></button>
  </div>
  </div>
</section>
<!--container-->
</body>
</html>