<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>장바구니 상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./css/hwa/cart_real.css"/>


</head>
<body>
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
                        <div class="allCheck">
                            <input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">모두 선택</label>
                            <script>
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
                        <div class="delBtn">
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
                    <c:set var="sum" value="0"/>
                    <c:forEach items="${cartList}" var="cartProdDto">
                    <!-- 추가코드  할인금액 -->

                    <li>
                        <div class="checkBox">
                            <input type="checkbox" name="chBox" class="chBox"
                                   data-cartId="${cartProdDto.CART_ID}"/>
                                <%--                <script>--%>
                                <%--                  $(".chBox").click(function(){--%>
                                <%--                    $("#allCheck").prop("checked", false);--%>
                                <%--                  });--%>
                                <%--                </script>--%>
                        </div>

                        <div class="thumb">
<%--                            <img src="https://images.innisfree.co.kr/upload/product/25936_l1_S_250.jpg?T202304092137"/>--%>
                            <img src="${cartProdDto.REP_IMG}"/>
                        </div>
                        <div class="gdsInfo">
                            <p>
                                <span>상품명</span>${cartProdDto.PROD_NM} <br/>
                                <br/>
                                <span>개당 가격</span>
                                <c:choose>
                                <c:when test="${cartProdDto.DC_YN eq 'Y'}">
                                    <fmt:formatNumber pattern="###,###,###" value="${cartProdDto.AMT * 0.9}" /> 원 <br/>
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber pattern="###,###,###" value="${cartProdDto.AMT}" /> 원 <br/>
                                </c:otherwise>
                                </c:choose>




                                <span>구입 수량</span>${cartProdDto.PROD_INDV_QTY}


                                <!-- 추가 코드 -->
                            <div class="spinner small">
                                <button type="button" class="btn-amount minus modifyBtn" title="수량감소" data-cartId = ${cartProdDto.CART_ID}>수량감소</button>
                                <input type="text" value="${cartProdDto.PROD_INDV_QTY}" maxlength="3" name="ordQty" class="goodsQty">
                                <button type="button" class="btn-amount plus modifyBtn" title="수량증가" data-cartId = ${cartProdDto.CART_ID}>수량증가</button>
                                <input type="hidden" value="1" name="oriOrdQty"/>
                            </div>
                            <a href="javascript:void(0);" class="btn small slightly modifyConfirmBtn" data-target ="1">변경</a>
                            <script>

                                //------------------------------------------------------------------------------------------------------------------------------
                                // $(".modifyBtn.plus").off().on("click", function(){
                                //     let quantity = parseInt($(this).parent("div").find("input").val());
                                //     $(this).parent("div").find("input").val(++quantity);
                                // });
                                //
                                // $(".modifyBtn.minus").off().on("click", function(){
                                //     let quantity = parseInt($(this).parent("div").find("input").val());
                                //     if(quantity > 1){
                                //         $(this).parent("div").find("input").val(--quantity);
                                //     }
                                // });



                                $(".modifyBtn.plus").off().on("click", function(){
                                    let quantity = parseInt($(this).parent("div").find("input").val());
                                    if(quantity < 10) {
                                        $(this).parent("div").find("input").val(++quantity);
                                    } else {
                                        alert("10개까지만 담을 수 있네용 아쉽🥺");
                                    }
                                });

                                $(".modifyBtn.minus").off().on("click", function(){
                                    let quantity = parseInt($(this).parent("div").find("input").val());
                                    if(quantity > 1){
                                        $(this).parent("div").find("input").val(--quantity);
                                    }
                                });

                            </script>
                            <!--  -->


                                <span>최종 가격</span>
                                    <c:choose>
                                        <c:when test="${cartProdDto.DC_YN eq 'Y'}">
                                            <fmt:formatNumber pattern="###,###,###" value="${cartProdDto.PROD_INDV_QTY * cartProdDto.AMT * 0.9}" /> 원 <br/>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber pattern="###,###,###" value="${cartProdDto.PROD_INDV_QTY * cartProdDto.AMT}" /> 원 <br/>
                                        </c:otherwise>
                                    </c:choose>

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
                                $(document).ready(function () {
                                    // $("ul").on("click", ".cartDelBtn", );<!--click(function() -->
                                });
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
        </li>

            <%-- 반복할 때마다 sum에 상품 가격*상품 갯수만큼을 더함 --%>
                        <c:choose>
                            <c:when test="${cartProdDto.DC_YN eq 'Y'}">
                                 <c:set var="sum" value="${sum + (cartProdDto.PROD_INDV_QTY * cartProdDto.AMT * 0.9)}"/>
                            </c:when>
                            <c:otherwise>
                                 <c:set var="sum" value="${sum + (cartProdDto.PROD_INDV_QTY * cartProdDto.AMT)}"/>
                            </c:otherwise>
                        </c:choose>






        </c:forEach> <!--전체 반복문 -->
        </ul>

        <div class="listResult">
            <div class="sum">
                총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}"/>원
            </div>
        </div>


        <div class="inputArea">
            <button type="submit" class="order_btn">주문</button>
<%--            <button type="button" class="cancel_btn">취소</button>--%>
        </div>


    </section>
</div>
</section>


</div>
<footer>
<jsp:include page="../footer.jsp" />
</footer>

</body>
</html>