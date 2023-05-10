<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
  String MBR_ID = request.getParameter("MBR_ID");
  request.setAttribute("MBR_ID", MBR_ID);
%>
<html>
<head>
  <link rel="stylesheet" href="/css/mypage_header.css" />
  <title>Title</title>
  <style>
    #user_grade {
      display: flex;
      align-items: center;
    }
  </style>
</head>
<body>
<div id="mypageTop">
<%--  <div id="page_point">--%>
<%--    <p>홈 > 마이페이지 > 1:1상담내역</p>--%>
<%--  </div>--%>
  <div id="member">
    <div id="user_grade">
      <img src="../img/ming/myPage_ming/welcomegrade.png"style="width: 50px" class="mypage-img1">
      <h2>
        ${MBR_ID}님은 <em class="grade">웰컴</em> 회원입니다.
      </h2>
      <span></span>
      <img src="../img/ming/myPage_ming/coupon_icon.png" style="width: 75px" class="mypage-img2"/>
        <p>보유쿠폰 <em class="info">2장</em> </p>
      <img src="../img/ming/myPage_ming/point_icon.png"style="width: 75px" class="mypage-img3">
        <p>보유포인트 <em class="info">3000p</em> </p>
    </div>
  </div>
</div>
</body>
</html>