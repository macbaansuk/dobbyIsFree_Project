<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 페이지1111</title>
</head>

<link rel="stylesheet" href="/css/hoon/admin.css"/>

<body>

    <div class="Header">
        <span class="span1">관리자 </span>
        <span class="span2">매뉴얼</span>
        <ul class="navi">
            <li>
<%--span 안에 a태그를 넣는게 좋다.--%>
                <a href="#">
                    <span class="menuWrap">쇼핑몰 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">회원 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">게시판 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">접속 통계<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">배너 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>

                <a href="/admin/logout">
<%--                    <span>${admin.MNGR_ID}</span>--%>
<%--                    <br>--%>
                    <span class="menuWrap">로그아웃<button type="button" class="bar"></button></span>
                </a>
            </li>
        </ul>
    </div>

 </body>
</html>
