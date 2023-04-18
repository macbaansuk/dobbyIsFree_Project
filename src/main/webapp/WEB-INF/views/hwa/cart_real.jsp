<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>장바구니 상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax -->
    <link rel="stylesheet" href="./css/hwa/cart_real.css"/><!-- css -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script><!-- 커스텀 창 -->  <!-- 안쓰는 방향으로 -->
    <script src="https://kit.fontawesome.com/d66ae73db8.js" crossorigin="anonymous"></script><!-- 아이콘 -->

    <style>
        .swal2-title {
            font-family: "나눔바른고딕OTF", "돋움";
            font-size: 1.5em;
        }
    </style>


</head>
<body>

<%--주석을 잘 적자--%>
<jsp:include page="../header.jsp"/>


<div id="root">

    <section id="container">
        <div id="container_box">
            <section id="content">
                <div id="cart_header">
                    <h2>장바구니</h2>
                </div>
                <ul>
                    <li> <!-- 모두선택, 선택 삭제 li -->
                        <div class="allCheck"> <!-- 모두 선택 체크 박스 -->
                            <input type="checkbox" name="allCheck" id="allCheck" checked="checked"/><label
                                    for="allCheck">모두 선택</label>
                            <%--  모두 선택 체크 버튼 체크시 모든 체크버튼 체크 <script>--%>
                            <script>
                                $("#allCheck").click(function () {  //모두 선택 버튼 체크시
                                    $(".chBox").prop("checked", $("#allCheck").prop("checked"));
                                });

                            </script>
                        </div> <%-- all check --%>
                        <div class="delBtn"> <%-- 선택 삭제 버튼 --%>
                            <button type="button" class="selectDelete_btn">선택 삭제</button>

                            <script>
                                $(".selectDelete_btn").click(function () {
                                    const confirm_val = confirm("선택한거 삭제할라구용?🥹");

                                    if (confirm_val) {
                                        const checkArr = [];  //체크된값 담을 배열 생성

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
                                            contentType: "application/json; charset=utf-8", //한글깨짐 추가
                                            url: "/cart/delete",
                                            type: "POST",
                                            data: JSON.stringify({'cartIdList': checkArr}),
                                            dataType: 'json',
                                            success: function () {
                                                location.reload();  //reload()로 하면 안됨
                                            },
                                            error: function () {
                                                location.reload();
                                            }
                                        });
                                    }
                                });
                            </script>
                        </div> <%-- delBtn end --%>
                    </li> <%-- 모두선택, 선택삭제 li end --%>
                    <c:set var="total_sum" value="0"/> <!-- 최종 가격 더하는 변수 -->
                    <c:set var="total_point" value="0"/> <!-- 최종 적립금 더하는 변수 -->

                    <c:choose>  <%-- 장바구니에 아무것도 담겨있지 않으면 --%>
                        <c:when test="${empty cartList}">
                            <li>
                            <div id="cart-icon">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </div>
                            <span class="empty-cart">장바구니가 비어있습니다.</span>
                            </li>
                        </c:when>
                    <c:otherwise>
                        <c:forEach items="${cartList}" var="cartProdDto"> <!-- cartProdDto 반복 시작 -->



                        <li class="cart-li"> <%-- 장바구니 목록 --%>

                            <div class="cart_info"> <!-- input hidden -->

                                <div class="checkBox"> <!-- 개별 체크 박스 -->
                                    <input type="checkbox" name="chBox" class="chBox" checked="checked"
                                           data-cartId="${cartProdDto.CART_ID}"/>

                                    <%--  개별 체크 박스 선택 해제시 모두 선택 체크박스도 해제--%>
                                    <script>
                                        $(".chBox").click(function () {
                                            $("#allCheck").prop("checked", false);
                                        });
                                    </script>
                                </div> <%--개별 체크 박스 end --%>

                                <div class="thumb"> <!-- 상품이미지 -->
                                    <img src="${cartProdDto.REP_IMG}"/>
                                </div>
                                <div class="gdsInfo"> <!--상품 정보 -->
                                        <span class="bold">상품명</span>${cartProdDto.PROD_NM} <br/>
                                        <span class="bold">개당 가격</span>
                                    <span class="amt" data-info="prod_amt" ><!-- 이거 추가 -->
                                        <c:choose>
                                        <c:when test="${cartProdDto.DC_YN eq 'Y'}">
                                            <c:set var="prod_fee" value="${cartProdDto.AMT * 0.9}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="prod_fee" value="${cartProdDto.AMT}"/>
                                        </c:otherwise>
                                        </c:choose>

                                            <fmt:formatNumber pattern="###,###,###" value="${prod_fee}"/> 원 </span> <br/>
                                        <span class="bold" data-cartId="${cartProdDto.CART_ID}"  >구입 수량</span>
                                        <span class ="prodQty"  data-info="prod_quantity">
                                            ${cartProdDto.PROD_INDV_QTY}</span>

                                    <div class="spinner small"> <!-- 수량 조절 버튼 -->
                                        <button type="button" class="btn-amount minus modifyBtn" title="수량감소"
                                                data-cartId="${cartProdDto.CART_ID}">수량감소
                                        </button>
                                        <input type="text" value="${cartProdDto.PROD_INDV_QTY}" maxlength="3"
                                               name="ordQty" class="goodsQty" data-cartId="${cartProdDto.CART_ID}"
                                               min="1" max="10">
                                        <button type="button" class="btn-amount plus modifyBtn" title="수량증가"
                                                data-cartId="${cartProdDto.CART_ID}">수량증가
                                        </button>
                                    </div><!-- 수량 조절 버튼  end-->
                                    <!-- 변경 버튼 -->
                                    <a href="javascript:void(0);" class="btn small slightly modifyConfirmBtn"
                                       data-cartId="${cartProdDto.CART_ID}">변경</a>  <!-- void return false로 해서 onclick () -->


                                    <script>

                                        //------------------------------------------------------------------------------------------------------------------------------
                                        //수량변경 input 숫자 1~10까지 입력 처리
                                        document.querySelector('.goodsQty').addEventListener('input', function () {
                                            const value = parseInt(this.value);

                                            if (value < 1 || value > 10) {  //1~10 사이의 수가 아닐 때
                                                Swal.fire({
                                                    title: '1~10개까지 입력해주세용 🥺',
                                                    confirmButtonColor: 'rgba(18, 182, 96)',
                                                })
                                                this.value = ''; //유효값이 아니면 input 값 초기화
                                            }
                                        });

                                        //plus 버튼 클릭시
                                        $(".modifyBtn.plus").off().on("click", function () {
                                            let quantity = parseInt($(this).parent("div").find("input").val()); //eq(0) -> 찾아서 등록 first 를 써서 사용
                                            if (quantity < 10) {
                                                $(this).parent("div").find("input").val(++quantity);
                                            } else {
                                                Swal.fire({
                                                    title: '10개까지만 담을 수 있어용 아쉽🥺',
                                                    confirmButtonColor: 'rgba(18, 182, 96)',
                                                })

                                            }
                                        });

                                        //minus 버튼 클릭시
                                        $(".modifyBtn.minus").off().on("click", function () {
                                            let quantity = parseInt($(this).parent("div").find("input").val());
                                            if (quantity > 1) {  //1보다 커야만 수량 값 감소
                                                $(this).parent("div").find("input").val(--quantity);
                                            }
                                        });

                                        //-----------------------------------------------------------------------------------수량 수정 버튼

                                        $(".modifyConfirmBtn").off().on("click", function () { //변경 버튼 클릭시
                                            let cartId = $(this).prev(".spinner").find("button.plus").data("cartid");
                                            let quantity = $(this).prev(".spinner").find("input").val();
                                            let $gdsInfo = $(this).closest('.gdsInfo'); // 변경버튼 해당하는 .gdsInfo 영역

                                                console.log("quantity",quantity);
                                            $.ajax({
                                                url: "/cart/update",
                                                type: "POST",
                                                data: {
                                                    cartId: cartId,
                                                    quantity: quantity
                                                },
                                                success: function (response) {  //reponse에서 받아서 처리하는 함수로 만들어서 교체

                                                    // 업데이트된 장바구니 상품 정보로 화면 갱신
                                                    let updatedData = response; // JSON.parse(response) 대신 response 사용(서버에서 이미 JSON으로 보냄)

                                                    // 구입 수량, 최종 가격, 적립 포인트
                                                    let $itemQuantity = $gdsInfo.find("span[data-info='prod_quantity']");
                                                    let $itemTotal = $gdsInfo.find("span[data-info='prod_total']");
                                                    let $itemPoints = $gdsInfo.find("span[data-info='prod_points']");

                                                    quantity = updatedData.prod_inv_qty;
                                                    console.log('구입수량 input', quantity);
                                                    let updatedProdQuantity = updatedData.prod_quantity; // 구입 수량
                                                    let updatedProdTotal = updatedData.prod_total;  //최종 가격
                                                    let updatedProdPoints = updatedData.prod_points;  //적립 포인트

                                                    console.log('수량',updatedData.prod_quantity)
                                                    console.log('가격',updatedData.prod_total)
                                                    console.log('포인트',updatedData.prod_points)



                                                    $itemQuantity.text(updatedProdQuantity);
                                                    $itemTotal.text(updatedProdTotal + " 원");
                                                    $itemPoints.text(updatedProdPoints + " P");

                                                    setTotalInfo();



                                                }
                                            }); // ajax
                                        }); //onclick


                                    </script>
                                    <!--  -->


                                    <span  class="prod_total price-data bold" data-price="${prod_total}">최종 가격</span>
                                    <span  data-info="prod_total">
                                        <c:set var="prod_total" value="${cartProdDto.PROD_INDV_QTY * prod_fee}"/>
                                        <fmt:formatNumber pattern="###,###,###" value="${prod_total}"/>원</span> <br/>
                                    <span  class="point point-data bold" data-point="${point}" >적립 포인트</span>
                                    <span data-info="prod_points" >
                                    <c:set var="point" value="${prod_total  * 0.01 }"/>
                                    <fmt:formatNumber pattern="###,###,###" value="${point}"/> P</span>

                                </div><!--상품 정보 end -->

                                    <div class="delete">  <!-- 삭제 버튼 -->
                                        <form action="/cart/delete/${cartProdDto.CART_ID}" method="post"
                                              class="quantity_delete_form">
                                            <button type="button" class="delete_${cartProdDto.CART_ID}_btn  cartDelBtn"
                                                    data-cartId="${cartProdDto.CART_ID}"
                                                    data-prodNo="${cartProdDto.PROD_ID}"
                                                    onclick="deleteA(this)"
                                            >삭제  <!-- this : window, 속성을 deleteA에 전달-->
                                            </button>
                                        </form>
                                        <script>

                                            function deleteA(this1) { //this1 -> 클릭된 삭제 버튼
                                                console.log('this1',this1);
                                                console.log('this',this);
                                                if (confirm("삭제할라구용?🥹")) {
                                                    const cartId = this1.dataset.cartid; //data 속성으로 cartId 찾음
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
                                                        success: function (data) {
                                                            console.log('반환 JSON data:', data);  //{status: 'success'}
                                                            // location.reload();
                                                            console.log('this1', this1);
                                                            console.log('closet', this1.closest('li'));
                                                            this1.closest('li').remove();
                                                            // alert('삭제 성공');
                                                            setTotalInfo();
                                                        },
                                                        error: function (jqXHR, textStatus, errorThrown) {
                                                            console.log('Error:', jqXHR, textStatus, errorThrown);

                                                            // location.reload();
                                                            alert('삭제 실패');
                                                        }
                                                    });<!--ajax -->
                                                } <!-- confirm -->
                                            }
                                        </script>
                                    </div>  <!-- 삭제 버튼 end -->

                                <!-- 사용자가 고칠수 있기 때문에 hidden을 쓰지 않아야 한다 -->
