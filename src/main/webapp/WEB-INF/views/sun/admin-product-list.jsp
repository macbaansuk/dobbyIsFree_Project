<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>관리자 상품 목록</title>
</head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../css/soo/admin-nav.css"/>
<link rel="stylesheet" href="../../css/sun/admin-product-list.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    section whole{
        width:100% ;
    }
</style>
<body>


<div class="admin">

    <%--    <jsp:include page="../admin_header.jsp"/>--%>
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
            <h2>상품 관리</h2>
            <ul class="admin-ul">
                <li class="on"><a href="#" onfocus="this.blur();">상품 관리</a></li>
                <ul>
                    <li><a href="/admin/product/list" onfocus="this.blur();">상품목록</a></li>
                </ul>

            </ul>
        </div><!-- //admin-left// -->




        <div class="admin-container">
            <div class="admin-location">HOME &gt; 고객센터 관리 &gt; 상품 &gt; 목록</div>

            <div class="admin-contents">
                <h3>상품 목록</h3>
                <p class="txtbox1 top1">
                    상품 목록을 보여주는 페이지입니다.
                </p>
                <%--카테고리, 상태를 선택할 수 있는 부분--%>

                <div class="inv-list">
                    <!-- 실제 구현 페이지 -->
                    <%--                    <section class="whole">--%>
                    <%--                        <div class="listHead">--%>
                    <%--                            <div>--%>
                    <%--                                &lt;%&ndash;@declare id="cate"&ndash;%&gt;<label for="cate">카테고리</label>--%>
                    <%--                                <select id="catelist" name="BBS_CATE" style="height: 30px; width: 150px;" value="${noticeDto.BBS_CATE}">--%>
                    <%--                                    <option value="고객 센터">고객 센터</option>--%>
                    <%--                                    <option value="매장 공지">매장 공지</option>--%>
                    <%--                                    <option value="배송 공지">배송 공지</option>--%>
                    <%--                                    <option value="쇼핑몰 공지">쇼핑몰 공지</option>--%>
                    <%--                                    <option value="이벤트 공지">이벤트 공지</option>--%>
                    <%--                                </select>--%>
                    <%--                            </div>--%>
                    <%--                            <div>--%>
                    <%--                                --%>
                    <%--                                &lt;%&ndash;@declare id="status"&ndash;%&gt;<label for="status">상태</label>--%>
                    <%--                                <select id="statuslist" name="STUS" style="height: 30px; width: 150px;" value="${noticeDto.STUS}">--%>
                    <%--                                    <option value="게시중">게시중</option>--%>
                    <%--                                    <option value="비공개">비공개</option>--%>
                    <%--                                    <option value="수정중">수정중</option>--%>
                    <%--                                    <option value="삭제예정">삭제예정</option>--%>
                    <%--                                </select>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>

                    <div class="listMid">
                        <span class="cnt">총 ${totalCnt}개</span>
                        <span class="btn">
                                <button id="writeBtn" type="submit" onclick="location.href='<c:url value="/admin/product/register"/>'">등록</button>
                            </span>
                    </div>

                    <div class="list">
                        <table>
                            <colgroup>
                                <col style="width: 6%;">
                                <col style="width: 8%">
                                <col style="width: 40%;">
                                <col style="width: 8%;">
                                <col style="width: 7%">
                                <col style="width: 18%;">
                                <col style="width: 15%;">
                            </colgroup>

                            <tbody>
                            <tr>
                                <th>상품 ID</th>
                                <th>카테고리</th>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>상품 상태</th>
                                <th>등록일시</th>
                                <th>버튼</th>
                            </tr>
                            <c:forEach var="P" items="${adminProductList}">
                                <tr>
                                    <!--  상품 아이디 -->
                                    <td class="nb_id">${P.prod_id}</td>
                                    <!--  카테고리 -->
                                    <td class="ttl">${P.cate_nm}</td>
                                    <!--  상품명 -->
                                    <td class="bbs_cate">
                                        <c:choose>
                                            <c:when test="${P.prod_nm == '올리브 에멜전'}">
                                                <a href="<c:url value="/admin/product/read?id=${P.prod_id}&page=${page}&pageSize=${pageSize}"/>">
                                                    <img src="/img/sun/olive.jpg" alt="${P.prod_nm} 상품 이미지" align="middle"/>${P.prod_nm}
                                                </a>
                                            </c:when>
                                            <c:when test="${P.prod_nm == '뉴 포맨 올인원'}">
                                                <a href="<c:url value="/admin/product/read?id=${P.prod_id}&page=${page}&pageSize=${pageSize}"/>">
                                                        <%--                                                    <img src="/img/sun/product-image/${P.rep_img}" alt="${P.prod_nm} 상품 이미지" align="middle"/>${P.prod_nm}--%>
                                                    <img src="/img/sun/product-image/men/new_forest_men.jpg" alt="${P.prod_nm} 상품 이미지" align="middle"/>${P.prod_nm}
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="<c:url value="/admin/product/read?id=${P.prod_id}&page=${page}&pageSize=${pageSize}"/>">
                                                    <img src="${P.rep_img}" alt="${P.prod_nm} 상품 이미지" align="middle"/>${P.prod_nm}
                                                </a>
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <!--  가격-->

                                        <%--                                    <td class="wrtr">${P.amt}</td>--%>
                                    <td class="wrtr"><fmt:formatNumber value="${P.amt}" groupingUsed="true" /></td>
                                    <!--  상태 -->
                                    <td class="stus">${P.prod_stus}</td>
                                    <!--  등록일시 -->
                                    <td class="reg_dtm"><fmt:formatDate value="${P.reg_dtm}" pattern="yyyy-MM-dd " type="date"/></td>
                                    <!--  수정, 삭제버튼 -->
                                    <td>


                                            <%--                                        <button id="modifyBtn" type="button">수정</button>--%>

                                        <button id="removeBtn" type="button" onclick="deleteProduct(${P.prod_id})">삭제</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>




                        <!-- 페이징 -->
                        <div class="paging">
                            <c:if test="${ph.showPrev}">
                            <a class="page">
                                <a href="<c:url value="/admin/product/list?page=${ph.beginPage-1}"/>">&lt;</a>
                                </c:if>
                                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a href="<c:url value="/admin/product/list?page=${i}"/>">${i}</a>
                                </c:forEach>
                                <c:if test="${ph.showNext}">
                                <a href="<c:url value="/admin/product/list?page=${ph.endPage+1}"/>">&gt;</a>
                                </c:if>
                        </div>

                    </div>

                    <script>
                        function deleteProduct(id) {
                            if (confirm("정말로 삭제하시겠습니까?")) {
                                $.ajax({
                                    type: "POST",
                                    url: "/admin/product/remove",
                                    data: {id: id},
                                    success: function() {
                                        location.reload();
                                        alert("상품이 성공적으로 삭제되었습니다.");
                                    },
                                    error: function() {
                                        alert("상품 삭제에 실패했습니다.");
                                    }
                                });
                            }
                        }




                        let msg = "${msg}";
                        if (msg=="login_ERR") alert("로그인 정보를 다시 확인해주세요.")

                    </script>



                    </section>
                </div>
            </div>
        </div><!-- //Container// -->
    </div>
</div>


<div class="admin-footer">
    Copyright ⓒ 2023 됐나욧 All rights reserved.
</div>

</body>
</html>