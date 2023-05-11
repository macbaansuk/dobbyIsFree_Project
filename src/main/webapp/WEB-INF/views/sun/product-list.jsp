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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>





</head>
<body>
<jsp:include page="../header.jsp"/>

<section class="contents">

    <div class="product-header">
        <div class="product-text">
            <h2 class="product-title">${productList[0].CATE_NM}</h2> <!--list 객체 사용-->
            <div class="product-desc">

                <pre>${productList[0].CATE_DESC}</pre>
            </div>
        </div>

        <img src="${productList[0].CATE_REP_IMG}" alt="${productList[0].CATE_NM} 메인사진"/>

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
                        <button type="button" id="latest" class="sort-btn" data-sort="latest">최신순</button>
                    </li>
                    <li>
                        <button type="button" id="highest_price" class="sort-btn" data-sort="highprice">높은 가격순</button>
                    </li>
                    <li>
                        <button type="button" id="lowest_price" class="sort-btn" data-sort="lowprice">낮은 가격순</button>
                    </li>
                </ul>
            </div>
        </div>

        <div id="productlist" class="product-list">
            <c:forEach var="p" items="${productList}">
                <div class="product">
                    <a href="/product/productdetail/${p.PROD_ID}">
                        <div class="product-img">
                            <img src="${p.REP_IMG}" alt="메인 상품 이미지">
                        </div>
                        <div class="product-info">
                            <span class="product-name">${p.PROD_NM}</span>
                            <p class="price">
                                <c:choose>
                                    <c:when test="${p.DC_YN == 'N'}">
                                        <strong class="discount-price">${p.AMT}</strong>
                                        <span class="original-price"></span>
                                        <span class="discount-rate"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="dc" items="${Products_DC}">
                                            <c:if test="${p.PROD_ID == dc.prod_id}">
                                                <strong class="discount-price">${dc.dc_price}</strong>
                                                <span class="discount-rate">${dc.dc_rate}%</span>
                                            </c:if>
                                        </c:forEach>
                                        <span class="original-price">${p.AMT}</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </a>
                    <div class="star-wrap">
                        <div class="starcnt">
                            <i class="fas fa-star"></i>
                            <span class="star-rating">${p.AVG_ASCR} (${p.REVW_NCNT})</span>
                        </div>
                        <div class="icons">
                    <span class="heart-icon">
                        <i class="fa-regular fa-heart"></i>
                    </span>
                            <span class="cart-icon">
                        <i onclick="insertA(${p.PROD_ID})" class="fa-solid fa-cart-shopping"></i>
                    </span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>


        <script>


            $(document).ready(function () {
                $(".sort-btn").on('click', function () {
                    $.ajax({
                        url: '/product/list/' + ${category} + '/ajax',
                        data: {sort: $(this).attr('id')},
                        success: function (data) {
                            var productlist = $("#productlist").empty();

                            data.forEach(function (p) {
                                var productdiv = $('<div class="product"></div>');
                                var productlink = $('<a>').attr('href', '/product/productdetail/' + p.prod_id);

                                var productimgdiv = $('<div class="product-img"></div>').append($('<img>').attr({'src':p.rep_img , 'alt': p.prod_nm}));
                                var productinfodiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(p.prod_nm));

                                var priceelement = $('<p class="price"></p>');

                                if (p.dc_yn === 'N') {
                                    priceelement.append('<strong class="discount-price">' + p.amt + '</strong>')
                                        .append('<span class="original-price"></span>')
                                        .append('<span class="discount-rate"></span>');
                                } else {
                                    var discountprice = p.dc_price;
                                    var discountrate = p.dc_rate;

                                    priceelement.append('<strong class="discount-price">' + discountprice + '</strong>')
                                        .append('<span class="discount-rate">' + discountrate + '%</span>')
                                        .append('<span class="original-price">' + p.amt + '</span>');
                                }

                                productinfodiv.append(priceelement);
                                productlink.append(productimgdiv).append(productinfodiv);
                                productdiv.append(productlink);

                                var starwrapdiv = $('<div class="star-wrap"></div>');
                                var starcntdiv = $('<div class="starcnt"></div>')
                                    .append('<i class="fas fa-star"></i>')
                                    .append('<span class="star-rating">' + p.avg_ascr + ' (' + p.revw_ncnt + ')</span>');
                                var iconsdiv = $('<div class="icons"></div>')
                                    .append('<span class="heart-icon"><i class="fa-regular fa-heart"></i></span>')
                                    .append('<span class="cart-icon"><i onclick="insertA(' + p.prod_id+ ')" class="fa-solid fa-cart-shopping"></i></span>');

                                starwrapdiv.append(starcntdiv).append(iconsdiv);
                                productdiv.append(starwrapdiv);
                                productlist.append(productdiv);
                            });
                        },
                        dataType: 'json'
                    });
                });
            });



        </script>
    </div>


</section>


<jsp:include page="../footer.jsp"/>
</body>
</html>