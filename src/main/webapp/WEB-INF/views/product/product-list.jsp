<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <link href="/css/product/list.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/d66ae73db8.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/hwa/modal.css"/><!--모달창-->
    <style>


        /* 기존의 CSS (생략) */

        #side-menu {
            position: sticky;
            top: 20px; /* 원하는 위치에 고정 */
        }

        /* side-menu 스타일 */
        #side-menu {
            width: 180px; /* 사이드 메뉴의 넓이 */
            padding: 20px; /* 내부 패딩 */
            /*margin-right: 20px; !* 우측 마진 *!*/
            float: left; /* 왼쪽 정렬 */
        }

        /* side-menu 아이템 스타일 */
        #side-menu ul {
            list-style-type: none; /* 리스트 스타일 제거 */
            padding: 0; /* 패딩 제거 */
        }

        /* side-menu 아이템 내부 링크 스타일 */
        #side-menu ul li a {
            text-decoration: none; /* 링크 밑줄 제거 */
            color: #777; /* 텍스트 색상 검정 */
            display: block; /* 링크를 블럭 요소로 변경 */
            padding: 10px 0; /* 패딩 적용 */
            font-size: 14px;
        }

        /* side-menu 아이템 내부 링크 호버 스타일 */
        #side-menu ul li a:hover {
            color: #2a343e; /* 텍스트 색상 변경 */
        }

        /* 사이드 메뉴와 본문 콘텐츠 영역 분리 */
        .main-content {
            margin-left: 20px; /* 사이드 메뉴의 넓이 및 마진 고려 */
        }
    </style>

</head>
<body>
<jsp:include page="../header.jsp"/>


