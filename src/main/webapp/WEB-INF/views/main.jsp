<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>DobbyIsFree</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <script src="https://kit.fontawesome.com/d66ae73db8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/sun/main-product.css"/>
    <!-- SWIPER 외부 라이브러리 연결-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="./css/hoon/mainBanner.css"/>
    <link rel="stylesheet" href="./css/hoon/membership.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script><!-- 커스텀 창 -->


    <style>


        * {
            margin: 0;
            padding: 0;
        }


        #membership {
            display: block;
            margin: 0 auto;
            width: 60%;
            height: auto;
            padding: 100px 0 100px 0px;

        }

        .grid-container {
            min-height: 100%;
        }

        .cart_icon {
            position: absolute;
            bottom: 0;
            right: 0;
            /* Add any padding or margin you need for proper positioning */
            padding: 5px;
            background: #555555;
            width: 40px;
            height: 40px;
            opacity: 0.6;
        }

        .icon {
            max-width: 100%;
            max-height: 100%;
        }
        .swal2-container.swal2-top, .swal2-container.swal2-center, .swal2-container.swal2-bottom{
            font-family: "나눔바른고딕OTF", "돋움";
        }

        .swal2-html-container {
            font-size: 2em;
        }
        .swal2-styled.swal2-confirm {
            font-family: "나눔바른고딕OTF", "돋움";
        }
        .swal2-styled.swal2-cancel {
            font-family: "나눔바른고딕OTF", "돋움";
        }

    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="grid-container">

    <%--메인 배너 시작--%>

    <div class="banner-container">
        <div class="banner">
            <section class="home-visual">
                <div class="slideWrap">
                    <div class="swiper-container">
                        <ul class="swiper-wrapper">
                            <!--SET-->
                            <li class="swiper-slide" data-slide-index="1" style="width: 1920px;">
                                <div class="imgWrap">
                                    <img class="swpier-lazy" src="./img/main/main_1.jpg" alt="이미지 없음">
                                </div>
                                <div class="cntWrap">
                                    <div class="inner">
                                  <span class="tag-card">
                                        <span class="cardSt_1">24%</span>
                                        <span class="cardSt_2">베스트</span>
                                  </span>
                                        <div class="name">
                                            <span style="font-family:NanumSquareNeo-dEb">수분 잠금 확실히하고</span>
                                            <span style="font-family:NanumSquareNeo-dEb">깨끗하고 촉촉한 피부로</span>
                                        </div>
                                        <div class="option">
                                  <span class="banner-price">
                                      <em class="tCost">31,000</em>
                                      <em class="tUnit">23,500</em>
                                  </span>
                                        </div> <!-- 옵션-->
                                    </div> <!-- 이너 -->
                                </div> <!--센터렙-->
                            </li>
                            <!--SET-->
                            <li class="swiper-slide" data-slide-index="2" style="width: 1920px;">
                                <div class="imgWrap">
                                    <img class="swpier-lazy" src="./img/main/main_2.jpg" alt="이미지 없음">
                                </div>
                                <div class="cntWrap">
                                    <div class="inner">
                                  <span class="tag-card">
                                        <!-- <span class="cardSt_1">24%</span> -->
                                        <span class="cardSt_2">신규</span>
                                  </span>
                                        <div class="name">
                                            <span style="font-family:NanumSquareNeo-dEb">수분 잠금 확실히하고</span>
                                            <span style="font-family:NanumSquareNeo-dEb">깨끗하고 촉촉한 피부로</span>
                                        </div>
                                        <div class="option">
                                  <span class="banner-price">
                                      <em class="tCost">31,000</em>
                                      <em class="tUnit">23,500</em>
                                  </span>
                                        </div> <!-- 옵션-->
                                    </div> <!-- 이너 -->
                                </div> <!--센터렙-->
                            </li>
                            <!--SET-->
                            <li class="swiper-slide" data-slide-index="3" style="width: 1920px;">
                                <div class="imgWrap">
                                    <img class="swpier-lazy" src="./img/main/main_3.jpg" alt="이미지 없음">
                                </div>
                                <div class="cntWrap">
                                    <div class="inner">
                                    <span class="tag-card">
                                          <!-- <span class="cardSt_1">24%</span> -->
                                          <span class="cardSt_2">최대30%</span>
                                    </span>
                                        <div class="name">
                                            <span style="font-family:NanumSquareNeo-dEb">수분 잠금 확실히하고</span>
                                            <span style="font-family:NanumSquareNeo-dEb">깨끗하고 촉촉한 피부로</span>
                                        </div>
                                        <div class="option">
                                    <span class="banner-price">
                                        <em class="tCost">31,000</em>
                                        <em class="tUnit">23,500</em>
                                    </span>
                                        </div> <!-- 옵션-->
                                    </div> <!-- 이너 -->
                                </div> <!--센터렙-->
                            </li>
                            <!--SET-->
                            <li class="swiper-slide" data-slide-index="4" style="width: 1920px;">
                                <div class="imgWrap">
                                    <img class="swpier-lazy" src="./img/main/main_4.jpg" alt="이미지 없음">
                                </div>
                                <div class="cntWrap">
                                    <div class="inner">
                                    <span class="tag-card">
                                          <span class="cardSt_1">25%</span>
                                          <span class="cardSt_2">신제품</span>
                                    </span>
                                        <div class="name">
                                            <span style="font-family:NanumSquareNeo-dEb">수분 잠금 확실히하고</span>
                                            <span style="font-family:NanumSquareNeo-dEb">깨끗하고 촉촉한 피부로</span>
                                        </div>
                                        <div class="option">
                                    <span class="banner-price">
                                        <em class="tCost">31,000</em>
                                        <em class="tUnit">23,500</em>
                                    </span>
                                        </div> <!-- 옵션-->
                                    </div> <!-- 이너 -->
                                </div> <!--센터렙-->
                            </li>
                            <!--SET-->
                        </ul>

                    </div>
                    <div class="slideControl">
                        <div class="swiper-pagination"></div>
                        <div class="nav_prev">
                            <div class="inner">

                                <button type="button" class="prev" tabindex="0" role="button"
                                        aria-label="Previous slide">

                                    이전
                                </button>
                            </div>
                        </div>
                        <div class="nav_next">
                            <div class="inner">
                                <!-- <div class="swiper-pagination"> -->

                                <!-- </div> -->
                                <button type="button" class="next" tabindex="0" role="button" aria-label="Next slide">

                                    다음
                                </button>
                            </div>
                        </div>

                    </div>
                </div>

            </section>


        </div>
        <script>

            const swiper = new Swiper('.swiper-container', {

                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },

                navigation: {
                    prevEl: '.nav_prev',
                    nextEl: '.nav_next',
                },

                speed: 800,

                loop: true,

                autoplay: {
                    delay: 3000,
                    pauseOnMouseEnter: false,
                    disableOnInteraction: false,

                },

                slidesPerView: 1,


            })

        </script>

        <%-- 메인 배너 끝 --%>

        <%-- 상품 시작--%>
        <div class="title">
            <h3 class="line">한눈에 보는 추천제품</h3>
        </div>

        <!-- 상품 리스트 -->
        <div class="product-list">
            <c:forEach var="p" items="${ProductsMain}">
                <div class="product">
                    <a href="/product/${p.prod_id}">
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

                    <div class="tag-wrap"></div>
                    <div class="star-wrap">
                        <i class="fas fa-star"></i>
                        <span class="star-rating">${p.avg_ascr} (${p.revw_ncnt})</span>
                        <span class="heart-icon">
                                <i class="far fa-heart"></i>
                                <i onclick="insertA(${p.prod_id})" class="fa-solid fa-cart-shopping"></i>
                            </span>

                            <%--                        </div>--%>
                    </div>
                </div>
            </c:forEach>
        </div>
        <script>
            function cartsc(){
                Swal.fire({
                    icon : 'success',
                    title: '🛒',
                    text: "장바구니에 담겼습니다.",
                    // icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: 'rgba(18, 182, 96)',
                    cancelButtonColor: 'rgba(212, 212, 212, 1)',
                    confirmButtonText: '장바구니 바로가기',
                    cancelButtonText: '쇼핑 계속하기'
                }).then((result) => {
                    if (result.value) {
                        location.href='/cart'
                    }
                })
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
                        // alert("장바구니에 담겼어용 😉")
                        // if (data == 1) {
                        // location.href='/cart'
                        // }
                    },
                    error: function () {
                        Swal.fire({
                            // icon: 'error',
                            title: '장바구니에 담으려면 로그인 해주세용! 😉',
                            // text: '😉',
                            confirmButtonColor: 'rgba(18, 182, 96)',
                            footer: '<a href="/login">로그인 하러 가기</a>'
                        })

                    }
                });<!--ajax -->
            }

        </script>

        <%-- 멤버십 시작 --%>
        <section class="mainMemberShipInfo">
            <h2 class="subTitle">도비이즈프리 멤버십 혜택 안내</h2>
            <div class="contWrap">
                <p class="subTxt">도비이즈프리 멤버십 회원이 되시면 도비이즈프리에서 제공하는 다양한 혜택을 받으실 수 있습니다.</p>
                <ul class="list">
                    <li>
                        <span class="mb-icon"><img src="./img/main/mb_1.png" alt="멤버십데이"></span>
                        <strong class="tit">멤버십 혜택</strong>
                        <span class="txt">등급별 적립혜택</span>
                    </li>

                    <li>
                        <span class="mb-icon"><img src="./img/main/mb_2.png" alt="구매 적립"></span>
                        <strong class="tit">구매 적립</strong>
                        <span class="txt">구매 금액 1% 적립</span>
                    </li>
                    <li>
                        <span class="mb-icon"><img src="./img/main/mb_3.png" alt="생일 혜택"></span>
                        <strong class="tit">생일 혜택</strong>
                        <span class="txt">생일 쿠폰 지급</span>
                    </li>

                </ul>
                <!-- <a href="/kr/ko/GreenteaClubMembership.do" class="pdtMore">혜택 더보기</a> -->
            </div>
        </section>


        <%-- 멤버십 끝 --%>
    </div>


    <jsp:include page="footer.jsp"/>

</body>
</html>