<%--                                <input type="hidden" class="individual_total_sum_input" value="${total_sum}">--%>
<%--                                <input type="hidden" class="individual_deliveryFee_input" value="${deliveryFee}">--%>
<%--                                <input type="hidden" class="individual_total_point_input" value="${total_point}">--%>
<%--                                <input type="hidden" class="individual_pdord_total_input"--%>
<%--                                       value="${total_sum + deliveryFee }">--%>
<%--                                <input type="hidden" class="individual_PROD_INDV_QTY_input"--%>
<%--                                       value="${cartProdDto.PROD_INDV_QTY}">--%>
<%--                                <input type="hidden" class="individual_AMT_input" value="${cartProdDto.AMT}">--%>
                                <input type="hidden" class="individual_DC_YN_input" value="${cartProdDto.DC_YN}">
                            </div> <!-- input hidden end -->

                        </li><%-- 장바구니 목록 end--%>

                        <%-- 반복할 때마다 sum에 상품 가격*상품 갯수만큼을 더함 --%>
                        <c:set var="total_sum" value="${total_sum + prod_total}"/>
                        <c:set var="total_point" value="${total_point + point}"/>


                            </c:forEach> <!--전체 반복문 end -->
                        </c:otherwise>
                    </c:choose>
                </ul>

            </section><!-- #contnet end -->
        </div><!--#container_box end-->
    </section><!-- #container -->

    <div class="totalPayment"> <!-- 결제정보 박스 -->
        <div class="inner">
            <div class="box">

                <section class="orderPrice">
                    <h4 class="subTitle2">결제정보</h4>
                    <dl>
                        <dt>주문금액</dt>
                        <dd><span class="num" id="totalOrdPrc">
