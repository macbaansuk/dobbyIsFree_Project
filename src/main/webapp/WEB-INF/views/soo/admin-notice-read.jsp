<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>관리자 공지사항 등록페이지</title>
</head>
<link rel="stylesheet" href="../../css/soo/admin-nav.css"/>
<link rel="stylesheet" href="../../css/soo/cs-notice.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    section{
        width:100% ;
    }

    form{
        width: 1000px;
    }

    .form-group {
        display: flex;
        align-items: center;
        /*justify-content: space-between;*/
        margin-bottom: 10px;
        width: 800px;
    }

    #writer {
        width: 200px;
    }
    .form-group label {
        flex-basis: 80px;
        flex-shrink: 0;
        margin-left: 10px;
        margin-right: 10px;
        font-weight: bold;
        text-align: left;
    }

    .form-group > *:not(:last-child) {
        margin-right: 10px;
    }

    .form-group input[type=text],
    .form-group textarea {
        flex: 1;
        box-sizing: border-box;
        padding: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;

    }

    .form-group textarea content{
        height: 400px;
    }


    .button writeBtn{
        position: relative;
        margin-left: 720px;
    }
    .button writeBtn[type=submit] {

        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 10px;
    }
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

                <div class="inv-list">

                    <!-- 실제 구현 페이지 -->
                    <section class="whole">
                        <div class="listHead"></div>
                        <p class="listCnt">총 ${totalCnt}개</p>
                        <div class="list">
                            <table>
                                <colgroup>
                                    <col style="width: 7%;">
                                    <col style="width: 13%">
                                    <col style="width: 65%;">
                                    <col style="width: 15%;">
                                </colgroup>

                                <tbody>
                                <c:forEach var="Notice" items="${noticeList}">
                                    <tr>
                                        <td class="nb_id">${Notice.NB_ID}</td> <!--  게시물 번호 -->
                                        <td class="bbs_cate">${Notice.BBS_CATE}</td>
                                        <td class="ttl"><a href="<c:url value="/admin/notice/read${ph.sc.queryString}&NB_ID=${Notice.NB_ID}"/>">${Notice.TTL}</a></td><!--  게시물 제목 -->
                                        <td class="reg_dtm"><fmt:formatDate value="${Notice.REG_DTM}" pattern="yyyy-MM-dd" type="date"/></td> <!--  게시물 작성일 -->
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                        </div>
                        <!-- 페이징 -->
                        <div class="paging">
                            <c:if test="${ph.showPrev}">
                            <a class="page">
                                <a href="<c:url value="/admin/notice/list?page=${ph.beginPage-1}"/>">&lt;</a>
                                </c:if>
                                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a href="<c:url value="/admin/notice/list?page=${i}"/>">${i}</a>
                                </c:forEach>
                                <c:if test="${ph.showNext}">
                                <a href="<c:url value="/admin/notice/list?page=${ph.endPage+1}"/>">&gt;</a>
                                </c:if>
                        </div>
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
    // $(document).ready(function() {
    //     $("#writeBtn").on("click", function () {
    //         let form = $("#form");
    //         form.attr("action", "/admin/notice/write");
    //         form.attr("method", "post");
    //         if (formCheck())
    //             form.submit();
    //     })
    // })
</script>
</body>
</html>
