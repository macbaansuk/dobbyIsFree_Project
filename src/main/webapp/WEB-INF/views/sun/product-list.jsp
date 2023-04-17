<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <link href="/css/sun/list.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/d66ae73db8.js" crossorigin="anonymous"></script>


</head>
<body>
<jsp:include page="../header.jsp"/>

<section class="contents">

    <div class="product-header">
        <div class="product-text">
            <h2 class="product-title">${productList[0].cate_nm}</h2> <!--list 객체 사용-->
            <div class="product-desc">
                <p>
                <pre>${productList[0].cate_desc}</pre>
                </p>
            </div>
        </div>

        <img src="${productList[0].cate_rep_img}" alt="${productList[0].cate_nm} 메인사진"/>

    </div>

    <div class="product-contents">
        <div class="sort-contents">
            <p class="product-length">
                총
                <strong class="num">
                    ${countProducts}개
                </strong>
                의 제품이 있습니다.
            </p>

            <div class="product-sort-click">
                <ul>
                    <li>
                        <button type="button" class="sort-btn" data-sort="latest">최신순</button>
                    </li>
                    <li>
                        <button type="button" class="sort-btn" data-sort="high-price">높은 가격순</button>
                    </li>
                    <li>
                        <button type="button" class="sort-btn" data-sort="low-price">낮은 가격순</button>
                    </li>
                </ul>
            </div>

        </div>



        <!-- 상품 리스트 -->
        <div class="product-list">
            <c:forEach var="p" items="${productList}">
                <div class="product">
                    <a href="/product/productDetail/${p.prod_id}">
                        <div class="product-img">

                            <img src="${p.rep_img}" alt="${p.prod_nm}">
                        </div>
                        <div class="product-info">
                            <span class="product-name">${p.prod_nm}</span>
                            <p class="price">
                                <c:choose>
                                    <c:when test="${p.dc_yn == 'N'}">
                                        <strong class="discount-price">${p.amt}</strong>
                                        <span class="original-price"></span>
                                        <span class="discount-rate"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="dc" items="${Products_DC}">
                                            <c:if test="${p.prod_id == dc.prod_id}">
                                                <strong class="discount-price">${dc.dc_price}</strong>
                                                <span class="discount-rate">${dc.dc_rate}%</span>
                                            </c:if>
                                        </c:forEach>
                                        <span class="original-price">${p.amt}</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </a>






                    <div class="star-wrap">
                        <i class="fas fa-star"></i>
                        <span class="star-rating">${p.avg_ascr} (${p.revw_ncnt})</span>
                        <span class="heart-icon">
                                     <i class="far fa-heart"></i>
                                     <i class="fa-solid fa-cart-shopping"></i>
                                </span>
                    </div>
                </div>
            </c:forEach>

        </div>

    </div>




</section>


<jsp:include page="../footer.jsp"/>
</body>
</html>