<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <title>MyPage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
          crossorigin="anonymous" />
<%--    <link rel="stylesheet" href="./css/product.css" />--%>


    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #mypageTop {
            height: 150px;
        }

        #member {
            height: 120px;
            background: rgba(231, 230, 230, 0.673);
        }

        #user_grade {
            margin-left: 500px;
            width: 500px;
            /* background: rgba(231, 230, 230, 0.673); */
        }

        #page_point {
            height: 30px;
            margin-left: 500px;
        }

        #container {
            display: flex;
            flex-direction: row;
        }

        #menu {
            margin: 20px;
            flex: 1;
            margin-left: 250px;
            border-right: 1px solid rgba(231, 230, 230, 0.673);
        }

        #menu p {
            margin-top: 20px;
            margin-bottom: 20px;
            color: #777777;
        }

        #page {
            margin: 20px;
            flex: 9;
        }
    </style>
</head>

<body>
<jsp:include page="../header.jsp" />

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


    </div><!--mypageTop-->

    <div id="container">
        <div id="menu">
            <p>주문/배송현황</p>
            <p>뷰티포인트</p>
            <p>찜한 제품</p>
            <p>내 리뷰</p>
            <p>1:1 상담내역</p>
            <p>공병수거 캠페인</p>
            <p>회원정보 수정</p>
            <p>배송지 관리</p>
        </div><!--menu-->
        <div id="page">
            <h1>1:1 상담내역</h1>
        </div><!-- page -->
    </div><!--container-->
</div><!-- mypage -->

<jsp:include page="../footer.jsp" />
</body>

</html>