<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>장바구니 상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./css/hwa/cart_real.css"/>
    <style>
        .spinner {
            display: inline-block;
            position: relative;
            border: 1px solid #dddee1;
            background-color: #fff;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .spinner:before, .spinner:after {
            content: "";
            display: table;
        }

        .spinner:after {
            clear: both;
        }

        .spinner input, .spinner button {
            float: left;
        }

        .spinner input {
            font-family: "Open Sans", "Noto Sans KR", "Malgun Gothic", "Apple SD Gothic Neo", "돋움", Dotum, Helvetica, Arial, sans-serif;
            width: 46px;
            height: 32px;
            line-height: 32px;
            color: #000000;
            padding: 0;
            font-size: 16px;
            border: 0;
            border-right: 1px solid #d5d5d5;
            border-left: 1px solid #d5d5d5;
            text-align: center;
            background-color: #fff;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .spinner input[readonly] {
            background-color: #fff;
        }

        .spinner input[readonly]:focus {
            border-top-color: transparent;
            border-bottom-color: transparent;
        }

        .spinner .btn-amount {
            display: block;
            width: 32px;
            height: 32px;
            border: 0;
            cursor: pointer;
            background-color: transparent;
            background-repeat: no-repeat;
            background-position: center center;
            background-size: 11px 11px;
            overflow: hidden;
            text-indent: -9999px;
            font-size: 0.01em;
            color: transparent;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .spinner .btn-amount.minus {
            border-right: 0;
            background-image: url("https://static.ableshop.kr/web/fo/static/images/common-fix/ico-spinner-minus.png");
        }

        .spinner .btn-amount.plus {
            border-left: 0;
            background-image: url("https://static.ableshop.kr/web/fo/static/images/common-fix/ico-spinner-plus.png");
        }

        .spinner.disabled {
            background-color: #e5e5e5;
        }

        .spinner.disabled input[type="text"] {
            color: #c1c1c1;
        }

        .spinner.disabled button.btn-amount {
            background-color: #e5e5e5;
        }

        .spinner.disabled button.minus {
            background-image: url("https://static.ableshop.kr/web/fo/static/images/common-fix/ico-spinner-minus.png");
        }

        .spinner.disabled button.plus {
            background-image: url("https://static.ableshop.kr/web/fo/static/images/common-fix/ico-spinner-plus.png");
        }

        .spinner.small .btn-amount {
            width: 24px;
            height: 24px;
            background-color: #f9f9f9;
        }

        .spinner.small input {
            width: 37px;
            height: 24px;
            line-height: 24px;
            font-size: 14px;
        }

        .spinner.small.disabled .btn-amount {
            background-color: #f6f6f6;
        }

        .spinner.small.disabled .btn-amount.minus {
            background-image: url("https://static.ableshop.kr/web/fo/static/images/common-fix/ico-spinner-minus.png");
        }

        .spinner.small.disabled .btn-amount.plus {
            background-image: url("https://static.ableshop.kr/web/fo/static/images/common-fix/ico-spinner-plus.png");
        }

        .spinner.small.disabled input {
            background-color: #f6f6f6;
        }
        #cart_header{padding: 30px 0 30px 0;}

        .order_btn {
            /*       border: 1px solid black; */
            font-size: 18px;
            padding: 5px 10px;
            border: 1px solid #eee;
            background: #eee;

        }

        .inputArea{padding: 20px 0 20px 0}

        /*변경 버튼*/
        .btn {
            position: relative;
            -webkit-transition: 0.3s;
            -o-transition: 0.3s;
            transition: 0.3s;
            display: inline-block;
            border-width: 1px;
            border-style: solid;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            text-decoration: none;
            -webkit-appearance: none;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }
        .btn.slightly {
            color: #222;
            border-color: #d5d5d5;
            background-color: #fff;
        }
        .btn.small {
            padding: 0 15px;
            height: 40px;
            line-height: 38px;
            font-size: 16px;
            /* font-weight: 400; */
        }
        /*변경 버튼 끝*/
    </style>


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
                                $("#allCheck").click(function () {
                                    var chk = $("#allCheck").prop("checked");
                                    if (chk) {
                                        $(".chBox").prop("checked", true);
                                    } else {
                                        $(".chBox").prop("checked", false);
                                    }
                                });
                            </script>
                        </div>
ㄴ                        <div class="delBtn">
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
                            <img src="https://images.innisfree.co.kr/upload/product/25936_l1_S_250.jpg?T202304092137"/>
                        </div>
                        <div class="gdsInfo">
                            <p>
                                <span>상품명</span>${cartProdDto.PROD_NM} <span> |카트ID : ${cartProdDto.CART_ID} </span>
                                <br/>
                                <span>개당 가격</span>${cartProdDto.AMT} 원<br/>
                                <span>구입 수량</span>${cartProdDto.PROD_INDV_QTY}
                                    <%--                                        ${cartProdDto.PROD_INDV_QTY} 개<br/>--%>

                                <!-- 추가 코드 -->
                            <div class="spinner small">
                                <button type="button" class="btn-amount minus modifyBtn" title="수량감소">수량감소</button>
                                <input type="text" value="${cartProdDto.PROD_INDV_QTY}" maxlength="3" name="ordQty" class="goodsQty">
                                <button type="button" class="btn-amount plus modifyBtn" title="수량증가">수량증가</button>
                                <input type="hidden" value="1" name="oriOrdQty"/>
                            </div>
                            <a href="javascript:void(0);" class="btn small slightly modifyConfirmBtn" data-target ="1">변경</a>
                            <script>
                                const decreaseBtn = document.querySelector('.btn-amount.minus');
                                const increaseBtn = document.querySelector('.btn-amount.plus');
                                const inputField = document.querySelector('.goodsQty');

                                decreaseBtn.addEventListener('click', () => {
                                    let currentValue = parseInt(inputField.value);
                                    if (currentValue > 1) {
                                        inputField.value = currentValue - 1;
                                    }
                                });

                                increaseBtn.addEventListener('click', () => {
                                    let currentValue = parseInt(inputField.value);
                                    inputField.value = currentValue + 1;
                                });

                                if(currentValue >=10)
                                    alert ("10개까지 담으실수 있어용😉")
                            </script>
                            <!--  -->


                                <span>최종 가격</span>${cartProdDto.PROD_INDV_QTY * cartProdDto.AMT} 원
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
        <c:set var="sum" value="${sum + (cartProdDto.PROD_INDV_QTY * cartProdDto.AMT)}"/>

        </c:forEach>
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