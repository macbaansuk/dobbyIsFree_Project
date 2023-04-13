<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha34-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <link href="/css/sun/detail.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/d66ae73db8.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
<jsp:include page="../header.jsp"/>

<section class="contents">
    <div class="product-topview">
        <img src="${productDetail.rep_img}" alt="상품 상세이미지">


        <div class="product-detail">
            <h2>${productDetail.prod_nm}</h2>
            <p> ${productDetail.prod_desc}</p>

            <div class="star-wrap">
                <i class="fas fa-star"></i>
                <span class="star-rating">${productDetail.avg_ascr} (${productDetail.revw_ncnt})</span>
            </div>


            <div class="product-hashtag">
                <a>해시태그</a>
                <a>해시태그</a>
            </div>

            <div class="product-guide">
                <dl>
                    <dt>판매가</dt>
                    <c:choose>
                        <c:when test="${productDetail.dc_yn == 'N'}">
                            <strong class="discount-price">${productDetail.amt}</strong>
                            <span class="original-price"></span>
                            <span class="discount-rate"></span>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="dc" items="${Products_DC}">
                                <c:if test="${productDetail.prod_id == dc.prod_id}">
                                    <strong class="discount-price">${dc.dc_price}</strong>
                                    <span class="discount-rate">${dc.dc_rate}%</span>
                                </c:if>
                            </c:forEach>
                            <span class="original-price">${productDetail.amt}</span>
                        </c:otherwise>
                    </c:choose>
                </dl>

                <dl>
                <dt>배송비</dt>
                <dd>2,500원 (20,000원이상 구매시 무료배송)</dd>
                </dl>

                <dl>
                    <dt>포인트</dt>
                    <dd>결제 금액의 1% 적립</dd>
                </dl>
            </div>


            <div class="product-purchase">
                <div class="purchase-num">
                    <dl>
                        <dt>
                            수량
                        </dt>
                        <dd>
                            <div class="quantity">
                                <button id="minus">-</button>
                                <input id="quantity" type="text" value="1" readonly>
                                <button id="plus">+</button>
                            </div>
                        </dd>

                    </dl>
                </div>


                <div class="purchase-sum">
                    <p>합계</p>
                    <p>
                            <span>
                                원
                            </span>
                    </p>
                </div>



                <script>
                    $(document).ready(function () {
                        const price = parseInt($('.discount-price').text());
                        let quantity = parseInt($('#quantity').val());
                        let total = price * quantity;
                        updateTotal(total);

                        // 총 금액 업데이트
                        function updateTotal(newTotal) {
                            $('div.product-purchase p:last-child span').text(newTotal.toLocaleString() + '원');
                        }

                        // 수량 증가
                        $('#plus').click(function () {
                            if (quantity < 10) { // 최대 수량 10개로 제한
                                quantity += 1;
                                $('#quantity').val(quantity);
                                total = price * quantity;
                                updateTotal(total);
                            } else {
                                alert("최대 구매수량은 10개입니다."); // 알림창 표시
                            }
                        });
                        // 수량 감소
                        $('#minus').click(function () {
                            if (quantity > 1) { // 최소 수량 1개로 제한
                                quantity -= 1;
                                $('#quantity').val(quantity);
                                total = price * quantity;
                                updateTotal(total);
                            }
                        });
                    });


                </script>


                <div class="btn-wrap">
                    <button type="button" class="wist-btn">
                        <i class="fa-sharp fa-light fa-heart"></i>
                    </button>

                    <span>
                            <button type="button" >장바구니</button>
                        </span>
                    <span>
                            <button type="button">바로구매</button>
                        </span>

                </div>
            </div>
        </div>
    </div><!--product-detail 끝-->
    </div><!--product-topview 끝-->

</section>

<div class="product-tab">
    <div class="tabType">
        <ul class="tabs">
            <li class="active" data-tab="tab1">
                <button type="button" class="tab-link">
                    <span>상세 정보</span>
                </button>
            </li>
            <li data-tab="tab2">
                <button type="button" class="tab-link">
                    <span>유의사항</span>
                </button>
            </li>
            <li data-tab="tab3">
                <button type="button" class="tab-link">
                    <span>리뷰</span>
                </button>
            </li>
            <li data-tab="tab4">
                <button type="button" class="tab-link">
                    <span>제품 문의</span>
                </button>
            </li>
        </ul>


<%--        <div id="tab1" class="tabcontent current">--%>
<%--            <img src="https://via.placeholder.com/300x300" alt="상세정보이미지">--%>
<%--        </div>--%>

<%--        <div id="tab2" class="tabcontent">--%>
<%--            <p>탭2</p>--%>
<%--        </div>--%>

<%--        <div id="tab3" class="tabcontent">--%>
<%--            <p>탭3</p>--%>
<%--        </div>--%>

<%--        <div id="tab4" class="tabcontent">--%>
<%--            <p>탭4</p>--%>
<%--        </div>--%>

<%--       --%>


    </div>
</div>


<jsp:include page="../footer.jsp"/>
</body>
</html>