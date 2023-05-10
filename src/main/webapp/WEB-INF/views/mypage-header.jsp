<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
          crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax -->

    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {
            font-family: "나눔바른고딕OTF", "돋움";
        }


        #mypageTop {
            height: 150px;
        }

        #member {
            height: 140px;
            background: rgba(231, 230, 230, 0.673);
        }

        #user_grade {

            width: 100%;
            height: 100%;
        }

        #page_point {
            height: 30px;
            padding-left: 17%;
        }

        #container {
            display: flex;
            flex-direction: row;
            /*margin-right: 12%;*/
            /*margin-left: 12%;*/
        }

        #menu {
            padding: 30px 0 20px 20px;
            width: 150px;
            border-right: 1px solid rgba(231, 230, 230, 0.673);
            margin-left: 250px;
        }

        #menu p  {
            margin-top: 10px;
            margin-bottom: 30px;
            color: #777777;
        }
        #menu a {
            text-decoration: none;
            color: #777777;
        }


        /* 아래부터 실제 페이지 구현 */

        #page {
            display: inline-block;
            margin-top: 30px;
            min-height: 600px;
            margin-right: 100px;
            margin-left: 30px;
            /*width: 1000px;*/
        }

        /*#page {*/
        /*    margin: 20px;*/
        /*    flex: 9;*/
        /*    min-height: 600px;!* 주문내역 추가 *!*/
        /*    margin-right: 100px;!* 주문내역 추가 *!*/
        /*    margin-left: 30px;!* 주문내역 추가 *!*/
        /*}*/
    </style>
</head>

<body>
<jsp:include page="header.jsp" />

<div class="mypage">
    <div id="mypageTop">
        <div id="page_point">
            <p>홈 > 마이페이지 > 1:1상담내역</p>
        </div>
        <div id="member">
            <div id="user_grade">
                <h1>회원 등급 표시</h1>
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