<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<h3>주문/배송정보</h3>
<table border ="1">
    <tr>
        <td class="no">주문자</td>
        <td class="no">${mbrDto.MBR_NM}</td>
    </tr>
    <tr>
        <td class="title">연락처</td>
        <td class="no">${mbrDto.MPNO}</td>
    </tr>
    <tr>
        <td class="title">이메일</td>
        <td class="no">${mbrDto.EMAIL}</td>
    </tr>
</table>

<h3>주문 상품 정보</h3>
<table border ="1">
    <c:forEach items="${orderList}" var="orderList">
        <tr>
            <td class="no">${orderList.PROD_NM}</td>
            <td class="no">${orderList.PROD_INDV_QTY}</td>
            <c:choose>
                <c:when test="${orderList.DC_YN eq 'Y'}">
                    <c:set var="prod_fee" value="${orderList.AMT * 0.9 * orderList.PROD_INDV_QTY}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="prod_fee" value="${orderList.AMT * orderList.PROD_INDV_QTY}"/>
                </c:otherwise>
            </c:choose>
            <td class="no"><fmt:formatNumber pattern="###,###,###" value="${prod_fee}"/></td>
        </tr>

    </c:forEach>
</table>
</body>
</html>