<%--                                                        <fmt:formatNumber pattern="###,###,###" value="${total_sum}"/>--%>
                        </span></dd>
                    </dl>
                    <dl>
                        <%--                        <c:choose>--%> <%-- 배송비 계산 -- >
<%--                            <c:when test="${total_sum ge 20000}">--%>
                        <%--                                <c:set var="deliveryFee" value="0"/>--%>
                        <%--                            </c:when>--%>
                        <%--                            <c:otherwise>--%>
                        <%--                                <c:set var="deliveryFee" value="2500"/>--%>
                        <%--                            </c:otherwise>--%>
                        <%--                        </c:choose>--%>
                        <dt>배송비</dt>
                        <dd><span id="totalDlvCost">
<%--                                                                                    <fmt:formatNumber pattern="###,###,###" value="${deliveryFee}"/>--%>
                        </span></dd>
                    </dl>
                    <dl>
                        <dt>적립 예정 포인트</dt>
                        <dd><span class="num" id="totalPt">
                            <%--                          <fmt:formatNumber pattern="###,###,###" value="${total_point}"/> --%>

                        </span>&nbsp;
                        </dd>
                    </dl>
                    <dl class="totalPrice">
                        <dt>결제 예정 금액</dt>
                        <dd><span class="num" id="totalPrc">
