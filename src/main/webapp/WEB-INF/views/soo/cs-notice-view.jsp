<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <link rel="stylesheet" href="/css/soo/cs-notice-view.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>공지사항</title>

    <style>

    </style>
</head>

<body>
<jsp:include page="../header.jsp"/>

<div id="container">

    <!-- location -->
    <div class="location">
        홈 > 고객센터 > 공지사항
    </div>
    <section id="contents">
        <div>
            <h2 class="page_title">고객센터</h2>
        </div>

        <div class="wrap">
            <!-- 게시판카테고리 -->
            <nav class="tab">
                <ul>
                    <li><a href="#"><span>FAQ</span></a></li>
                    <li class="tab-notice"><a href="/cs/notice/list"><span>공지사항</span></a></li>
                    <li><a href="#"><span>1:1 상담</span></a></li>
                </ul>
            </nav>

            <script>
                let msg="${msg}";
                if(msg=="readError") alert("게시물 조회 중 오류가 발생했습니다.")
            </script>


            <!-- 게시물 보기 -->
            <section class="listView">
                <div class="listTitle">
                    <span class="cate">${noticeDto.BBS_CATE}</span>
                    <span class="title">${noticeDto.TTL}</span>
                    <span class="date"><fmt:formatDate value="${noticeDto.REG_DTM}" pattern="yyyy-MM-dd" type="date"/></span>
                </div>
                <div class="listCont">
                    <p>
                        ${noticeDto.CN}
                    </p>
                </div>
                <div class="listBtm">
                    <button type="button" id="listBtn">목록</button>
                </div>
            </section>

        </div>

    </section>
</div>
<jsp:include page="../footer.jsp"/>

<script>
    $(document).ready(function(){
        $('#listBtn').on("click", function () {
            location.href = "<c:url value='/cs/notice/list'/>?page=${page}&pageSize=${pageSize}";
        })
    });
</script>

</body>

</html>