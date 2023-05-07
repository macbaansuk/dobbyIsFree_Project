<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>MyPage - </title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/mypage.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style></style>
</head>

<body>
<jsp:include page="header.jsp" />

<div class="mypage">
    <div id="mypageTop">
        <jsp:include page="mypage_header.jsp" />
    </div>

    <div id="container">
        <div id="menu">
            <a href="#"><p>주문/배송현황</p></a>
            <a href="#"><p>뷰티포인트</p></a>
            <a href="#"><p>찜한 제품</p></a>
            <a href="#"><p>내 리뷰</p></a>
            <a href="/mypage/counsel/list"><p>1:1 상담내역</p></a>
            <a href="#"><p>공병수거 캠페인</p></a>
            <a href="#"><p>회원정보 수정</p></a>
            <a href="#"><p>배송지 관리</p></a>
        </div>
<%--    실제 구현 페이지    --%>
        <div id="page">

        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>



</html>
