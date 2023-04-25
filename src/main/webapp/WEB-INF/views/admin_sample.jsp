
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 페이지</title>
</head>

<link rel="stylesheet" href="/css/hoon/admin.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<body>

<div class="admin">
    <jsp:include page="../admin_header.jsp"/>


    <div class="admin-bar">
        <jsp:include page="../admin_left.jsp"/>

<%--        이 사이에 태그를 작성하시면 됩니다.
! 경로 못찾을시 각자 파일 경로를 참고하여 올바르게 수정해주세요.




--%>


<jsp:include page="../admin_footer.jsp"/>



</body>
</html>