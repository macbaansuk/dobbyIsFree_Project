<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>마이페이지 - 문의 제품 찾기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<div class="list">
<table>
    <colgroup>
        <col style="width: 20%;">
        <col style="width: 80%">

    </colgroup>

    <tbody>
    <tr>
        <th>제품번호</th>
        <th>제품이름</th>
    </tr>
    <%--                                adminNoticeList에 저장된 데이터를 꺼내서 Notice변수에 저장--%>
    <c:forEach var="prod" items="${prodList}">
        <tr>
            <!-- 제품 번호  -->
            <td>
                <c:out value="${prod.PROD_ID}"></c:out>
            </td>
            <!-- 제품 이름  -->
            <td>
                <a class="prodData" href='<c:out value="${prod.PROD_ID}"/>' data-name='<c:out value="${prod.PROD_NM}"/>'>
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
        <a href="<c:url value="/mypage/counsel/write/prodPop?page=${ph.beginPage-1}"/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        <a href="<c:url value="/mypage/counsel/write/prodPop?page=${i}"/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
        <a href="<c:url value="/mypage/counsel/write/prodPop?page=${ph.endPage+1}"/>">&gt;</a>
        </c:if>
</div>

</div>
</body>
<script>
    /* 제품 선택 및 팝업창 닫기 */
    // 제품이름 클릭
    $(".prodData").on("click", function(e){

        e.preventDefault();
        // 제품아이디, 이름 변수에 담기
        let prodId = $(this).attr("href");
        let prodName= $(this).data("name");
        // let displayProdName = "[문의제품] " + prodName;
        console.log(prodId);
        // $(opener.document).find("#prodId_input").val(prodId);
        // $(opener.document).find("#prodName_input").val(prodName);
        $(opener.document).find("#prodId_input").attr('value', prodId);
        $(opener.document).find("#prodName_input").attr('value', prodName);
        console.log($(opener.document).find("#prodId_input").val());
        console.log($(opener.document).find("#prodName_input").val());
        window.close();

    });
</script>
</html>
