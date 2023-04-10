<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>장바구니 내역</title>
    <link rel="stylesheet" href="../css/hwa/cart.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<%--<jsp:include page="../header.jsp"/>--%>


<div id="content" class="content">
    <div class="order-list-content">
        <div class="section-inner">
            <div class="section-title-wrap">
                <!-- 타이틀 -->
                <div class="section-title">
                    <h4 class="title">장바구니</h4>
                </div>
            </div>  <!--section-title-wrap-->
            <!-- 주문 전체 선택 -->
            <div class="check-cancle-box">
                <div class="selector-wrap horizontal">
                    <div class="asset">
                        <input type="checkbox" name="" id="allCheckBox" class="group-all-check" checked><span
                            class="label"><label for="allCheckBox">전체선택</label></span>
                    </div>
                </div>
                <button type="button" class="btn small slightly checkedDelBtn" title="선택삭제">선택삭제</button>
                <button type="button" class="btn small slightly delSoldOutBtn" title="품절상품 전체삭제">품절상품 전체삭제</button>
            </div><!--check-cancle-box-->


            <div class="order-product-wrap" data-vd-ven-id="VEN0000001" id="vdVenVEN0000001">
                <div class="all-check-group">
                    <div class="order-list-head">
                        <div class="selector-wrap horizontal etc-check-list">
                            <div class="asset">
                                <input type="checkbox" name="" id="orderItemCheck01" class="no-uniform all-check"
                                       checked>
                                <label for="orderItemCheck01">able<span style="color:#e26b0f;">·</span>shop 배송상품 총<span
                                        class="em success">1</span>개</label>
                            </div>
                        </div>
                    </div>


                    <c:forEach items="${cartList}" var="cartProdDto"> <!-- 반복 시작 -->


                    <div class="order-cart-body">

                        <div class="order-cart-wrapper">
                            <div class="order-cart-list cart" id="cart13397717" data-cart-id="13397717"
                                 data-goods-id="BO00110144" data-goods-ungd-id="98167"
                                 data-goods-nm="비타씨플러스 잡티씨 탄력 앰플 40ml"
                                 data-price="24500" data-quantity="1" data-brnd-nm="미샤" data-category="스킨케어/앰플/에센스"
                                 data-variant="NEW 비타씨플러스 잡티씨 탄력 앰플 40ml"
                                 data-set-yn="N" data-goods-ungd-id-list="98167" data-cart-id-list="13397717">


                                <div class="item ing">
                                    <div class="check-area">
                                        <div class="selector-wrap etc-check-list no-label">
                                            <div class="asset">
                                                <input type="checkbox" name="" id="orderItemCheck"
                                                                                           class="no-uniform check-ip" checked>
                                                <label for="orderItemCheck01">상품선택</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="order-list-wrap">
                                        <div class="thumbnail-wrap">
                                            <div class="thumbnail-inner">
                                                <a href="javascript:void(0);" class="link cartGoodsDetail"
                                                   data-goodsid="BO00110144" data-index="1" data-brndnm="미샤"
                                                   data-url="/product/goods/view-goods?goodsId=BO00110144"
                                                   data-imageurl="https://static.ableshop.kr/ext/images/goods/top/23/02/10/09/BO00110144/0000292246.jpg"
                                                   data-goodsnm="비타씨플러스 잡티씨 탄력 앰플 40ml" data-price="24500"
                                                   data-dspcate=",,">
                                                    <div class="thumbnail">
                                                        <div class="cell">
                                                            <img src="https://static.ableshop.kr/ext/images/goods/top/23/02/10/09/BO00110144/0000292246.jpg"
                                                                 alt="상품이미지"
                                                                 onerror="this.src='https://static.ableshop.kr/web/fo/static/images/common/no-image.png'">
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="detail">
                                            <div class="title-area">
                                                <a href="javascript:void(0);" class="link cartGoodsDetail"
                                                   data-goodsid="BO00110144" data-index="1" data-brndnm="미샤"
                                                   data-url="/product/goods/view-goods?goodsId=BO00110144"
                                                   data-imageurl="https://static.ableshop.kr/ext/images/goods/top/23/02/10/09/BO00110144/0000292246.jpg"
                                                   data-goodsnm="비타씨플러스 잡티씨 탄력 앰플 40ml" data-price="24500"
                                                   data-dspcate=",,"
                                                   data-goods-ungd-id-list="98167" data-set-yn="N">
                                                    <div class="brand">상품ID : ${cartProdDto.PROD_NO}</div>
                                                    <div class="brand">카트ID : ${cartProdDto.CART_ID}</div>
                                                    <strong class="title">${cartProdDto.PROD_NM}</strong>
                                                </a>
                                                <div class="option-area">
                                                    <div class="type">옵션</div>
                                                    <div class="option">옵션명</div>
                                                </div>
                                                <div class="option-area">
                                                    <div class="type">배송비</div>
                                                    <div class="option">2,500원(25,000원 이상 구매 시 무료)</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-area">
                                            <div class="set-area">
                                                <div class="spinner small">
                                                    <button type="button" class="btn-amount minus modifyBtn"
                                                            title="수량감소">수량감소
                                                    </button>
                                                    <input type="text" value="${cartProdDto.PROD_INDV_QTY}"
                                                           maxlength="3" name="ordQty" class="goodsQty">
                                                    <button type="button" class="btn-amount plus modifyBtn"
                                                            title="수량증가">수량증가
                                                    </button>
                                                    <input type="hidden" value="1" name="oriOrdQty"/>
                                                </div>
                                                <a href="javascript:void(0);"
                                                   class="btn small slightly modifyConfirmBtn">변경</a>
                                            </div>
                                        </div><!--control-area-->
                                        <div class="price-area">
                                            <div class="origin-price">
                                                <span class="origin"><span class="number rgPrice">35000</span>원</span>
                                            </div>
                                            <div class="current-price"><strong
                                                    class="number slPrice">${cartProdDto.AMT}</strong>원
                                            </div>
                                        </div><!--price-area-->
                                        <div class="btn-unit">
                                            <form action="/cart/delete/${cartProdDto.CART_ID}" method="post" class="quantity_delete_form
                                            ">
                                            <button type="button" class='btn btn-like cartLikeBtn'
                                                    data-goods-id="">좋아요
                                            </button>
                                            <button type="button" class="btn btn-delete cartDelBtn" name="prodNo" value="${cartProdDto.PROD_NO}"
                                                    data-cartId="${cartProdDto.CART_ID}" data-prodNo="${cartProdDto.PROD_NO}"  >삭제  <!-- 삭제버튼 -->
                                            </button>
                                            </form>
                                        </div>
                                    </div><!--btn-unit-->

                                </div>
                            </div><!--"order-cart-list cart-->
                        </div>
                    </div>
                    </c:forEach><!--반복 끝 -->
                </div><!--all-check-group-->
            </div><!--order-product-wrap-->

    <div class="order-total-price-wrap">
        <!-- 최종 결제금액 -->
        <div class="price-area">
            상품금액 <strong><span class="venTotalslPrice">0</span>원</strong>
            + 배송비 <strong><span class="venTotalDeliPrice">2,500</span>원</strong>
            = 결제 금액 <strong class="em success"><span class="venTotalPrice">0</span>원</strong>

            <span class="condition tooltip-wrap">

                                                                (20,000원 이상 무료배송)
                                                            <div class="tooltip-area">
                                                                <a href="javascript:void(0);" class="btn tooltip">배송비 안내 툴팁</a>
                                                            </div>
                <!-- tooltip : box -->
                                                            <div class="tooltip-box">
                                                                <strong class="title">[dobbyisfree 배송비 정책]</strong>
                                                                <ul class="info-list">
                                                                    <li>
                                                                        조건부 무료 : 20,000원 이상 구매 시 무료이며, 미만시 2,500원 추가 부과됩니다.
                                                                    </li>
                                                                    <li>업체별, 상품별, 제주 도서산 간지역에 따라 배송비 정책이 상이할 수 있으므로 정확한 배송지 정보는 주문/결제 화면에서 확인해주세요.</li>
                                                                </ul>
                                                            </div>
                        </span>
        </div> <!--price-area -->
    </div> <!--order-total-price-wrap-->
            <div class="order-payment-wrapper">
                <div class="order-payment-area">
                    <div class="order-payment info">
                        <div class="big-title">전체합계</div>
                    </div>

                    <div class="order-payment detail">
                        <dl>
                            <dt>상품금액</dt>
                            <dd><span class="totalGoodsPrice">0</span>원</dd>
                        </dl>
                        <dl>
                            <dt>할인금액</dt>
                            <dd class="sale"><span class="totalGoodsDisPrice">0</span>원</dd>
                        </dl>
                        <dl>
                            <dt>배송비</dt>
                            <dd><span class="totalDeliveryPrice">0</span>원</dd>
                        </dl>
                        <dl class="total-pay">
                            <dt>총 결제예정금액</dt>
                            <dd><span class="totalOrderPrice">0</span>원</dd>
                        </dl>
                    </div>
                </div>
                <p class="guide-icon-text">총 결제예정금액은 쿠폰 및 멤버십 할인혜택에 따라 변경될 수 있습니다.</p>
                <p class="guide-icon-text">장바구니 상품은 <span class="bold">90</span>일 동안 최대 <span class="bold">100</span>개 까지 보관 가능합니다.
                    상품을 장기간 보관하시려면 <span class="bold">[찜하기]</span>를 클릭해주세요.</p>
                <div class="btn-group-02 pay-button">
                    <a href="javascript:void(0);" class="btn large slightly orderBtn">선택상품 주문 <span
                            class="em success totalGoodsCnt">(0개)</span></a>
                    <a href="javascript:void(0);" class="btn large success allGoodsOrderBtn orderBtn">전체주문</a>
                </div>
            </div><!--order-payment-wrapper-->
        </div><!--section-inner-->



    </div><!--order-list-content-->





</div><!-- container -->
<%--<jsp:include page="../footer.jsp"/>--%>


<script>
    $(document).ready(function() {

        // const deleteButtons = document.querySelectorAll('.cartDelBtn');
        //
        // deleteButtons.forEach(button => {
        //     button.addEventListener('click', () => {
        //         if (confirm("삭제할라구용")) {
        //             const cartItem = button.closest('.cart-item');
        //             const orderCartBody = document.querySelector('.order-cart-body');
        //             orderCartBody.remove();
        //         }
        //     });
        // });
    });

</script>
</body>
</html>
