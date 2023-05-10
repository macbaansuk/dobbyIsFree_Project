<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.dobby.project.ming.*" %>
<%@ page import="com.dobby.project.ming.domain.User" %>
<%@ page import="com.dobby.project.ming.dao.UserDao" %>
<%@ page import="com.dobby.project.ming.domain.UserDto" %>
<%
  /* int num=Integer.parseInt(request.getParameter("num"));
   UserDao dao = new UserDao();
   UserDto dto = dao.erContent(num);*/
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
</head>
<body>
<!--header-->
<header class="header">
  <div class="headerBox">
    <div class="inner">
      <h1 class="page_tit">회원가입 완료</h1>
      <a href="http://localhost:8080/" button type="button" class="btn_page_close">
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
    <h3>
      <em class="tit tit_w33">아이디</em>
      [ ${dto.getMBR_ID()} ]
    </h3>
    <input type="hidden" id="userid" value="[${dto.getMBR_ID()}]">
    <h3>
      <em class="tit tit_w33">가입일</em>
      [ ${dto.getSUBS_DTM()} ]
    </h3>
    <input type="hidden" id="registerdate" value="[${dto.getSUBS_DTM()}]">
  </div>
  <div class="btn_submit">
    <button type="button" id="dologin" class="btnA btn_blue"><a href="/login"style="text-decoration: none; color: #FFFFFF"; >로그인 하기</a></button>
  </div>
  </div>
</section>
<!--container-->
</body>
</html>