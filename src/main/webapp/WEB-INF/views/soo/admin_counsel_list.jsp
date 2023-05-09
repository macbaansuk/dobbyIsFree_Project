<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
    <title>관리자 1:1상담 등록페이지</title>
</head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/soo/admin-nav.css" />
<link rel="stylesheet" href="/css/soo/admin_counsel_list.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    section whole {
        width: 100%;
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
            <h2>게시판관리</h2>
            <ul class="admin-ul">

                <li class="on"><a href="#" onfocus="this.blur();">고객센터 관리</a>
                    <ul>
                        <li><a href="/admin/notice/list" onfocus="this.blur();">공지사항</a></li>
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
            <div class="admin-location">HOME &gt; 고객센터 관리 &gt; 1:1 상담 &gt; 목록</div>

            <div class="admin-contents">
                <h3>1:1 상담</h3>
                <p class="txtbox1 top1">
                    1:1 상담을 보여주는 페이지입니다.
                </p>

                <%--카테고리, 상태를 선택할 수 있는 부분--%>
                <section class="inv-list">
                    <!-- 실제 구현 페이지 -->
                    <section class="whole">
                        <div class="listHead">
                        </div>
                        <div class="listMid">
                            <span class="cnt">총 ${totalCnt}개</span>
                        </div>

                        <div class="counselList">
                            <table>
                                <caption>1:1 상담내역</caption>
                                <colgroup>
                                    <col style="width: 5%;">
                                    <col style="width: 12%;">
                                    <col style="width: 43%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 20%;">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">NO</th>
                                    <th scope="col">카테고리</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">회원ID</th>
                                    <th scope="col">상태</th>
                                    <th scope="col">작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="counsel" items="${list}">

                                    <tr class="question">
                                        <!-- 1:1 상담 번호(rownum) -->
                                        <td class="no">${counsel.CNSL_ID}</td>
                                        <!-- 카테고리 -->
                                        <td class="category">${counsel.CATE_NM}</td>
                                        <!-- 제목 -->
                                        <td class="title">${counsel.TTL}</td>
                                        <!-- 회원ID -->
                                        <td class="member">${counsel.MBR_ID}</td>
                                        <!-- 상태 -->
                                        <td class="stus" value="${counsel.STUS}">
                                                ${counsel.STUS}
                                        </td>
                                        <!-- 작성일, yy-MM-dd hh:mm:ss -->
                                        <td class="regdate">
                                            <fmt:formatDate value="${counsel.REG_DTM}"
                                                            pattern="yyyy-MM-dd hh:mm:ss" type="date" />
                                        </td>
                                    </tr>
                                    <tr class="questionCont">
                                        <td></td>
                                        <td></td>
                                        <td colspan="3">
                                            <!-- 제품명 추가 -->
                                            <div class="prod">[제품명] ${counsel.PROD_NM}</div>
                                            <!-- 문의내용 -->
                                            <div class="questionC">
                                                    ${counsel.CN}
                                            </div>
                                            <div class="answer">
                                                <span class="reTitle">
                                                    <span class="reBtn">답변</span>
                                                    <!-- RE: + 상담 제목이 한번 더 -->
                                                    RE: ${counsel.TTL}
                                                </span>
                                                <!-- answer 작성 -->
                                                <span class="answerCont">
                                                    <textarea class="answertext" type="text">${counsel.CONTENT}</textarea>
                                                </span>
                                                <span class="btn">
                                                    <button id="regBtn" type="submit">답변등록</button>
                                                </span>
                                            </div>

                                        </td>
                                    </tr>

                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- 페이징 -->
                            <div class="paging">
                                <c:if test="${ph.showPrev}">
                                <a class="page">
                                    <a href="<c:url value="/admin/counsel/list?page=${ph.beginPage-1}" />">&lt;</a>
                                    </c:if>
                                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                    <a href="<c:url value="/admin/counsel/list?page=${i}" />">${i}</a>
                                    </c:forEach>
                                    <c:if test="${ph.showNext}">
                                    <a href="<c:url value="/admin/counsel/list?page=${ph.endPage+1}" />">&gt;</a>
                                    </c:if>
                            </div>
                        </div>
                    </section><!-- //Container// -->
                </section>
            </div>
        </div>
    </div>
</div>
<div class="admin-footer">
    Copyright ⓒ 2023 됐나욧 All rights reserved.
</div>
</body>
<script>
    $(document).ready(function () {
        // 일단, 답변 감추기
        $(".questionCont").hide();

        // 제목을 클릭
        $("td.title").click(function () {
            // 클릭한 제목의 부모 tr을 찾는다
            var parentTr = $(this).closest("tr");

            // 클릭한 제목 아래에 있는 답변을 찾아 보여주기
            var questionCont = parentTr.next(".questionCont");
            if (questionCont.is(":visible")) {
                // 이미 보이는 경우에는 닫기
                questionCont.hide();
            } else {
                // 보이지 않는 경우에는 열어주기
                $(".questionCont").hide();  // 다른 답변은 닫아줍니다.
                questionCont.show();
            }
        });
    });
</script>

</html>