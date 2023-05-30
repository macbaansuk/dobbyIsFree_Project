<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String MBR_ID = request.getParameter("MBR_ID");
    request.setAttribute("MBR_ID", MBR_ID);
%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
          crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax -->
    <link rel="stylesheet" href="/css/mypage_header.css" />

</head>

<body>
<jsp:include page="header.jsp" />

<div class="mypage">
    <div id="mypageTop">
        <div id="member">
            <div id="user_grade">
                <img src="/img/user/myPage_user/welcomegrade.png"style="width: 50px" class="mypage-img1">
                <h2>
                    ${MBR_ID}님은 <em class="grade">웰컴</em> 회원입니다.
                </h2>
                <span></span>
                <img src="/img/user/myPage_user/coupon_icon.png" style="width: 75px" class="mypage-img2"/>
                <p>보유쿠폰 <em class="classinfo">2장</em> </p>
                <img src="/img/user/myPage_user/point_icon.png"style="width: 75px" class="mypage-img3">
                <p>보유포인트 <em class="classinfo">3000p</em> </p>
            </div>
        </div>
    </div>

    <div id="container">
        <div id="menu">
            <p><a href="/order/list">주문/배송현황</a></p>
            <p><a href="#">취소/교환/환불</a></p>
            <p><a href="#">찜한 제품</a></p>
            <p><a href="#">내 리뷰</a></p>
            <p><a href="/mypage/counsel/write">1:1 상담내역</a></p>
            <p><a href="#">공병수거 캠페인</a></p>
            <p><a href="#">회원정보 수정</a></p>
            <p><a href="#">배송지 관리</a></p>
        </div>
        <div id="page">