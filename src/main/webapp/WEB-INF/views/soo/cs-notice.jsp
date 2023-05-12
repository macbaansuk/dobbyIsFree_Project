<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        .tab2-btn a {text-decoration: none; color: black;}
        .tab2-btn a:visited {text-decoration: none;}
        .tab2-btn a:hover {text-decoration: none; color: white;}
    </style>
</head>

<body>
<jsp:include page="../header.jsp" />

<div id="container">

    <!-- location -->
<%--    <div class="location">--%>
<%--        홈 > 고객센터 > 공지사항--%>
<%--    </div>--%>
    <section id="contents">
        <div>
            <h2 class="page_title">고객센터</h2>
        </div>

        <div class="wrap">
            <!-- 게시판카테고리 -->
            <nav class="bbsList">
                <ul class="cate1">
                    <li id="F">
                        <a href="#"><span>FAQ</span></a>
                    </li>
                    <li id="N">
                        <a href="/cs/notice/list"><span>공지사항</span></a>
                    </li>
                    <li id="C">
                        <a href="/cs/counsel/main"><span>1:1 상담</span></a>
                    </li>
                </ul>
            </nav>

            <!-- 검색창 -->
            <div class="search_box">
                <input type="text" placeholder="검색어를 입력하세요."/>
                <a href="#"><img src="/img/main/search.png"/></a>
            </div>

            <!-- 공지사항 카테고리 -->
            <div class="cateList">
                <ul class="cate2">
                    <li><button type="button" onclick="getList('','0')" value="all"><span>전체</span></button></li>
                    <li><button type="button" onclick="getList('N01','1')" value="customer"><span>고객센터</span></button></li>
                    <li><button type="button" onclick="getList('N02','2')" value="store"><span>매장공지</span></button></li>
                    <li><button type="button" onclick="getList('N03','3')" value="delivery"><span>배송공지</span></button></li>
                    <li><button type="button" onclick="getList('N04','4')" value="shop"><span>쇼핑몰공지</span></button></li>
                    <li><button type="button" onclick="getList('N05','5')" value="event"><span>이벤트</span></button></li>
                </ul>
            </div>


            <script>
                let msg = "${msg}";
                if( msg == "listError" ) alert("게시물 목록을 불러올 수 없습니다.")
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
                            <!--  게시물 번호 -->
                            <td class="nb_id">${Notice.NB_ID}</td>
                            <!--  게시물 카테고리 -->
                            <td class="bbs_cate" value="${Notice.CATE_NM}">${Notice.CATE_NM}</td>
                            <!--  게시물 제목 -->
                            <td class="ttl">
                                <a href="<c:url value="/cs/notice/read${ph.sc.queryString}&NB_ID=${Notice.NB_ID}"/>">${Notice.TTL}</a>
                            </td>
                            <!--  게시물 작성일 -->
                            <td class="reg_dtm"><fmt:formatDate value="${Notice.REG_DTM}" pattern="yyyy-MM-dd" type="date"/></td>
                        </tr>
                        </c:forEach>
                        </tbody>

                    </table>

<%--                    <div>--%>
<%--                        <button type="button"><a href="/admin/main">관리자 페이지</a></button>--%>
<%--                    </div>--%>

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



<jsp:include page="../footer.jsp" />
</body>

<script>
    // $(document).ready(function() {
    //     var category = $('.cateBtn');
    //     var listByCate = $('.bbs_cate');
    //     var currentPage = 1;
    //
    //     category.click(function(){
    //         $(this).addClass('active').siblings().removeClass('active');
    //         var cateValue = $(this).val();
    //         console.log(cateValue);
    //
    //         if (cateValue === 'all') { // 전체 카테고리를 선택한 경우
    //             listByCate.closest('tr').fadeIn(); // 모든 게시물을 보여줌
    //         } else { // 특정 카테고리를 선택한 경우
    //             listByCate.closest('tr').fadeOut(); // 모든 게시물을 숨김
    //             listByCate.filter('[value="'+cateValue+'"]').closest('tr').fadeIn(); // 클릭한 카테고리에 해당하는 게시물만 보여줌
    //         }
    //
    //         currentPage = 1; // 필터링 후 첫 페이지로 설정
    //     });
    //
    //     $('.paging a').click(function(e) {
    //         e.preventDefault();
    //         var href = $(this).attr('href');
    //         currentPage = href.substring(href.indexOf('=') + 1);
    //         // 페이지 이동 후 필터링 다시 적용
    //         var activeCate = $('.cateBtn.active').val();
    //
    //
    //         if (activeCate === 'all') { // 전체 카테고리를 선택한 경우
    //             $('.list tbody tr').show(); // 모든 게시물을 보여줌
    //         } else { // 특정 카테고리를 선택한 경우
    //             $('.list tbody tr').hide(); // 모든 게시물을 숨김
    //             listByCate.filter('[value="'+activeCate+'"]').parent().show(); // 클릭한 카테고리에 해당하는 게시물만 보여줌
    //         }
    //     });
    // }); // ready


    $(document).on('click', '.cateBtn', function() {
        $('.cateBtn[value="all"]').trigger('click');

        var category = $(this).val();
        $.ajax({
            url: '/cs/notice/list',
            type: 'GET',
            data: {category: category},
            success: function(data) {
                $('.noticeList').html(data);
                console.log(data);
            },
            error: function() {
                alert('게시물 로딩에 실패했습니다.');
            }
        });
    });

    const faqBtn = document.querySelector('#F');
    const noticeBtn = document.querySelector('#N');
    const counselBtn = document.querySelector('#C');

    faqBtn.addEventListener('click', function() {
        window.location.href = '#'; // 링크 주소 입력
    });

    noticeBtn.addEventListener('click', function() {
        window.location.href = '/cs/notice/list'; // 링크 주소 입력
    });

    counselBtn.addEventListener('click', function() {
        window.location.href = '/cs/counsel/main'; // 링크 주소 입력
    });


</script>



</html>
