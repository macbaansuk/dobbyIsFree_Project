<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

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

<table border ="1">
        <c:forEach var="cartList" items="${cartList}">

    <tr>
        <td class="no">주문자</td>
        <td class="no">${cartList.}</td>
    </tr>
    <tr>
        <td class="title">연락처</td>
        <td class="no">${mbrDto.MPNO}</td>
    </tr>
    <tr>
        <td class="title">이메일</td>
        <td class="no">${mbrDto.EMAIL}</td>
    </tr>
        </c:forEach>
</table>
</body>
</html>
