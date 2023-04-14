<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>장바구니 상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./css/hwa/cart_real.css"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .swal2-title {
            font-family: "나눔바른고딕OTF", "돋움";
            font-size: 1.5em;
        }
    </style>


</head>
<body>

<%--주석을 잘 적자--%>
<jsp:include page="../header.jsp" />





<div id="root">

    <section id="container">
        <div id="container_box">
            <section id="content">
                <div id="cart_header">
                    <h2>장바구니</h2>
                </div>
                <ul>
                    <li>
                        <div class="allCheck"> <!-- 모두 선택 체크 박스 -->
                            <input type="checkbox" name="allCheck" id="allCheck" checked="checked" /><label for="allCheck">모두 선택</label>
                            <script> //모두 체크 버튼 체크시 모든 체크버튼 체크 <script>
                            $("#allCheck").click(function () {  //모두 선택 버튼 체크시
                                let chk = $("#allCheck").prop("checked");
                                if (chk) {
                                    $(".chBox").prop("checked", true);
                                } else {
                                    $(".chBox").prop("checked", false);
                                }
                            });

                            </script>
                        </div>
                        <div class="delBtn"> <!-- 선택 삭제 버튼 -->
                            <button type="button" class="selectDelete_btn">선택 삭제</button>

                            <script>
                                $(".selectDelete_btn").click(function () {
                                    const confirm_val = confirm("선택한거 삭제할라구용?🥹");

                                    if (confirm_val) {
                                        const checkArr = [];

                                        // 체크된 체크박스의 갯수만큼 반복
                                        $("input[class='chBox']:checked").each(function () {
                                            checkArr.push(Number($(this).attr("data-cartId")));  // 배열에 데이터 삽입
                                        });
                                        console.log(checkArr)
                                        $.ajax({
                                            headers: {
                                                'Accept': 'application/json',
                                                'Content-Type': 'application/json'
                                            },
                                            contentType: "application/json; charset=utf-8",
                                            url: "/cart/delete",
                                            type: "POST",
                                            data: JSON.stringify({'cartIdList': checkArr}),
                                            dataType: 'json',
                                            success: function () {
                                                location.reload();
                                            },
                                            error: function () {
                                                location.reload();
                                            }
                                        });
                                    }
                                });
                            </script>
                        </div>
                    </li>
                    <c:set var="total_sum" value="0" /> <!-- 최종 가격 더하는 변수 -->
                    <c:set var="total_point" value="0" /> <!-- 최종 적립금 더하는 변수 -->
                    <c:forEach items="${cartList}" var="cartProdDto"> <!-- cartProdDto 반복 시작 -->




                        <li>
                            <div class="td_width_1 cart_info_td">  <!-- input hidden -->

                                <div class="checkBox"> <!-- 개별 체크 박스 -->
                                    <input type="checkbox" name="chBox" class="chBox" checked="checked"
                                           data-cartId="${cartProdDto.CART_ID}"/>
                                    <script> //개별 체크 박스 선택 해제시 모두 선택 체크박스도 해제
                                    $(".chBox").click(function(){
                                        $("#allCheck").prop("checked", false);
                                    });
                                    </script>
                                </div>

                                <div class="thumb"> <!-- 상품이미지 -->
                                    <img src="${cartProdDto.REP_IMG}"/>
                                </div>
                                <div class="gdsInfo"> <!--상품 정보 -->
                                    <p>
                                        <span>상품명</span>${cartProdDto.PROD_NM} <br/>
                                        <br/>
                                        <span>개당 가격</span>
                                        <c:choose>
                                        <c:when test="${cartProdDto.DC_YN eq 'Y'}">
                                            <c:set var="prod_fee" value="${cartProdDto.AMT * 0.9}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="prod_fee" value="${cartProdDto.AMT}"/>
                                        </c:otherwise>
                                        </c:choose>

                                            <fmt:formatNumber pattern="###,###,###" value="${prod_fee}" /> 원 <br/>
                                        <span>구입 수량</span>${cartProdDto.PROD_INDV_QTY}



                                    <div class="spinner small"> <!-- 수량 조절 버튼 -->
                                        <button type="button" class="btn-amount minus modifyBtn" title="수량감소" data-cartId = ${cartProdDto.CART_ID}>수량감소</button>
                                        <input type="text" value="${cartProdDto.PROD_INDV_QTY}" maxlength="3" name="ordQty" class="goodsQty">
                                        <button type="button" class="btn-amount plus modifyBtn" title="수량증가" data-cartId = ${cartProdDto.CART_ID}>수량증가</button>
                                    </div>
                                    <a href="javascript:void(0);" class="btn small slightly modifyConfirmBtn" data-cartId ="${cartProdDto.CART_ID}">변경</a>
                                    <script>

                                        //------------------------------------------------------------------------------------------------------------------------------


                                        $(".modifyBtn.plus").off().on("click", function(){
                                            let quantity = parseInt($(this).parent("div").find("input").val());
                                            if(quantity < 10) {
                                                $(this).parent("div").find("input").val(++quantity);
                                            } else {
                                                Swal.fire({
                                                    title: '10개까지만 담을 수 있어용 아쉽🥺',
                                                    confirmButtonColor: 'rgba(18, 182, 96)',
                                                })

                                                // alert("10개까지만 담을 수 있어용 아쉽🥺");
                                            }
                                        });

                                        $(".modifyBtn.minus").off().on("click", function(){
                                            let quantity = parseInt($(this).parent("div").find("input").val());
                                            if(quantity > 1){
                                                $(this).parent("div").find("input").val(--quantity);
                                            }
                                        });

                                        //-----------------------------------------------------------------------------------수량 수정 버튼

                                        $(".modifyConfirmBtn").off().on("click", function(){ //변경 버튼 클릭시
                                            let cartId = $(this).prev(".spinner").find("button.plus").data("cartid");
                                            let quantity = $(this).prev(".spinner").find("input").val();
                                            $.ajax({
                                                url: "/cart/update",
                                                type: "POST",
                                                data: {
                                                    cartId: cartId,
                                                    quantity: quantity
                                                },
                                                success: function(response) {
                                                    // 업데이트된 장바구니 상품 정보로 화면 갱신
                                                    location.reload();
                                                }
                                            });
                                        });


                                    </script>
                                    <!--  -->


                                    <span class="prod_total price-data" data-price="${prod_total}"> <!-- 원래는 그냥 span 태그만 -->
                                            <c:set var="prod_total" value="${cartProdDto.PROD_INDV_QTY * prod_fee}"/>
                                <fmt:formatNumber pattern="###,###,###" value="${prod_total}" /></span> 원 <br/>
                                    <span class="point point-data" data-point="${point}"></span>
                                    <c:set var="point" value="${prod_total  * 0.01 }"/>
                                    <fmt:formatNumber pattern="###,###,###" value="${point}"/> P


                                    </p>
                                        <%--                        </div>--%>
                                    <!-- 삭제 버튼 -->
                                    <div class="delete">
                                        <form action="/cart/delete/${cartProdDto.CART_ID}" method="post"
                                              class="quantity_delete_form">
                                            <button type="button" class="delete_${cartProdDto.CART_ID}_btn  cartDelBtn"
                                                    data-cartId="${cartProdDto.CART_ID}"
                                                    data-prodNo="${cartProdDto.PROD_NO}"
                                                    onclick="deleteA(this)"
                                            >삭제
                                            </button>
                                        </form>
                                        <script>

                                            function deleteA(this1) {
                                                if (confirm("삭제할라구용?🥹")) {
                                                    const cartId = this1.dataset.cartid; //data 속성으로 cartId
                                                    $.ajax({
                                                        headers: {
                                                            'Accept': 'application/json',
                                                            'Content-Type': 'application/json'
                                                        },
                                                        contentType: "application/json; charset=utf-8",
                                                        url: "/cart/delete",
                                                        type: "POST",
                                                        data: JSON.stringify({'cartIdList': [Number(cartId)]}),
                                                        dataType: 'json',
                                                        success: function () {
                                                            location.reload();
                                                        },
                                                        error: function () {
                                                            location.reload();
                                                        }
                                                    });<!--ajax -->
                                                } <!-- confirm -->
                                            }
                                        </script>
                                    </div>
                                </div>

                                <input type="hidden" class="individual_total_sum_input" value="${total_sum}">
                                <input type="hidden" class="individual_deliveryFee_input" value="${deliveryFee}">
                                <input type="hidden" class="individual_total_point_input" value="${total_point}">
                                <input type="hidden" class="individual_pdord_total_input" value="${total_sum + deliveryFee }">
                                <input type="hidden" class="individual_PROD_INDV_QTY_input" value="${cartProdDto.PROD_INDV_QTY}">
                                <input type="hidden" class="individual_AMT_input" value="${cartProdDto.AMT}">
                                <input type="hidden" class="individual_DC_YN_input" value="${cartProdDto.DC_YN}">
                            </div> <!-- input hidden -->



                        </li>
                        <%--                        <input type="hidden" class="individual_PROD_INDV_QTY_input" value="${cartProdDto.PROD_INDV_QTY}">--%>
                        <%--                        <input type="hidden" class="individual_AMT_input" value="${cartProdDto.AMT}">--%>
                        <%--                        <input type="hidden" class="individual_DC_YN_input" value="${cartProdDto.DC_YN}">--%>

                        <%-- 반복할 때마다 sum에 상품 가격*상품 갯수만큼을 더함 --%>
                        <c:set var="total_sum" value="${total_sum + prod_total}" />
                        <c:set var="total_point" value="${total_point + point}" />


                    </c:forEach> <!--전체 반복문 -->
                </ul>

            </section>
        </div>
    </section>

    <div class="totalPayment"> <!-- 결제정보 박스 -->
        <div class="inner">
            <div class="box">

                <section class="orderPrice">
                    <h4 class="subTitle2">결제정보</h4>
                    <dl>
                        <dt>주문금액</dt>
                        <dd><span class="num" id="totalOrdPrc">
                            <%--                            <fmt:formatNumber pattern="###,###,###" value="${total_sum}"/>--%>
                        </span></dd>
                    </dl>
                    <dl>
                        <c:choose>
                            <c:when test="${total_sum ge 20000}">
                                <c:set var="deliveryFee" value="0"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="deliveryFee" value="2500"/>
                            </c:otherwise>
                        </c:choose>
                        <dt>배송비</dt>
                        <dd><span id="totalDlvCost">
                            <%--                            <fmt:formatNumber pattern="###,###,###" value="${deliveryFee}"/>--%>
                        </span></dd>
                    </dl>
                    <dl>
                        <dt>적립 예정 포인트 </dt>
                        <dd><span class="num" id="totalPt">
                            <%--                          <fmt:formatNumber pattern="###,###,###" value="${total_point}"/> --%>

                        </span>&nbsp;
                        </dd>
                    </dl>
                    <dl class="totalPrice">
                        <dt>결제 예정 금액</dt>
                        <dd><span class="num" id="totalPrc">
                            <%--                        <fmt:formatNumber pattern="###,###,###" value="${total_sum + deliveryFee }"/>원--%>
                        </span></dd>
                    </dl>



                </section>
            </div>

            <!-- 주문하기 버튼 -->
            <button type="button" class="btnType4xl" id="cartPayBtn" >주문하기</button>


        </div>
    </div>
