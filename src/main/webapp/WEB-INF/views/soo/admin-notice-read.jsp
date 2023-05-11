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
        <a href="/admin/main">
            <span class="span1">관리자 </span>
            <span class="span2">매뉴얼</span>
        </a>
        <ul class="navi">
            <li>
                <a href="/memberPage/list">
                    <span class="menuWrap">회원 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="/admin/product/list">
                    <span class="menuWrap">상품 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="/admin/inv/list">
                    <span class="menuWrap">재고 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="/admin/notice/list">
                    <span class="menuWrap">게시판 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="/admin/logout">
                    <span class="menuWrap">로그아웃<button type="button" class="bar"></button></span>
                </a>
            </li>
        </ul>
    </div>

    <div class="admin-bar">
        <div class="admin-left">
            <h2>게시판 관리</h2>
            <ul  class="admin-ul">

                <li class="on"><a href="#" onfocus="this.blur();">게시판 관리</a>
                    <ul>
                        <li><a href="/admin/notice/list" onfocus="this.blur();">공지사항</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">FAQ</a></li>
                    </ul>
                    <ul>
                        <li><a href="/admin/counsel/list" onfocus="this.blur();">1:1 상담</a></li>
                    </ul>
                </li>

<%--                <li class="on"><a href="#" onfocus="this.blur();">검색어 관리</a>--%>
<%--                    <ul>--%>
<%--                        <li><a href="#" onfocus="this.blur();">검색어 목록</a></li>--%>
<%--                    </ul>--%>
<%--                    <ul>--%>
<%--                        <li><a href="#" onfocus="this.blur();">검색어 통계</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>

            </ul>


        </div><!-- //admin-left// -->


        <!-- 실제 구현 페이지 -->
        <div class="admin-container">
            <div class="admin-location">HOME &gt; 고객센터 관리 &gt; 공지사항 &gt; 등록</div>

            <div class="admin-contents">
                <h3>공지사항</h3>
                <p class="txtbox1 top1">
                    공지사항을 보여주는 페이지입니다.
                </p>

                <div class="inv-list">

                    <form id="form" class="frm" action="" method="post" >
                        <input type="hidden" name="NB_ID" value="${noticeDto.NB_ID}">
                        <input type="hidden" id="page" name="page" value="${page}">
                        <input type="hidden" id="pageSize" name="pageSize" value="${pageSize}">

                        <div class="form-group"> <!--게시물 카테고리-->

                            <label for="catelist">카테고리</label>  <!-- '<label>' 태그와 연결된 입력 요소의 id와 'for' 속성 값이 일치해야한다. -->
                            <!-- select 태그에서는 readonly 대신 "disabled" 사용해야 변경 불가능 -->
                            <select id="catelist" name="CATE_ID" style="height: 30px; width: 150px;" ${mode=="read"? "disabled" : "" } onclick="showCateOptions()">
                                <!-- 수정할 때 DB에 저장 된 option이 선택되어 있으려면 삼항연산자로 조건을 줘야한다 -->
                                <option class="category" value="" selected>선택하세요</option>
                                <option class="category" value="N01" ${noticeDto.CATE_ID == 'N01' ? 'selected' : ''}>고객 센터</option>
                                <option class="category" value="N02" ${noticeDto.CATE_ID == 'N02' ? 'selected' : ''}>매장 공지</option>
                                <option class="category" value="N03" ${noticeDto.CATE_ID == 'N03' ? 'selected' : ''}>배송 공지</option>
                                <option class="category" value="N04" ${noticeDto.CATE_ID == 'N04' ? 'selected' : ''}>쇼핑몰 공지</option>
                                <option class="category" value="N05" ${noticeDto.CATE_ID == 'N05' ? 'selected' : ''}>이벤트 공지</option>
                            </select>
                        </div>

                        <div class="form-group"> <!--게시물 상태-->
                            <label for="statuslist">상태</label>
                            <select id="statuslist" name="STUS" style="height: 30px; width: 150px;" ${mode=="read"? "disabled" : ""} onclick="showStusOptions()">
                                <option class="status" value="" selected>선택하세요</option>
                                <option class="status" value="게시중" ${noticeDto.STUS == '게시중' ? 'selected' : ''}>게시중</option>
                                <option class="status" value="비공개" ${noticeDto.STUS == '비공개' ? 'selected' : ''}>비공개</option>
                                <option class="status" value="수정중" ${noticeDto.STUS == '수정중' ? 'selected' : ''}>수정중</option>
                                <option class="status" value="삭제예정" ${noticeDto.STUS == '삭제예정' ? 'selected' : ''}>삭제예정</option>
                            </select>
                        </div>



                        <div class="form-group">
                            <label for="writer">작성자</label>  <%--  mode=read일때 readonly로  --%>
                            <input type="text" id="writer" name="WRTR" value="${noticeDto.WRTR}" ${mode=="read"? "readonly='readonly'" : ""} placeholder="작성자를 입력해 주세요.">
                        </div>
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="TTL" value="${noticeDto.TTL}" ${mode=="read"? "readonly='readonly'" : ""} placeholder="제목을 입력해 주세요.">
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
<%--                            <textarea id="content" placeholder="  내용을 입력해 주세요." name="CN" ${mode=="read"? "readonly='readonly'" : ""}--%>
<%--                                      style="height: 400px; max-height: 5000px;">${noticeDto.CN} </textarea>--%>
                            <textarea id="content" name="CN" ${mode=="read"? "readonly='readonly'" : ""}
                                      style="height: 400px; max-height: 5000px;"
                                      placeholder="내용을 입력해 주세요.">${noticeDto.CN}</textarea>



                        </div>

                            <div class="listBtm" style="text-align: right;">
                                <c:if test="${mode eq 'mod'}">  <!-- 수정일 때만 보여주기 -->
                                <span><button type="button" id="modifyBtn">수정</button></span>
                                </c:if>
                                <c:if test="${mode eq 'new'}">  <!-- 글쓰기 모드일 때만 보여주기 -->
                                    <span><button type="submit" id="writeBtn">등록</button></span>
                                </c:if>
                                <c:if test="${mode ne 'new'}">  <!-- 글쓰기 모드일 때 안보이기-->
                                <span><button type="button" id="removeBtn">삭제</button></span>
                                </c:if>
                                <span><button type="button" id="listBtn">목록</button></span>
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
        });
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

        // 수정버튼
        $("#modifyBtn").on("click", function() {
            let form = $("#form");
            let page = $("#page").val(); // 수정 후에 해당되는 페이지, val() => 해당 요소의 값을 가져오거나 설정하는 메서드
            let pageSize = $("#pageSize").val(); // 페이지 크기
            form.attr("action", "<c:url value='/admin/notice/modify'/>");
            form.attr("method", "post");
            form.append('<input type="hidden" name="page" value="' + page + '">'); // 페이지 전달
            form.append('<input type="hidden" name="pageSize" value="' + pageSize + '">'); // 페이지 크기 전달

            // form이 비어있을 때
            if ($("#writer").val().trim() == "") { // trim() => 문자열에서 양 끝의 공백을 제거하는 메서드
                alert("작성자를 입력해주세요.");
                return false;
            }
            if ($("#title").val().trim() == "") {
                alert("제목을 입력해주세요.");
                return false;
            }
            // 글자수를 넘겼을 때
            if ($("#title").val().length > 50) {
                alert("제목은 최대 50자까지 입력 가능합니다.");
                $("#title").focus();    // focus() => 현재 작업하고 있는 요소를 가르키는 메서드
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

            form.submit();
            alert("게시물이 수정되었습니다.");
        });

            // 등록버튼
            $("#writeBtn").on("click", function () {
                let form = $("#form");
                form.attr("action", "/admin/notice/write");
                form.attr("method", "post");

                // form에 입력하지 않았을 때
                if ($("#writer").val().trim() == "") {
                    alert("작성자를 입력해주세요.");
                    return false;
                }
                if ($("#title").val().trim() == "") {
                    alert("제목을 입력해주세요.");
                    return false;
                }
                if ($("#title").val().length > 50) {
                    alert("제목은 최대 50자까지 입력 가능합니다.");
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
                // form
                if (formCheck()) {
                    form.submit();
                    alert("게시물이 등록되었습니다.");
                } else {
                    alert("게시물 등록에 실패했습니다.");
                    return false;
                }
            });

    });

    function showCateOptions() {
        // 셀렉트 박스의 옵션 목록을 보이게 함
        document.getElementById("catelist").size = "1";

        // "선택하세요" 옵션 숨김 처리
        document.querySelector("#catelist option[value='']").style.display = "none";

        // 옵션을 선택하면 옵션 목록을 다시 숨김 처리하고 선택한 옵션으로 대체
        document.getElementById("catelist").onchange = function () {
            document.getElementById("catelist").size = "1";
        };
    }

    document.getElementById("catelist").onchange = function () {
        document.getElementById("catelist").size = "1";
    };


    function showStusOptions() {
        // 셀렉트 박스의 옵션 목록을 보이게 함
        document.getElementById("statuslist").size = "1";

        // "선택하세요" 옵션 숨김 처리
        document.querySelector("#statuslist option[value='']").style.display = "none";

        // 옵션을 선택하면 옵션 목록을 다시 숨김 처리하고 선택한 옵션으로 대체
        document.getElementById("statuslist").onchange = function () {
            document.getElementById("statuslist").size = "1";
        };
    }

    document.getElementById("statuslist").onchange = function () {
        document.getElementById("statuslist").size = "1";
    };
</script>
</body>
</html>
