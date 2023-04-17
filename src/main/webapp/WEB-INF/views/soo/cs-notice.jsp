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
    <link rel="stylesheet" href="/css/soo/cs-notice.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>고객센터 - 공지사항</title>

    <style>

    </style>
</head>

<body>
<jsp:include page="../header.jsp" />

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
<%--                <ul>--%>
<%--                    <li><a href="#"><span>FAQ</span></a></li>--%>
<%--                    <li class="tab-notice"><a href="/cs/notice/list"><span>공지사항</span></a></li>--%>
<%--                    <li><a href="#"><span>1:1 상담</span></a></li>--%>
<%--                </ul>--%>
                <button class="tab-btn" NB_ID="F">FAQ</button>
                <button class="tab-btn" NB_ID="N">공지사항</button>
                <button class="tab-btn" NB_ID="C">1:1 상담</button>
            </nav>

            <!-- 검색창 -->
            <div class="search_box">
                <input type="text" placeholder="검색어를 입력하세요."/>
                <a href="#"><img src="/img/main/search.png"/></a>
            </div>

            <!-- 공지사항 카테고리 -->
            <div class="tab2">

                <button class="tab2-btn" BBS_CATE="전체">전체</button>
                <button class="tab2-btn" BBS_CATE="고객 센터">고객 센터</button>
                <button class="tab2-btn" BBS_CATE="매장 공지">매장 공지</button>
                <button class="tab2-btn" BBS_CATE="배송 공지">배송 공지</button>
                <button class="tab2-btn" BBS_CATE="쇼핑몰 공지">쇼핑몰 공지</button>
                <button class="tab2-btn" BBS_CATE="이벤트 공지">이벤트 공지</button>

            </div>

            <script>
                let msg="${msg}";
                if(msg=="listError") alert("게시물 목록을 불러올 수 없습니다.")
            </script>


            <!-- 게시물목록 -->
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
                            <td class="ttl">
                                <a href="<c:url value="/cs/notice/read${ph.sc.queryString}&NB_ID=${Notice.NB_ID}"/>">${Notice.TTL}</a>
                            </td><!--  게시물 제목 -->
                            <td class="reg_dtm"><fmt:formatDate value="${Notice.REG_DTM}" pattern="yyyy-MM-dd" type="date"/></td> <!--  게시물 작성일 -->
                        </tr>
                        </c:forEach>
                        </tbody>

                    </table>

                    <div>
                        <button type="button"><a href="/admin/notice/list">관리자 페이지</a></button>
                    </div>

                </div>
                <!-- 페이징 -->
               <div class="paging">
                  <c:if test="${ph.showPrev}">
                    <a class="page">
                     <a href="<c:url value="/cs/notice/list?page=${ph.beginPage-1}"/>">&lt;</a>
                  </c:if>
                  <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                      <a href="<c:url value="/cs/notice/list?page=${i}"/>">${i}</a>
                  </c:forEach>
                        <c:if test="${ph.showNext}">
                       <a href="<c:url value="/cs/notice/list?page=${ph.endPage+1}"/>">&gt;</a>
                   </c:if>
               </div>
            </section>
        </div>
    </section>
</div>
    </section>
</div>


<jsp:include page="../footer.jsp" />
</body>

<script>
    // 버튼 요소들을 선택
    const buttons = document.querySelectorAll('.tab2-btn');

    // 버튼 클릭 시 처리할 함수
    function handleButtonClick(event) {
        // 선택된 버튼에 active 클래스 추가
        buttons.forEach(btn => btn.classList.remove('active'));
        event.target.classList.add('active');

        // 선택된 버튼의 BBS_CATE 속성 값을 가져옴
        const BBS_CATE = event.target.getAttribute('BBS_CATE');

        // AJAX 요청을 보내서 해당 카테고리의 게시물을 조회
        // 여기서는 jQuery의 AJAX를 사용했지만, 다른 방법으로도 가능합니다.
        $.ajax({
            url: '/notice/list/{BBS_CATE}',
            type: 'GET',
            data: { BBS_CATE },
            success: function(result) {
                // 성공적으로 데이터를 받아왔을 때 처리할 코드
                console.log(result);
            },
            error: function(error) {
                // 오류가 발생했을 때 처리할 코드
                console.error(error);
            }
        });
    }

    // 각 버튼에 클릭 이벤트 리스너 추가
    buttons.forEach(btn => btn.addEventListener('click', handleButtonClick));


</script>



</html>
