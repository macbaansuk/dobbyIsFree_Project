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
            <div class="admin-location">HOME &gt; 고객센터 관리 &gt; 공지사항 &gt; 등록</div>

            <div class="admin-contents">
                <h3>공지사항 목록</h3>
                <p class="txtbox1 top1">
                    공지사항 목록을 보여주는 페이지입니다.
                </p>

                <div class="inv-list"><!-- 실제 구현 페이지 -->

                    <form id="form" class="frm" action="" method="post" >
                        <input type="hidden" name="NB_ID" value="${noticeDto.NB_ID}">
                        <input type="hidden" id="page" name="page" value="${page}">
                        <input type="hidden" id="pageSize" name="pageSize" value="${pageSize}">

                        <div class="form-group">
                            <label for="catelist">카테고리</label>   <!-- '<label>' 태그와 연결된 입력 요소의 id와 'for' 속성 값이 일치해야한다. -->
                            <select id="catelist" name="BBS_CATE" style="height: 30px; width: 150px;">
                                <option value="고객 센터" ${noticeDto.BBS_CATE == '고객 센터' ? 'selected' : ''}>고객 센터</option>
                                <option value="매장 공지" ${noticeDto.BBS_CATE == '매장 공지' ? 'selected' : ''}>매장 공지</option>
                                <option value="배송 공지" ${noticeDto.BBS_CATE == '배송 공지' ? 'selected' : ''}>배송 공지</option>
                                <option value="쇼핑몰 공지" ${noticeDto.BBS_CATE == '쇼핑몰 공지' ? 'selected' : ''}>쇼핑몰 공지</option>
                                <option value="이벤트 공지" ${noticeDto.BBS_CATE == '이벤트 공지' ? 'selected' : ''}>이벤트 공지</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="statuslist">상태</label>
                            <select id="statuslist" name="STUS" style="height: 30px; width: 150px;">
                                <option value="게시중" ${noticeDto.STUS == '게시중' ? 'selected' : ''}>게시중</option>
                                <option value="비공개" ${noticeDto.STUS == '비공개' ? 'selected' : ''}>비공개</option>
                                <option value="수정중" ${noticeDto.STUS == '수정중' ? 'selected' : ''}>수정중</option>
                                <option value="삭제예정" ${noticeDto.STUS == '삭제예정' ? 'selected' : ''}>삭제예정</option>
                            </select>
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
                                    <button type="button" id="modifyBtn">수정</button>
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
        // 목록 버튼을 클릭하면
        $('#listBtn').on("click", function () {
            // url을 생성하고, page, pageSize 변수의 값을 전달한다.
            location.href = "<c:url value='/admin/notice/list'/>?page=${page}&pageSize=${pageSize}";
        })
        // 삭제 버튼을 클릭하면
        $("#removeBtn").on("click", function(){
            // 삭제 전 메세지
            if(!confirm("삭제하시겠습니까?")) return;
            // 확인을 선택하면, form 요소를 참조
            let form = $('#form');
            // "action", form 데이터를 제출할 대상 (url)
            form.attr("action", "<c:url value='/admin/notice/remove'/>?page=${page}&pageSize=${pageSize}");
            // "method", form 데이터를 전송할 HTTP 요청 방식 지정
            form.attr("method", "post");
            // form 요소를 서버에 제출
            form.submit();
            alert("삭제되었습니다.");
        });

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let page = $("#page").val(); // 수정 후에 해당되는 페이지
            let pageSize = $("#pageSize").val(); // 페이지 크기
            form.attr("action", "<c:url value='/admin/notice/modify'/>");
            form.attr("method", "post");
            form.append('<input type="hidden" name="page" value="' + page + '">'); // 페이지 전달
            form.append('<input type="hidden" name="pageSize" value="' + pageSize + '">'); // 페이지 크기 전달

            // form에 입력하지 않았을 때
            if ($("#writer").val().trim() == "") {
                alert("작성자를 입력해주세요.");
                return false;
            }
            if ($("#title").val().trim() == "") {
                alert("제목을 입력해주세요.");
                return false;
            }
            if ($("#title").val().length > 30) {
                alert("제목은 최대 30자까지 입력 가능합니다.");
                $("#title").focus();
                return false;
            }
            if ($("#content").val().trim() == "") {
                alert("내용을 입력해주세요.");
                return false;
            }
            if ($("#content").val().length > 5000) {
                alert("내용은 최대 5000자까지 입력 가능합니다.");
                $("content").focus();
                return false;
            }

            if (formCheck()){
                form.submit();
                alert("게시물이 수정되었습니다.");
            } else {
                alert("게시물 수정에 실패했습니다.");
                return false;
            }
        });




    });
</script>
</body>
</html>
