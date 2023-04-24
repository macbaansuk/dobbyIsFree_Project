
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 페이지1111</title>
</head>

<link rel="stylesheet" href="/css/hoon/admin.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<body>

        <div class="admin-left">
            <h2>쇼핑몰관리</h2>
            <ul  class="admin-ul">
<%--                --%>
                <li class="on"><a href="#" onfocus="this.blur();">운영정보설정</a></li>
                <li class="on"><a href="#" onfocus="this.blur();">상품관리</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품목록</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품분류</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">브랜드관리</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">옵션항목</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">재고관리</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품평관리</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품문의관리</a></li>
                    </ul>
                </li>
                <li class="on"><a href="#" onfocus="this.blur();">주문관리</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">주문목록</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">개별취소요청</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">세금계산서</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">현금영수증</a></li>
                    </ul>
                </li>
                <li class="on"><a href="#" onfocus="this.blur();">통계분석</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">매출통계분석</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품통계분석</a></li>
                    </ul>
                </li>
                <li class="on"><a href="#" onfocus="this.blur();">쿠폰관리</a></li>
                <li class="on"><a href="#" onfocus="this.blur();">적립금관리</a></li>
                <li class="on"><a href="#" onfocus="this.blur();">가격비교사이트</a></li>
            </ul>

        </div><!-- //admin-left// -->

 </body>
</html>
