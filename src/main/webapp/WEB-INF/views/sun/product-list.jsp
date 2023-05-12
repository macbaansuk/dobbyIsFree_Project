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
                            <img src="${p.rep_img}" alt="메인 상품 이미지">
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




            <%--$(document).ready(function () {--%>
            <%--    $('.sort-btn').click(function () {--%>
            <%--        var sort = $(this).data('sort');--%>
            <%--        var category = $("#category").val(); // 카테고리 값을 가져옵니다.--%>

            <%--        $.ajax({--%>
            <%--            type : "GET",--%>
            <%--            url : "/products/list"+ "${category}" +"/ajax", // Controller의 RequestMapping 경로입니다.--%>
            <%--            data : {--%>
            <%--                "sort" : sort,--%>
            <%--                "category" : category--%>
            <%--            },--%>
            <%--            success : function(data) {--%>
            <%--                // 기존의 상품 목록을 지웁니다.--%>
            <%--                $("#productList").empty();--%>

            <%--                // 새로운 상품 목록을 렌더링합니다.--%>
            <%--                $.each(data, function(index, product) {--%>
            <%--                    var productHtml =--%>
            <%--                        '<div class="product">' +--%>
            <%--                        '<a href="/product/productDetail/' + product.PROD_ID + '">' +--%>
            <%--                        '<div class="product-img">' +--%>
            <%--                        '<img src="' + product.REP_IMG + '" alt="메인 상품 이미지">' +--%>
            <%--                        '</div>' +--%>
            <%--                        '<div class="product-info">' +--%>
            <%--                        '<span class="product-name">' + product.PROD_NM + '</span>' +--%>
            <%--                        '<p class="price">' +--%>
            <%--                        // 할인 여부에 따라 가격을 다르게 표시합니다.--%>
            <%--                        (product.DC_YN === 'N' ?--%>
            <%--                                '<strong class="discount-price">' + product.AMT + '</strong>' :--%>
            <%--                                '<strong class="discount-price">' + product.DC_PRICE + '</strong>' +--%>
            <%--                                '<span class="discount-rate">' + product.DC_RATE + '%</span>' +--%>
            <%--                                '<span class="original-price">' + product.AMT + '</span>'--%>
            <%--                        ) +--%>
            <%--                        '</p>' +--%>
            <%--                        '</div>' +--%>
            <%--                        '</a>' +--%>
            <%--                        '<div class="star-wrap">' +--%>
            <%--                        '<div class="starCnt">' +--%>
            <%--                        '<i class="fas fa-star"></i>' +--%>
            <%--                        '<span class="star-rating">' + product.AVG_ASCR + ' (' + product.REVW_NCNT + ')</span>' +--%>
            <%--                        '</div>' +--%>
            <%--                        '<div class="icons">' +--%>
            <%--                        '<span class="heart-icon">' +--%>
            <%--                        '<i class="fa-regular fa-heart"></i>' +--%>
            <%--                        '</span>' +--%>
            <%--                        '<span class="cart-icon">' +--%>
            <%--                        '<i onclick="insertA(' + product.PROD_ID + ')" class="fa-solid fa-cart-shopping"></i>' +--%>
            <%--                        '</span>' +--%>
            <%--                        '</div>' +--%>
            <%--                        '</div>' +--%>
            <%--                        '</div>';--%>

            <%--                    // 상품 목록에 새로운 상품을 추가합니다.--%>
            <%--                    $("#productList").append(productHtml);--%>
            <%--                });--%>

            <%--            },--%>
            <%--            error : function(e) {--%>
            <%--                // 에러가 발생했을 때의 처리를 여기에 작성합니다.--%>
            <%--                console.log("ERROR : ", e);--%>
            <%--            }--%>
            <%--        });--%>
            <%--    });--%>
            <%--});--%>

            //             success: function (data) {
            //                 // 기존의 제품 목록을 비웁니다.
            //                 var productList = $("#productList").empty();
            //                 data.forEach(function (product) {
            //                     var productDiv = $('<div class="product"></div>');
            //                     var productLink = $('<a>').attr('href', '/product/productDetail/' + product.PROD_ID);
            //                     var productImgDiv = $('<div class="product-img"></div>').append($('<img alt="제품이미지">').attr({'src': product.REP_IMG, 'alt': product.PROD_NM}));
            //                     var productInfoDiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(product.PROD_NM));
            //                     var priceElement = $('<p class="price"></p>');
            //                     if (product.DC_YN === 'N') {
            //                         priceElement.html('<strong class="discount-price">' + product.AMT + '</strong><span class="original-price"></span><span class="discount-rate"></span>');
            //                     } else {
            //                         priceElement.html('<strong class="discount-price">' + product.DC_PRICE + '</strong><span class="discount-rate">' + product.DC_RATE + '%</span><span class="original-price">' + product.AMT + '</span>');
            //                     }
            //                     productInfoDiv.append(priceElement);
            //                     productLink.append(productImgDiv).append(productInfoDiv);
            //                     productDiv.append(productLink);
            //                     var starWrapDiv = $('<div class="star-wrap"></div>');
            //                     var starCntDiv = $('<div class="starCnt"><i class="fas fa-star"></i><span class="star-rating">' + product.AVG_ASCR + ' (' + product.REVW_NCNT + ')</span></div>');
            //                     var iconsDiv = $('<div class="icons"><span class="heart-icon"><i class="fa-regular fa-heart"></i></span><span class="cart-icon"><i onclick="insertA(' + product.PROD_ID + ')" class="fa-solid fa-cart-shopping"></i></span></div>');
            //                     starWrapDiv.append(starCntDiv).append(iconsDiv);
            //                     productDiv.append(starWrapDiv);
            //                     productList.append(productDiv);
            //                 });
            //             },
            //             error : function(e) {
            //                 console.log("ERROR : ", e);
            //             }
            //         });
            //     });
            // });
            //
            //







            <%--                $(document).ready(function() {--%>
            <%--    $('.sort-btn').click(function() {--%>
            <%--        var category = ${category}; // 현재 카테고리 값--%>
            <%--        var sort = $(this).data('sort'); // 버튼의 data-sort 값--%>

            <%--        $.ajax({--%>
            <%--            url: "/product/list/" + category + "/ajax",--%>
            <%--            type: "GET",--%>
            <%--            data: { "sort": sort },--%>
            <%--success: function (data) {--%>
            <%--    // 기존의 제품 목록을 비웁니다.--%>
            <%--    var productList = $("#productList").empty();--%>
            <%--                data.forEach(function (product) {--%>
            <%--                    var productDiv = $('<div class="product"></div>');--%>
            <%--                    var productLink = $('<a>').attr('href', '/product/productDetail/' + product.PROD_ID);--%>
            <%--                    var productImgDiv = $('<div class="product-img"></div>').append($('<img alt="제품이미지">').attr({'src': product.REP_IMG, 'alt': product.PROD_NM}));--%>
            <%--                    var productInfoDiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(product.PROD_NM));--%>
            <%--                    var priceElement = $('<p class="price"></p>');--%>
            <%--                    if (product.DC_YN === 'N') {--%>
            <%--                        priceElement.html('<strong class="discount-price">' + product.AMT + '</strong><span class="original-price"></span><span class="discount-rate"></span>');--%>
            <%--                    } else {--%>
            <%--                        priceElement.html('<strong class="discount-price">' + product.DC_PRICE + '</strong><span class="discount-rate">' + product.DC_RATE + '%</span><span class="original-price">' + product.AMT + '</span>');--%>
            <%--                    }--%>
            <%--                    productInfoDiv.append(priceElement);--%>
            <%--                    productLink.append(productImgDiv).append(productInfoDiv);--%>
            <%--                    productDiv.append(productLink);--%>
            <%--                    var starWrapDiv = $('<div class="star-wrap"></div>');--%>
            <%--                    var starCntDiv = $('<div class="starCnt"><i class="fas fa-star"></i><span class="star-rating">' + product.AVG_ASCR + ' (' + product.REVW_NCNT + ')</span></div>');--%>
            <%--                    var iconsDiv = $('<div class="icons"><span class="heart-icon"><i class="fa-regular fa-heart"></i></span><span class="cart-icon"><i onclick="insertA(' + product.PROD_ID + ')" class="fa-solid fa-cart-shopping"></i></span></div>');--%>
            <%--                    starWrapDiv.append(starCntDiv).append(iconsDiv);--%>
            <%--                    productDiv.append(starWrapDiv);--%>
            <%--                    productList.append(productDiv);--%>
            <%--                });--%>
            <%--            },--%>
            <%--            dataType: 'json' // 응답 데이터의 형식을 JSON으로 설정합니다.--%>
            <%--        });--%>
            <%--    });--%>
            <%--});--%>

            // $(document).ready(function () {
            //     $(".sort-btn").click(function () {
            //         var sort = $(this).data("sort");
            //         // var category = /* 카테고리 값 가져오기 */;
            //
            //         var url = window.location.pathname;
            //         var category = url.split("/")[3];
            //         $.ajax({
            //             url: "/product/list/" + category + "/ajax",
            //             type: "GET",
            //             data: {sort: sort},
            //             success: function (data) {
            //                 var productList = $("#productList");
            //                 productList.empty();
            //                 $.each(data, function (index, item) {
            //                     var product = $("<div class='product'></div>");
            //                     var productLink = $("<a href='/product/productDetail/" + item.PROD_ID + "'></a>");
            //                     var productImg = $("<div class='product-img'><img src='" + item.REP_IMG + "' alt='메인 상품 이미지'></div>");
            //                     var productInfo = $("<div class='product-info'></div>");
            //                     var productName = $("<span class='product-name'>" + item.PROD_NM + "</span>");
            //                     var price = $("<p class='price'></p>");
            //                     if (item.DC_YN === "N") {
            //                         price.append("<strong class='discount-price'>" + item.AMT + "</strong>");
            //                         price.append("<span class='original-price'></span>");
            //                         price.append("<span class='discount-rate'></span>");
            //                     } else {
            //                         price.append("<strong class='discount-price'>" + item.DC_PRICE + "</strong>");
            //                         price.append("<span class='discount-rate'>" + item.DC_RATE + "%</span>");
            //                         price.append("<span class='original-price'>" + item.AMT + "</span>");
            //                     }
            //                     productInfo.append(productName);
            //                     productInfo.append(price);
            //                     productLink.append(productImg);
            //                     productLink.append(productInfo);
            //                     product.append(productLink);
            //                     productList.append(product);
            //                 });
            //             }
            //         });
            //     });
            // });
            <%--$(document).ready(function () {--%>
            <%--    // 각 정렬 버튼에 클릭 이벤트를 설정합니다.--%>
            <%--    $(".sort-btn").on('click', function () {--%>
            <%--        // AJAX 요청을 보내고 응답을 처리합니다.--%>
            <%--        $.ajax({--%>
            <%--            url: '/product/list/' + "${category}" + '/ajax', // 요청 URL을 설정합니다.--%>
            <%--            data: {sort: $(this).attr('id')}, // 요청에 sort 데이터를 포함합니다.--%>
            // success: function (data) {
            //     // 기존의 제품 목록을 비웁니다.
            //     var productList = $("#productList").empty();
            //                 data.forEach(function (product) {
            //                     var productDiv = $('<div class="product"></div>');
            //                     var productLink = $('<a>').attr('href', '/product/productDetail/' + product.PROD_ID);
            //                     var productImgDiv = $('<div class="product-img"></div>').append($('<img alt="제품이미지">').attr({'src': product.REP_IMG, 'alt': product.PROD_NM}));
            //                     var productInfoDiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(product.PROD_NM));
            //                     var priceElement = $('<p class="price"></p>');
            //                     if (product.DC_YN === 'N') {
            //                         priceElement.html('<strong class="discount-price">' + product.AMT + '</strong><span class="original-price"></span><span class="discount-rate"></span>');
            //                     } else {
            //                         priceElement.html('<strong class="discount-price">' + product.DC_PRICE + '</strong><span class="discount-rate">' + product.DC_RATE + '%</span><span class="original-price">' + product.AMT + '</span>');
            //                     }
            //                     productInfoDiv.append(priceElement);
            //                     productLink.append(productImgDiv).append(productInfoDiv);
            //                     productDiv.append(productLink);
            //                     var starWrapDiv = $('<div class="star-wrap"></div>');
            //                     var starCntDiv = $('<div class="starCnt"><i class="fas fa-star"></i><span class="star-rating">' + product.AVG_ASCR + ' (' + product.REVW_NCNT + ')</span></div>');
            //                     var iconsDiv = $('<div class="icons"><span class="heart-icon"><i class="fa-regular fa-heart"></i></span><span class="cart-icon"><i onclick="insertA(' + product.PROD_ID + ')" class="fa-solid fa-cart-shopping"></i></span></div>');
            //                     starWrapDiv.append(starCntDiv).append(iconsDiv);
            //                     productDiv.append(starWrapDiv);
            //                     productList.append(productDiv);
            //                 });
            //             },
            //             dataType: 'json' // 응답 데이터의 형식을 JSON으로 설정합니다.
            //         });
            //     });
            // });

            <%--            //성공한 ajax1--%>
            <%--$(document).ready(function () {--%>
            <%--    // 각 정렬 버튼에 클릭 이벤트를 설정합니다.--%>
            <%--    $(".sort-btn").on('click', function () {--%>
            <%--        // let sort = $(this).data('sort');--%>
            <%--        // AJAX 요청을 보내고 응답을 처리합니다.--%>
            <%--        $.ajax({--%>
            <%--            url: '/product/list/' + "${category}" + '/ajax', // 요청 URL을 설정합니다.--%>
            <%--            &lt;%&ndash;url: '/product/list/' + "${CATE_CD}" + '/ajax', // 요청 URL을 설정합니다.&ndash;%&gt;--%>

            <%--            data: {sort: $(this).attr('id')}, // 요청에 sort 데이터를 포함합니다.--%>
            <%--            // data: {sort: sort},--%>
            <%--            // 성공한 ajax1--%>
            <%--            success: function (data) {--%>
            <%--                var productList = $("#productList").empty();--%>

            <%--                data.forEach(function (product) {--%>
            <%--                    var productDiv = $('<div class="product"></div>');--%>
            <%--                    var productLink = $('<a>').attr('href', '/product/productDetail/' + product.prod_id);--%>

            <%--                    var productImgDiv = $('<div class="product-img"></div>').append($('<img>').attr({'src': product.rep_img, 'alt': product.prod_nm}));--%>
            <%--                    var productInfoDiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(product.prod_nm));--%>

            <%--                    // 할인 가격 정보를 표시합니다.--%>
            <%--                    var priceElement = $('<p class="price"></p>');--%>

            <%--                    if (product.dc_yn === 'N') {--%>
            <%--                        priceElement.append('<strong class="discount-price">' + product.amt + '</strong>')--%>
            <%--                            .append('<span class="original-price"></span>')--%>
            <%--                            .append('<span class="discount-rate"></span>');--%>
            <%--                    } else {--%>
            <%--                        var discountPrice = product.dc_price;--%>
            <%--                        var discountRate = product.dc_rate;--%>

            <%--                        priceElement.append('<strong class="discount-price">' + discountPrice + '</strong>')--%>
            <%--                            .append('<span class="discount-rate">' + discountRate + '%</span>')--%>
            <%--                            .append('<span class="original-price">' + product.amt + '</span>');--%>
            <%--                    }--%>

            <%--                    productInfoDiv.append(priceElement);--%>
            <%--                    productLink.append(productImgDiv).append(productInfoDiv);--%>
            <%--                    productDiv.append(productLink);--%>

            <%--                    var starWrapDiv = $('<div class="star-wrap"></div>');--%>
            <%--                    var starCntDiv = $('<div class="starCnt"></div>')--%>
            <%--                        .append('<i class="fas fa-star"></i>')--%>
            <%--                        .append('<span class="star-rating">' + product.avg_ascr + ' (' + product.revw_ncnt + ')</span>');--%>
            <%--                    var iconsDiv = $('<div class="icons"></div>')--%>
            <%--                        .append('<span class="heart-icon"><i class="fa-regular fa-heart"></i></span>')--%>
            <%--                        .append('<span class="cart-icon"><i onclick="insertA(' + product.prod_id + ')" class="fa-solid fa-cart-shopping"></i></span>');--%>

            <%--                    starWrapDiv.append(starCntDiv).append(iconsDiv);--%>
            <%--                    productDiv.append(starWrapDiv);--%>
            <%--                    productList.append(productDiv);--%>
            <%--                });--%>
            <%--            },--%>
            <%--            dataType: 'json'--%>


            <%--            // 성공한 ajax2--%>
            //             success: function (data) {
            //                 var productList = $("#productList").empty();
            //
            //                 data.forEach(function (product) {
            //                     var productDiv = $('<div class="product"></div>');
            //                     var productLink = $('<a>').attr('href', '/product/productDetail/' + product.PROD_ID);
            //                     var productImgDiv = $('<div class="product-img"></div>').append($('<img>').attr({'src': product.REP_IMG, 'alt': product.PROD_NM}));
            //
            //                     var productInfoDiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(product.PROD_NM));
            //                     var priceElement = $('<p class="price"></p>');
            //
            //                     if (product.DC_YN === 'N') {
            //                         priceElement.html('<strong class="discount-price">' + product.AMT + '</strong><span class="original-price"></span><span class="discount-rate"></span>');
            //                     } else {
            //                         priceElement.html('<strong class="discount-price">' + product.DC_PRICE + '</strong><span class="discount-rate">' + product.DC_RATE + '%</span><span class="original-price">' + product.AMT + '</span>');
            //                     }
            //
            //                     productInfoDiv.append(priceElement);
            //                     productLink.append(productImgDiv).append(productInfoDiv);
            //                     productDiv.append(productLink);
            //
            //                     var starWrapDiv = $('<div class="star-wrap"></div>');
            //                     var starCntDiv = $('<div class="starCnt"><i class="fas fa-star"></i><span class="star-rating">' + product.AVG_ASCR + ' (' + product.REVW_NCNT + ')</span></div>');
            //                     var iconsDiv = $('<div class="icons"><span class="heart-icon"><i class="fa-regular fa-heart"></i></span><span class="cart-icon"><i onclick="insertA(' + product.PROD_ID + ')" class="fa-solid fa-cart-shopping"></i></span></div>');
            //
            //                     starWrapDiv.append(starCntDiv).append(iconsDiv);
            //                     productDiv.append(starWrapDiv);
            //                     productList.append(productDiv);
            //                 });
            //             },
            //             dataType: 'json'

            <%--            //성공한 ajax2 주석ver--%>
            <%--            success: function (data) {--%>
            <%--                // 기존의 제품 목록을 비웁니다.--%>
            <%--                var productList = $("#productList").empty();--%>

            <%--                // // AJAX 응답으로 받은 데이터를 사용하여 제품 목록을 생성합니다.--%>
            <%--                // data.forEach(function (product) {--%>
            <%--                //     // 제품 목록에 들어갈 요소들을 생성합니다.--%>
            <%--                //     var productDiv = $('<div class="product"></div>');--%>
            <%--                //--%>
            <%--                //     // 제품 링크를 설정합니다.--%>
            <%--                //     var productLink = $('<a>').attr('href', '/product/productDetail/' + product.PROD_ID);--%>
            <%--                //--%>
            <%--                //     // 제품 이미지를 설정합니다.--%>
            <%--                //     var productImgDiv = $('<div class="product-img"></div>').append($('<img alt="제품이미지">').attr({'src': product.REP_IMG, 'alt': product.PROD_NM}));--%>
            <%--                //--%>
            <%--                //     // 제품 정보를 설정합니다.--%>
            <%--                //     var productInfoDiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(product.PROD_NM));--%>
            <%--                //--%>
            <%--                //     // 가격 정보를 추가하기 위한 p 태그를 생성합니다.--%>
            <%--                //     var priceElement = $('<p class="price"></p>');--%>
            <%--                //--%>
            <%--                //     // 할인 여부에 따라 가격 정보를 설정합니다.--%>
            <%--                //     if (product.DC_YN === 'N') {--%>
            <%--                //         priceElement.html('<strong class="discount-price">' + product.AMT + '</strong><span class="original-price"></span><span class="discount-rate"></span>');--%>
            <%--                //     } else {--%>
            <%--                //         priceElement.html('<strong class="discount-price">' + product.DC_PRICE + '</strong><span class="discount-rate">' + product.DC_RATE + '%</span><span class="original-price">' + product.AMT + '</span>');--%>
            <%--                //     }--%>
            <%--                //--%>
            <%--                //     // 가격 정보를 제품 정보에 추가합니다.--%>
            <%--                //     productInfoDiv.append(priceElement);--%>
            <%--                //--%>
            <%--                //     // 제품 이미지와 제품 정보를 제품 링크에 추가합니다.--%>
            <%--                //     productLink.append(productImgDiv).append(productInfoDiv);--%>
            <%--                //--%>
            <%--                //     // 제품 링크를 제품 Div에 추가합니다.--%>
            <%--                //     productDiv.append(productLink);--%>
            <%--                //--%>
            <%--                //     // 별점 및 아이콘 영역을 설정합니다.--%>
            <%--                //     var starWrapDiv = $('<div class="star-wrap"></div>');--%>
            <%--                //--%>
            <%--                //     // 별점을 설정합니다.--%>
            <%--                //     var starCntDiv = $('<div class="starCnt"><i class="fas fa-star"></i><span class="star-rating">' + product.AVG_ASCR + ' (' + product.REVW_NCNT + ')</span></div>');--%>
            <%--                //--%>
            <%--                //     // 아이콘을 설정합니다.--%>
            <%--                //     var iconsDiv = $('<div class="icons"><span class="heart-icon"><i class="fa-regular fa-heart"></i></span><span class="cart-icon"><i onclick="insertA(' + product.PROD_ID + ')" class="fa-solid fa-cart-shopping"></i></span></div>');--%>
            <%--                //--%>
            <%--                //     // 별점 및 아이콘 영역에 별점과 아이콘을 추가합니다.--%>
            <%--                //     starWrapDiv.append(starCntDiv).append(iconsDiv);--%>
            <%--                //--%>
            <%--                //     // 제품 Div에 별점 및 아이콘 영역을 추가합니다.--%>
            <%--                //     productDiv.append(starWrapDiv);--%>
            <%--                //--%>
            <%--                //     // 갱신된 제품 목록에 새로운 제품을 추가합니다.--%>
            <%--                //     productList.append(productDiv);--%>
            <%--                // });--%>

            <%--                data.forEach(function (product) {--%>
            <%--                    var productDiv = $('<div class="product"></div>');--%>
            <%--                    var productLink = $('<a>').attr('href', '/product/productDetail/' + product.PROD_ID);--%>
            <%--                    var productImgDiv = $('<div class="product-img"></div>').append($('<img alt="제품이미지">').attr({'src': product.REP_IMG, 'alt': product.PROD_NM}));--%>
            <%--                    var productInfoDiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(product.PROD_NM));--%>

            <%--                    var priceElement = $('<p class="price"></p>');--%>

            <%--                    if (product.DC_YN === 'N') {--%>
            <%--                        priceElement.html('<strong class="discount-price">' + product.AMT + '</strong><span class="original-price"></span><span class="discount-rate"></span>');--%>
            <%--                    } else {--%>
            <%--                        priceElement.html('<strong class="discount-price">' + product.DC_PRICE + '</strong><span class="discount-rate">' + product.DC_RATE + '%</span><span class="original-price">' + product.AMT + '</span>');--%>
            <%--                    }--%>

            <%--                    productInfoDiv.append(priceElement);--%>
            <%--                    productLink.append(productImgDiv).append(productInfoDiv);--%>
            <%--                    productDiv.append(productLink);--%>

            <%--                    var starWrapDiv = $('<div class="star-wrap"></div>');--%>
            <%--                    var starCntDiv = $('<div class="starCnt"><i class="fas fa-star"></i><span class="star-rating">' + product.AVG_ASCR + ' (' + product.REVW_NCNT + ')</span></div>');--%>
            <%--                    var iconsDiv = $('<div class="icons"><span class="heart-icon"><i class="fa-regular fa-heart"></i></span><span class="cart-icon"><i onclick="insertA(' + product.PROD_ID + ')" class="fa-solid fa-cart-shopping"></i></span></div>');--%>

            <%--                    starWrapDiv.append(starCntDiv).append(iconsDiv);--%>
            <%--                    productDiv.append(starWrapDiv);--%>
            <%--                    productList.append(productDiv);--%>
            <%--                });--%>
            <%--            },--%>
            <%--            dataType: 'json' // 응답 데이터의 형식을 JSON으로 설정합니다.--%>
            //         });
            //
            //
            //
            //     });
            // });

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