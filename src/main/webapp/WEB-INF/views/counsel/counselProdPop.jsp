<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>마이페이지 - 문의 제품 찾기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<style>
    *{
        font-family: "나눔바른고딕OTF", "돋움";
    }
    #productName{
        text-decoration: none; /* 밑줄 제거 */
        color: black; /* 무조건 검은색으로 설정 */
        cursor: pointer;
        text-decoration-line: none;
    }
    a:visited #productName{
        text-decoration: none; /* 밑줄 제거 */
        color: black; /* 무조건 검은색으로 설정 */
        cursor: pointer;
        text-decoration-line: none;
    }
    #productName:hover {
        color: rgb(18, 182, 96);
        font-weight: bold;
    }

    #qnaProd {
        margin: 30px 0 0 25px;
    }

    #searchInfo {
        font-size: 14px;
        text-align: right;
        color: rgb(18, 182, 96);
        margin: 0 25px 5px 0;
    }
    /*table{*/
    /*    margin: 0 auto;*/
    /*    display: block;*/
    /*}*/
    table {
        width: 440px;
        border-collapse: collapse;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 30px;
    }


    th {
        border-top: 1px solid #1b1e26;
        border-bottom: 1px solid #1b1e26;
        text-align: center;
        padding: 10px;
    }

    td {
        padding: 10px;
        border-bottom: 0.5px solid lightgray;

    }

    .prodData {
        text-decoration: underline;
        color: blue;
        cursor: pointer;
    }

    .paging {
        margin-top: 15px;
        text-align: center;
    }

    .pageNum {
        text-decoration: none !important; /* 밑줄 제거 */
        color: black !important; /* 무조건 검은색으로 설정 */
        cursor: pointer;
        text-decoration-line: none !important;
    }

    a:visited .pageNum  {
        text-decoration: none !important; /* 밑줄 제거 */
        color: black !important; /* 무조건 검은색으로 설정 */
        cursor: pointer;
        text-decoration-line: none !important;
    }

    #prodnum {
        text-align: center;
    }



</style>
<body>
<div class="list">
    <h3 id="qnaProd">문의제품 선택</h3>
    <p id="searchInfo"> * 제품 이름을 클릭해주세요</p>
<table>
    <colgroup>
        <col style="width: 25%;">
        <col style="width: 75%">

    </colgroup>

    <tbody>
    <tr>
        <th>제품 번호</th>
        <th>제품 이름</th>
    </tr>
    <%--                                adminNoticeList에 저장된 데이터를 꺼내서 Notice변수에 저장--%>
    <c:forEach var="prod" items="${prodList}">
        <tr>
            <!-- 제품 번호  -->
            <td id="prodnum">
                <c:out value="${prod.PROD_ID}"></c:out>
            </td>
            <!-- 제품 이름  -->
            <td>
                <a id="productName"href="#" class="prodData" data-id='<c:out value="${prod.PROD_ID}"/>' data-name='<c:out value="${prod.PROD_NM}"/>'>
                    <c:out value="${prod.PROD_NM}"></c:out>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 페이징 -->
<div class="paging">
    <c:if test="${ph.showPrev}">
    <a class="page">
        <a class="pageNum" href="<c:url value="/mypage/counsel/write/prodPop?page=${ph.beginPage-1}"/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        <a class="pageNum" href="<c:url value="/mypage/counsel/write/prodPop?page=${i}"/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
        <a class="pageNum" href="<c:url value="/mypage/counsel/write/prodPop?page=${ph.endPage+1}"/>">&gt;</a>
        </c:if>
    </a>
</div>

</div>
</body>
<script>
    /* 제품 선택 및 팝업창 닫기 */
    // 제품이름 클릭




    $(document).on("click", ".prodData", function(e) { // 제품명을 클릭하면
        e.preventDefault();
        var prodId = $(this).data("id"); // 선택한 제품 ID
        var prodName = $(this).data("name"); // 선택한 제품 이름

        // 선택한 제품 ID와 이름을 부모창으로 전달
        window.opener.document.getElementById("prodId_input").value = prodId;
        window.opener.document.getElementById("prodName_input").value = prodName;

        // 팝업창 닫기
        window.close();
    });

</script>
</html>