<%--                                                    <fmt:formatNumber pattern="###,###,###" value="${total_sum + deliveryFee }"/>원--%>
                        </span></dd>
                    </dl>


                </section> <!--#orderPrice end-->
            </div><!-- .box end-->

            <!-- 주문하기 버튼 -->
            <button type="button" class="btnType4xl" id="cartPayBtn">주문하기</button>


        </div><!--inner end-->
    </div><!--totalPayment end -->
</div> <!--root end-->


<script>
    //결제박스 결제 정보 값 계산
    function setTotalInfo() {
        let totalOrdPrc = 0;  //주문금액
        let totalDlvCost = 0;   // 배송비
        let totalPt = 0;  // 적립금
        let totalPrc = 0; // 결제 예정금액
        let prodQty = 0; // 상품별 개수
        let amt = 0; //상품별 금액
        let DC = '';  //할인 여부
        let pt = 0; //개별 적립금

        // $(".cart_info").each(function (index, element) {
        $(".cart-li").each(function (index, element) {
            if ($(element).find(".chBox").is(":checked") === true) {	//체크여부

                // prodQty = $(element).find(".prodQty").text();
                // let prodTotalNum = parseInt(prodQty);

                DC = $(element).find(".individual_DC_YN_input").val();  //할인 여부
                prodQty =  parseInt($(element).find(".prodQty").text());  // 구입 수량 /  코드 한줄로 합침
                amt =  parseInt($(element).find(".amt").text().replace(/,/g, ""));  //개당(1) 가격 ,  (,) 쉼표-> 빈문자열로 대체
                console.log('상품가',amt);

                console.log('구입수량',prodQty);
                console.log('DC', DC);

                console.log('상품개수', prodQty);
                totalOrdPrc += prodQty * amt;  // 주문금액 계산 = 수량 * 금액
                pt = prodQty * amt * 0.01;  // 적립금 -> 금액의 1%
                console.log('개별 적립금', pt);

                console.log('주문금액', totalOrdPrc);
                totalPt += pt;  //최종 적립금
                console.log('적립금', totalPt);
                // 결제 예정금액
                totalPrc += parseInt($(element).find(".individual_pdord_total_input").val());
            }
        });
        if (totalOrdPrc >= 20000) {  // 주문금액 2만원이상시 배송비 무료
            totalDlvCost = 0;
        } else {
            totalDlvCost = 2500;
        }
        console.log('배송비', totalDlvCost);


        $("#totalOrdPrc").text(totalOrdPrc.toLocaleString() + "원");
        $("#totalDlvCost").text(totalDlvCost.toLocaleString() + "원");
        $("#totalPt").text(totalPt.toLocaleString() + "P");
        $("#totalPrc").text((totalOrdPrc + totalDlvCost).toLocaleString() + "원");
    }

    $(".chBox, #allCheck").on("change", setTotalInfo);  //체크박스 상태 변경시
    $(".modifyConfirmBtn").click(function() {
        setTotalInfo();
        console.log('실행');

    });



    $(document).ready(function () {

        setTotalInfo();
    });


</script>

<footer>
    <jsp:include page="../footer.jsp"/>
</footer>

</body>
</html>