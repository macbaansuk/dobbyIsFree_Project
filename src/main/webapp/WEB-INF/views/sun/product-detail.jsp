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
                            <strong class="discount-price">${productDetail.amt}원</strong>
                            <span class="original-price"></span>
                            <span class="discount-rate"></span>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="dc" items="${Products_DC}">
                                <c:if test="${productDetail.prod_id == dc.prod_id}">
                                    <strong class="discount-price">${dc.dc_price}원</strong>
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
                            if (quantity < 10) { // 최대 수량 10개
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
                            if (quantity > 1) { // 최소 수량 1개
                                quantity -= 1;
                                $('#quantity').val(quantity);
                                total = price * quantity;
                                updateTotal(total);
                            }
                        });
                    });


                </script>


                <div class="btn-wrap">
                    <button type="button" class="heart-icon">
                        <i class="fa-regular fa-heart"></i>
                    </button>

                    <span>
                            <button type="button">장바구니</button>
                        </span>
                    <span>
                            <button type="button">바로구매</button>
                        </span>

                </div>
            </div>
        </div>
    </div><!--product-detail 끝-->
    </div><!--product-topview 끝-->

    <script>
        function changeHeartIcon() {
            $('.heart-icon i').toggleClass('fa-regular fa-solid');
        }

        $('.heart-icon').click(function() {
            changeHeartIcon();
        });
    </script>


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
    </div>

    <div class="tab-contents">
        <div id="tab1" class="tab-content active">

            <img src="https://via.placeholder.com/600x800" alt="상세정보 이미지"/>

        </div>
        <div id="tab2" class="tab-content">
            <div class="product-noticeWrap">
                <h4 class="product-noticetitle"> 배송 구매/배송안내 </h4>
                <div class="product-notice">
                    <ul class="product-noticelist">
                        <li><span class="num">1.</span> 배송지역 : 전국</li>
                        <li><span class="num">2.</span> 배송비: 20,000원 이상(할인 등이 적용된 최종 결제 금액 기준) 배송비 무료</li>
                        <li><span class="num">3.</span> 도비스프리는 CJ 택배를 이용합니다. 군부대의 경우 주문 단계에서 군부대 배송을 체크하여 주시면, 우체국 택배로
                            발송됩니다. 단, 택배 송장 번호 확인시 CJ 택배 송장이 표기되며, <br> 우체국 송장 번호는 고객 상담실로 전화 주시면 확인 가능합니다.
                        </li>
                        <li><span class="num">4.</span> 배송예정일 : 평일 오후 2시 이전 주문 건은 당일 출고되며, 그 후 주문 건은 다음 날 출고됩니다. 보통
                            주문일로부터 평일 기준 2~3일 소요되며,<br> 주말/공휴일이 포함되거나 할인 행사로 인한 주문 폭주 및 택배사의 사정 등으로 인한 경우 배송이 지연될 수
                            있습니다.
                        </li>
                        <li><span class="num">5.</span> 상품 불량 및 오배송 등으로 인한 교환/반품신청의 경우 배송비는 무료 입니다.</li>
                        <li><span class="num">6.</span> 고객님의 단순 변심으로 인한 교환/반품 신청은 고객님께서 왕복배송비 5,000원을 부담해 주셔야 처리가
                            됩니다.<br> <strong class="ftColor2">정석은행 325-20-460048 (주)도비스프리</strong></li>
                        <li><span class="num">7.</span> 주의사항<br> 1) 한정된 수량으로 더 많은 고객님들께 혜택을 드리기 위하여, 동일 주소지 대량 주문 시 1인
                            고객으로 집계하여 해당 아이디에 대한 주문이 제한될 수 있습니다.<br>2) 주문번호/주문자/수취인/전화번호가 달라도 배송주소지가 동일 할 경우 자동 묶음 배송 될
                            수 있습니다.
                        </li>
                    </ul>
                </div>
            </div>

            <div class="product-noticeWrap">
                <h4 class="product-noticetitle"> 교환/반품안내 </h4>
                <div class="product-notice">
                    <ul class="product-noticelist">
                        <li><span class="num">1.</span> 사은품 품절 시 공지 없이 대체상품이 발송됩니다.</li>
                        <li><span class="num">2.</span> 주문번호/주문자/수취인/전화번호가 달라도 배송주소지가 동일 할 경우 자동 묶음 배송 될 수 있습니다.</li>
                        <li><span class="num">3.</span> 이벤트 적용 및 사은품 증정은 장바구니에 담아두신 시점과 관계없이 결제 당시 사은품으로 증정됩니다.
                            <ul class="bulListTypeNum">
                                <li><b class="ftColor2"><span class="num">1.</span> 사은품 품절 시 공지 없이 대체상품이 발송됩니다.</b>
                                    <ul class="bulListType3">
                                        <li>단순변심, 착오구매에 따른 교환/반품 신청은 상품을 공급받은 날부터 7일 이내 가능합니다. (배송비 고객 부담)</li>
                                        <li>다만, 공급받은 상품이 표시/광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 상품을 공급받은 날부터 3개월 이내,<br>
                                            그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내 교환/반품 신청을 하실 수 있습니다. (배송비 회사 부담)
                                        </li>
                                        <li>교환/반품을 원하는 고객은 쇼핑몰 고객센터 (080-380-0114)에 전화하시거나 쇼핑몰의 [마이페이지&gt;내 주문관리]를 통해
                                            신청하시면 됩니다.<br>
                                            신청 후 2~3일 이내에 이니스프리 지정 택배사가 직접 방문하여 상품을 수거합니다. (반송지 주소: 경상북도 김천시 대광동
                                            1000-2번지 아모레퍼시픽 김천물류센터 이니스프리 담당자 : 오연정)
                                        </li>
                                        <li>해당 상품 구매 시 사은품/증정품 등이 제공된 경우, 상품 교환/반품 시 함께 보내주셔야 합니다.</li>
                                        <li>반품 시 상품대금 환불은 상품 회수 및 청약철회가 확정된 날부터 3영업일 이내 진행되며, 기한을 초과한 경우 지연기간에 대하여 연
                                            100분의 15를 곱하여 산정한 지연이자를 지급합니다.
                                        </li>
                                    </ul>
                                </li>
                                <li><b class="ftColor2"><span class="num">2.</span> 교환/반품이 불가능한 경우</b>
                                    <ul class="bulListType3">
                                        <li>고객에게 책임이 있는 사유로 상품이 멸실되거나 훼손된 경우(상품내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</li>
                                        <li>고객의 사용 또는 일부 소비로 상품 가치가 현저히 감소한 경우</li>
                                        <li>시간이 지나 다시 판매하기 곤란할 정도로 상품 가치가 현저히 감소한 경우</li>
                                        <li>복제가 가능한 상품의 포장을 훼손한 경우</li>
                                        <li>고객의 주문에 따라 개별적으로 생산되는 상품 또는 이와 유사한 상품에 대하여 청약철회등을 인정하는 경우 통신판매업자에게 회복할 수 없는
                                            중대한 피해가 예상되는 경우로서<br>사전에 해당 거래에 대하여 별도로 그 사실을 고지하고 고객의 서면(전자문서 포함)에 의한 동의를
                                            받은 경우
                                        </li>
                                        <li>오프라인 매장에서 구매한 제품은 불가능</li>
                                    </ul>
                                </li>
                                <li><b class="ftColor2"><span class="num">3.</span> 불만처리 및 분쟁해결</b>
                                    <ul class="bulListType3">
                                        <li>교환/반품/대금 환불 등에 대한 문의사항 및 불만처리 요청은 쇼핑몰 고객센터 [080-380-0114] 혹은 1:1 고객문의 게시판을
                                            이용하세요.
                                        </li>
                                        <li>고객센터 운영시간: (월~목) 09:00~18:00 , (금) 09:00~17:30 , 토/일/공휴일 휴무</li>
                                        <li>본 상품의 품질보증 및 피해보상에 관한 사항은 관련 법률 및 공정거래위원회 고시 「소비자분쟁해결기준」에 따릅니다.</li>
                                        <li>트러블에 의한 반품 시 의사의 소견서를 첨부해야 하며 기타 제반 비용은 고객님이 부담하셔야 합니다.<br>다만, 의사의 소견에 따라 구매
                                            상품의 사용으로 인한 사유가 명백한 경우 소비자분쟁해결기준에 따릅니다.
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>


        </div>
        <div id="tab3" class="tab-content">리뷰 내용</div>
        <div id="tab4" class="tab-content">
            <div class="product-inquiry">
                <p> ※ 배송, 주문(취소/교환/환불)관련 문의는 고객센터 1:1 고객상담에 남겨주세요.</p>

                <span class="product-inquirylink" >
                   <h4> 제품 문의 </h4>
                <button type="button" class="inquiry-btn">문의하기</button>
                </span>
                <hr>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('.tabs li').on('click', function () {
            const tabId = $(this).data('tab');

            $('.tab-link').removeClass('current');
            $(this).find('.tab-link').addClass('current');

            $('.tab-content').removeClass('active');
            $('#' + tabId).addClass('active');
        });

        $('.tab-link:first').addClass('current');
        $('.tab-content:first').addClass('active');
    });

</script>


<jsp:include page="../footer.jsp"/>
</body>
</html>