<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1">
    <thead>
    <tr>
        <th>회원ID</th>
        <th>상품ID</th>
        <th>상품명</th>
        <th>가격</th>
        <th>수량</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${cartList}" var="cartProdDto">
        <tr>
            <td>${cartProdDto.MBR_ID}</td>
            <td>${cartProdDto.PROD_NO}</td>
            <td>${cartProdDto.PROD_NM}</td>
            <td>${cartProdDto.AMT}</td>
            <td>${cartProdDto.PROD_INDV_QTY}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