<section class="contents">
    <div class="product-wrapper">

        <div id="side-menu">
            <c:choose>
                <c:when test="${productList[0].cate_nm== '스킨케어'}">
                    <ul>
                        <li><a href="#">전체</a></li>
                        <li><a href="#">에센스/세럼/앰플</a></li>
                        <li><a href="#">로션/크림</a></li>
                        <li><a href="#">클렌징</a></li>
                        <li><a href="#">팩/마스크</a></li>
                    </ul>
                </c:when>
                <c:when test="${productList[0].cate_nm== '메이크업'}">
                    <ul>
                        <li><a href="#">전체</a></li>
                        <li><a href="#">페이스메이크업</a></li>
                        <li><a href="#">아이메이크업</a></li>
                        <li><a href="#">립메이크업</a></li>
                        <li><a href="#">네일</a></li>
                    </ul>
                </c:when>
                <c:when test="${productList[0].cate_nm== '남성'}">
                    <ul>
                        <li><a href="#">전체</a></li>
                        <li><a href="#">스킨케어</a></li>
                        <li><a href="#">클렌징</a></li>
                        <li><a href="#">선케어</a></li>
                        <li><a href="#">헤어스타일링</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul>
                        <li><a href="#">전체</a></li>
                        <li><a href="#">핸드/풋케어</a></li>
                        <li><a href="#">바디로션/바디워시</a></li>
                        <li><a href="#">헤어에센스/미스트</a></li>
                        <li><a href="#">샴푸/트리트먼트</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>

        </div>





        <div class="main-content">
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
                                <button type="button" id="highest_price" class="sort-btn" data-sort="highprice">높은 가격순
                                </button>
                            </li>
                            <li>
                                <button type="button" id="lowest_price" class="sort-btn" data-sort="lowprice">낮은 가격순
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>

                <div id="productlist" class="product-list">
                    <c:forEach var="p" items="${productList}">
                        <div class="product">
                            <a href="/product/productDetail/${p.prod_id}">
                                <c:choose>
                                    <c:when test="${p.prod_nm == '올리브 에멜전'}">
                                        <div class="product-img">
                                            <img src="/img/sun/olive.gif" alt="메인 상품 이미지">
                                        </div>
                                    </c:when>
                                    <c:when test="${p.prod_nm == '뉴 포맨 올인원'}">
                                        <div class="product-img">
                                            <img src="/img/sun/product-image/men/new_forest_men.jpg" alt="메인 상품 이미지">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="product-img">
                                            <img src="${p.rep_img}" alt="메인 상품 이미지">
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="product-info">
                                    <span class="product-name">${p.prod_nm}</span>
                                    <p class="price">

                                        <c:choose>
                                            <c:when test="${p.dc_yn == 'N'}">
                                                <strong class="discount-price">
                                                    <fmt:formatNumber value="${p.amt}" pattern="###,###.##"/>
                                                </strong>
                                                <span class="original-price"></span>
                                                <span class="discount-rate"></span>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="dc" items="${Cate_Products_DC}">
                                                    <c:if test="${p.prod_id == dc.prod_id}">
                                                        <strong class="discount-price">
                                                            <fmt:formatNumber value="${dc.dc_price}"
                                                                              pattern="###,###.##"/>
                                                        </strong>
                                                        <span class="discount-rate">${dc.dc_rate}%</span>
                                                    </c:if>
                                                </c:forEach>
                                                <span class="original-price">
                                            <fmt:formatNumber value="${p.amt}" pattern="###,###.##"/>
                                        </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </a>
                            <div class="star-wrap">
                                <div class="starCnt">
                                    <i class="fas fa-star"></i>
                                    <span class="star-rating"></span>
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
                    function numberWithCommas(x) {
                        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }


                    $(document).ready(function () {
                        $(".sort-btn").on('click', function () {
                            $.ajax({
                                url: '/product/list/' + ${category} +'/ajax',
                                data: {sort: $(this).attr('id')},
                                success: function (data) {
                                    var productlist = $("#productlist").empty();

                                    data.forEach(function (p) {
                                        var productdiv = $('<div class="product"></div>');
                                        var productlink = $('<a>').attr('href', '/product/productDetail/' + p.prod_id);

                                        var productimgdiv = $('<div class="product-img"></div>').append($('<img>').attr({
                                            'src': p.rep_img,
                                            'alt': p.prod_nm
                                        }));
                                        var productinfodiv = $('<div class="product-info"></div>').append($('<span class="product-name"></span>').text(p.prod_nm));

                                        var priceelement = $('<p class="price"></p>');

                                        if (p.dc_yn === 'N') {
                                            priceelement.append('<strong class="discount-price">' + numberWithCommas(p.amt) + '</strong>')
                                                .append('<span class="original-price"></span>')
                                                .append('<span class="discount-rate"></span>');
                                        } else {
                                            var discountprice = p.dc_price;
                                            var discountrate = p.dc_rate;

                                            if (discountrate == null) {
                                                priceelement.append('<strong class="discount-price">' + numberWithCommas(p.amt) + '</strong>')
                                                    .append('<span class="discount-rate">' + '' + '</span>')
                                                    .append('<span class="original-price">' + '' + '</span>');
                                            } else {
                                                priceelement.append('<strong class="discount-price">' + numberWithCommas(discountprice) + '</strong>')
                                                    .append('<span class="discount-rate">' + discountrate + '%</span>')
                                                    .append('<span class="original-price">' + numberWithCommas(p.amt) + '</span>');
                                            }
                                        }
                                        productinfodiv.append(priceelement);
                                        productlink.append(productimgdiv).append(productinfodiv);
                                        productdiv.append(productlink);

                                        var starwrapdiv = $('<div class="star-wrap"></div>');
                                        var starcntdiv = $('<div class="starCnt"></div>')
                                            .append('<i class="fas fa-star"></i>')
                                            .append('<span class="star-rating">' + '' + ' ' + '' + '</span>');
                                        var iconsdiv = $('<div class="icons"></div>')
                                            .append('<span class="heart-icon"><i class="fa-regular fa-heart"></i></span>')
                                            .append('<span class="cart-icon"><i onclick="insertA(' + p.prod_id + ')" class="fa-solid fa-cart-shopping"></i></span>');

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

                        continueShoppingBtn.addEventListener('click', function () {
                            cartModal.style.display = 'none';
                            location.href = '/product/list/${category}';
                            <%--            ${productDetail.PROD_ID}--%>
                        });

                        goToCartBtn.addEventListener('click', function () {
                            cartModal.style.display = 'none';
                            location.href = '/cart';
                        });
                    });//document.ready
                </script>
            </div>
        </div>
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
    function cartsc() {
        document.getElementById('cart-modal').style.display = 'block';
    }

    function insertA(productNumber) {
        console.log(productNumber)
        console.log("insert함수실행")
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            contentType: "application/json; charset=utf-8",
            url: "/cart/" + productNumber,
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