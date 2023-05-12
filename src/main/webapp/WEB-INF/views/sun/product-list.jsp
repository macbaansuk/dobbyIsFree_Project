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
    <link rel="stylesheet" href="/css/hwa/modal.css"/><!--모달창-->






</head>
<body>
<jsp:include page="../header.jsp"/>

<section class="contents">

    <div class="product-header">
        <div class="product-text">
            <h2 class="product-title">${productList[0].cate_nm}</h2> <!--list 객체 사용-->
            <div class="product-desc">

                <pre>${productList[0].cate_desc}</pre>
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
                    <a href="/product/productDetail/${p.prod_id}">
                        <div class="product-img">
                            <img src="/img/sun/product-image/${p.rep_img}" alt="메인 상품 이미지">
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
                                        <c:forEach var="dc" items="${Cate_Products_DC}">
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
                        <div class="starcnt">
                            <i class="fas fa-star"></i>
                            <span class="star-rating">${p.avg_ascr} (${p.revw_ncnt})</span>
                        </div>
                        <div class="icons">
                    <span class="heart-icon">
                        <i class="fa-regular fa-heart"></i>
                    </span>
                            <span class="cart-icon">
                        <i onclick="insertA(${p.prod_id})" class="fa-solid fa-cart-shopping"></i>
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
                                var productlink = $('<a>').attr('href', '/product/productDetail/' + p.prod_id);

                                var productimgdiv = $('<div class="product-img"></div>').append($('<img>').attr({'src': '/img/sun/product-img/' + p.rep_img, 'alt': p.prod_nm}));
                                var productinfodiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(p.prod_nm));

                                var priceelement = $('<p class="price"></p>');

                                if (p.dc_yn === 'N') {
                                    priceelement.append('<strong class="discount-price">' + p.amt + '</strong>')
                                        .append('<span class="original-price"></span>')
                                        .append('<span class="discount-rate"></span>');
                                } else {
                                    var discountprice = p.dc_price;
                                    var discountrate = p.dc_rate;

                                //     priceelement.append('<strong class="discount-price">' + discountprice + '</strong>')
                                //         .append('<span class="discount-rate">' + discountrate + '%</span>')
                                //         .append('<span class="original-price">' + p.amt + '</span>');
                                // }
                                    // p.dc_price 또는 p.dc_rate 가 null이 아닌 경우에만 추가
                                    if(discountrate == null ) {
                                        priceelement.append('<strong class="discount-price">' + p.amt + '</strong>')
                                            .append('<span class="discount-rate">' + '' + '</span>')
                                            .append('<span class="original-price">' + '' + '</span>');
                                    }else{
                                            priceelement.append('<strong class="discount-price">' + discountprice + '</strong>')
                                                .append('<span class="discount-rate">' + discountrate + '%</span>')
                                                .append('<span class="original-price">' + p.amt + '</span>');

                                    }
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





                //모달창 스크립트
                let continueShoppingBtn = document.getElementById('shopping-btn');
                let goToCartBtn = document.getElementById('cart-btn');
                let cartModal = document.getElementById('cart-modal');

                continueShoppingBtn.addEventListener('click', function() {
                    cartModal.style.display = 'none';
                    location.href='/product/list/${category}';
                    <%--            ${productDetail.PROD_ID}--%>
                });

                goToCartBtn.addEventListener('click', function() {
                    cartModal.style.display = 'none';
                    location.href='/cart';
                });
            });//document.ready



        </script>
    </div>


</section>


<jsp:include page="../footer.jsp"/>
<!--모달창 -->
<div class="modal" id="cart-modal">
    <div class="modal-content">
        <h2>장바구니에 상품이 담겼습니다</h2>
        <div class="modal-buttons">
            <button id="shopping-btn">쇼핑 계속하기</button>
            <button id="cart-btn">장바구니로 이동</button>
        </div>
    </div>
</div>
<script>
    //모달창 불러오기
    function cartsc(){
        document.getElementById('cart-modal').style.display = 'block';
    }
    function insertA (productNumber) {
        console.log(productNumber)
        console.log("insert함수실행")
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            contentType: "application/json; charset=utf-8",
            url: "/cart/"+ productNumber,
            type: "POST",
            success: function (data) {
                cartsc()
            },
            error: function () {
                alert('장바구니를 이용하시려면 로그인 해주세요');

            }
        });<!--ajax -->
    }
</script>
</body>
</html>