</div>
<%--</div>--%>


<script>


    function setTotalInfo() {
        let totalOrdPrc = 0;  //주문금액
        let totalDlvCost = 0;   // 배송비
        let totalPt = 0;  // 적립금
        let totalPrc = 0; // 결제 예정금액
        let prodQty = 0; // 상품별 개수
        let amt = 0; //상품별 금액
        let DC = '';  //할인 여부
        let pt = 0; //개별 적립금

        $(".cart_info_td").each(function(index, element){

            if($(element).find(".chBox").is(":checked") === true){	//체크여부
                // 주문금액
                prodQty = parseInt($(element).find(".individual_PROD_INDV_QTY_input").val());
                amt = parseInt($(element).find(".individual_AMT_input").val());
                DC = $(element).find(".individual_DC_YN_input").val();

                if(DC === 'Y'){
                    amt = amt * 0.9
                }
                console.log('DC', DC);
                console.log('할인적용금액',amt);

                console.log('상품개수',prodQty);
                totalOrdPrc += prodQty * amt;  // 주문금액 계산
                console.log('금액',amt);
                pt = prodQty * amt * 0.01;
                console.log('개별 적립금',pt);

                console.log('주문금액',totalOrdPrc);
                // 배송비
                totalDlvCost += parseInt($(element).find("#totalDlvCost").val());
                // 적립금
                totalPt += pt;
                console.log('적립금',totalPt);
                // 결제 예정금액
                totalPrc += parseInt($(element).find(".individual_pdord_total_input").val());
            }
        });
        if (totalOrdPrc >= 20000) {
            totalDlvCost = 0;
        } else {
            totalDlvCost = 2500;
        }
        console.log('주문금액2',totalOrdPrc);
        console.log('배송비',totalPt);



        $("#totalOrdPrc").text(totalOrdPrc.toLocaleString() + "원");
        $("#totalDlvCost").text(totalDlvCost.toLocaleString() + "원");
        $("#totalPt").text(totalPt.toLocaleString() + "P");
        $("#totalPrc").text((totalOrdPrc + totalDlvCost).toLocaleString() + "원");
    }

    $(".chBox, #allCheck").on("change", setTotalInfo);

    $(document).ready(function () {

        setTotalInfo();
    });





</script>


</div>
<footer>
    <jsp:include page="../footer.jsp" />
</footer>

</body>
</html>