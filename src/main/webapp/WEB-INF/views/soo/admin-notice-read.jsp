<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>관리자 공지사항 등록페이지</title>
</head>
<link rel="stylesheet" href="/css/soo/admin-nav.css"/>
<link rel="stylesheet" href="/css/soo/admin-notice-read.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

</style>
<body>

<div class="admin">
    <div class="Header">
        <span class="span1">관리자 </span>
        <span class="span2">매뉴얼</span>
        <ul class="navi">
            <li>
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
        </ul>
    </div>


    <div class="admin-bar">
        <div class="admin-left">
            <h2>쇼핑몰관리</h2>
            <ul  class="admin-ul">

                <li class="on"><a href="#" onfocus="this.blur();">고객센터 관리</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">공지사항</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">FAQ</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">1:1 상담</a></li>
                    </ul>
                </li>

                <li class="on"><a href="#" onfocus="this.blur();">검색어 관리</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">검색어 목록</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">검색어 통계</a></li>
                    </ul>
                </li>

            </ul>


        </div><!-- //admin-left// -->

        <div class="admin-container">
            <div class="admin-location">HOME &gt; 고객센터 관리 &gt; 공지사항 &gt; 등록</div>

            <div class="admin-contents">
                <h3>공지사항 목록</h3>
                <p class="txtbox1 top1">
                    공지사항 목록을 보여주는 페이지입니다.
                </p>

                <div class="inv-list"><!-- 실제 구현 페이지 -->
<%--                    <section class="listView">--%>
<%--                        <form action="" id="form">--%>
<%--                            <div class="listTitle">--%>
<%--                                <span class="cate">${noticeDto.BBS_CATE}</span>--%>
<%--                                <span class="title">${noticeDto.TTL}</span>--%>
<%--                                <span class="stus">${noticeDto.STUS}</span>--%>
<%--                                <span class="date"><fmt:formatDate value="${noticeDto.REG_DTM}" pattern="yyyy-MM-dd hh:mm:ss" type="date"/></span>--%>
<%--                            </div>--%>
<%--                            <div class="listCont">--%>
<%--                                <p>--%>
<%--                                    ${noticeDto.CN}--%>
<%--                                </p>--%>
<%--                            </div>--%>

                    <form id="form" class="frm" action="" method="post" >
                        <input type="hidden" name="NB_ID" value="${noticeDto.NB_ID}">
                        <div class="form-group">
                            <%--@declare id="cate"--%><label for="cate">카테고리</label>
                            <input type="text" id="catelist" name="BBS_CATE" style="height: 30px; width: 150px;" value="${noticeDto.BBS_CATE}">
                        </div>
                        <div class="form-group">
                            <%--@declare id="status"--%><label for="status">상태</label>
                            <input type="text"id="statuslist" name="STUS" style="height: 30px; width: 150px;" value="${noticeDto.STUS}">
                        </div>
                        <div class="form-group">
                            <label for="writer">작성자</label>
                            <input type="text" id="writer" name="WRTR" value="${noticeDto.WRTR}">
                        </div>
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="TTL" value="${noticeDto.TTL}">
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" name="CN"
                                      style="height: 400px; max-height: 5000px;">${noticeDto.CN} </textarea>
                        </div>

                            <div class="listBtm">
                                <span>
                                    <button type="button" id="modifyBtn"> 수정</button>
                                </span>
                                <span>
                                    <button type="button" id="removeBtn">삭제</button>
                                </span>
                                <span>
                                    <button type="button" id="listBtn">목록</button>
                                </span>
                            </div>
                        </form>
                    </section>

                </div>
            </div>
        </div><!-- //Container// -->
    </div>


</div>


<div class="admin-footer">
    Copyright ⓒ 2023 됐나욧 All rights reserved.
</div>
<script>
    $(document).ready(function(){
        $('#listBtn').on("click", function () {
            location.href = "<c:url value='/admin/notice/list'/>?page=${page}&pageSize=${pageSize}";
        })

        $("#removeBtn").on("click", function(){
            if(!confirm("삭제하시겠습니까?")) return;
            let form = $('#form');
            form.attr("action", "<c:url value='/admin/notice/remove'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });



    });
</script>
</body>
</html>
