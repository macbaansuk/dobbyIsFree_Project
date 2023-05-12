<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 페이지</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../../css/sun/admin-product.css"/>



<body>

<div class="admin">
    <div class="Header">
        <span class="span1">관리자 </span>
        <span class="span2">매뉴얼</span>
        <ul class="navi">
            <li>
                <a href="/memberPage/list">
                    <span class="menuWrap">회원 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="/admin/product/list">
                    <span class="menuWrap">상품 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="/admin/inv/list">
                    <span class="menuWrap">재고 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="/admin/notice/list">
                    <span class="menuWrap">게시판 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="/admin/logout">
                    <span class="menuWrap">로그아웃<button type="button" class="bar"></button></span>
                </a>
            </li>
        </ul>
    </div>


    <div class="admin-bar">
        <div class="admin-left">
            <h2>상품 관리</h2>
            <ul class="admin-ul">
                <li class="on"><a href="#" onfocus="this.blur();">상품 관리</a></li>
                <ul>
                    <li><a href="/admin/product/list" onfocus="this.blur();">상품목록</a></li>
                </ul>

            </ul>
        </div><!-- //admin-left// -->

        <div class="admin-container">
            <div class="admin-location">HOME &gt; 쇼핑몰관리 &gt; 상품관리 &gt; 재고관리</div>
            <div class="content">

<%--                <form id="productForm" enctype="multipart/form-data" method="post">--%>
    <form id="productForm" action="<c:url value='/admin/product/register'/>" enctype="multipart/form-data" method="post">

    <table class="product-table">
                        <%--                        <input type="hidden" name="PROD_ID" value="${productDto.PROD_ID}">--%>
                        <thead>
                        <tr>
                            <th colspan="2">상품 정보</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>

                            <td>
                                <label for="product-status">상품 상태</label>
                            </td>
                            <td>
                                <select id="product-status" name="PROD_STUS">
                                    <option value="판매대기">판매대기</option>
                                    <option value="판매" selected>판매</option>
                                    <option value="판매안함">판매안함</option>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label for="category">카테고리</label>
                            </td>
                            <td>
                                <select id="category" name="CATE_CD">
                                    <option value=1>스킨케어</option>
                                    <option value=2>메이크업</option>
                                    <option value=3>남성</option>
                                    <option value=4>헤어/바디</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="product-name">상품명</label>
                            </td>
                            <td>
                                <input type="text" id="product-name" name="PROD_NM" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="product-description">상품 설명</label>
                            </td>
                            <td>
                                <textarea id="product-description" name="PROD_DESC" required></textarea>
                            </td>
                        </tr>
                        </tbody>


                        <thead>
                        <tr>
                            <th colspan="2">상품 옵션</th>
                        </tr>
                        </thead>
                        <tr>
                            <td>
                                <label>신상품 여부</label>
                            </td>
                            <td>
                                <%--                                <input type="checkbox" id="new-product" name="NEW_YN">--%>
                                <input type="radio" id="new-use" name="NEW_YN" value="Y">
                                <label for="new-use">사용</label>
                                <input type="radio" id="new-not-use" name="NEW_YN" value="N" checked>
                                <label for="new-not-use">사용 안함</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label >메인진열 여부</label>
                            </td>
                            <td>
                                <%--                                <input type="checkbox" id="main-display" name="MAI_YN" >--%>
                                <input type="radio" id="main-use" name="MAI_YN" value="Y">
                                <label for="main-use">사용</label>
                                <input type="radio" id="main-not-use" name="MAI_YN" value="N" checked>
                                <label for="main-not-use">사용 안함</label>
                            </td>
                        </tr>
                        <%--                        <tr>--%>
                        <%--                            <td>--%>
                        <%--                                <label>옵션 사용</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="radio" id="option-use" name="OPT_YN" value="Y">--%>
                        <%--                                <label for="option-use">사용</label>--%>
                        <%--                                <input type="radio" id="option-not-use" name="OPT_YN" value="N" checked>--%>
                        <%--                                <label for="option-not-use">사용 안함</label>--%>
                        <%--                                <!-- 기본값 checked -->--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>


                        <%--                        <tr class="option-row" style="display: none;">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="option-name">옵션명</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="text" id="option-name" name="OPT_NM">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>
                        <%--                        <tr class="option-row" style="display: none;">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="option-value">옵션값</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td colspan="3">--%>
                        <%--                                <input type="text" id="option-value" name="OPT_VAL">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>


                        <thead>
                        <tr>
                            <th colspan="2">상품 가격</th>
                        </tr>
                        </thead>
                        <tr>
                            <td>
                                <label for="price">가격</label>
                            </td>
                            <td>
                                <input type="number" id="price" name="AMT" required>
                            </td>
                        </tr>

                            <tr>
                                <td>
                                    <label>할인 여부</label>
                                </td>
                                <td>
                                    <input type="radio" id="discount-use" name="DC_YN" value="Y">
                                    <label for="discount-use">할인 적용</label>
                                    <input type="radio" id="discount-not-use" name="DC_YN" value="N" checked>
                                    <label for="discount-not-use">할인 적용 안함</label>
                                    <!-- 기본값 checked -->
                                </td>
                            </tr>


                        <%--                        <tr class="discount-row">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="discount-rate">할인율</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="number" id="discount-rate" name="DC_RATE">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>

                        <%--                        <tr class="discount-row">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="discount-amount">할인 금액</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="number" id="discount-amount" name="DC_AMT">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>

                        <%--                        <tr class="discount-row">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="discount-period">할인 시작일</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td colspan="3">--%>
                        <%--                                <input type="date" id="discount-period" name="BGN_DTM">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>
                        <%--                        <tr class="discount-row">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="discount-end">할인 종료일</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td colspan="3">--%>
                        <%--                                <input type="date" id="discount-end" name="END_DTM" >--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>


                                                <thead>
                                                <tr>
                                                    <th colspan="2">상품 이미지</th>
                                                </tr>
                                                </thead>
                                                <tr>
                                                    <td>
                                                        <label for="imgFile">대표 이미지</label>
                                                    </td>
                                                    <td>
                                                        <input type="file" id="imgFile" name="file">
                                                        <!-- 꼭 요구되는 사항 required -->
                                                    </td>
                                                </tr>

<%--                                                <tr>--%>
<%--                                                    <td>--%>
<%--                                                        <label for="detailImage">상세정보 이미지</label>--%>
<%--                                                    </td>--%>
<%--                                                    <td>--%>
<%--                                                        <input type="file" id="detailImage" name="PATH" >--%>
<%--                                                    </td>--%>
<%--                                                </tr>--%>


                        <%--                        <thead>--%>
                        <%--                        <tr>--%>
                        <%--                            <th colspan="2">해시태그</th>--%>
                        <%--                        </tr>--%>
                        <%--                        </thead>--%>
                        <%--                        <tr>--%>
                        <%--                            <td><label for="hashtag">해시태그</label></td>--%>
                        <%--                            <td colspan="3">--%>
                        <%--                                <input type="text" id="hashtag" name="HASHTAG_NM" placeholder="예: #스킨케어 #메이크업">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>
                    </table>
                    <div class="form-btnWrap" style="text-align: center;">
                        <button class="form-btn" type="submit" id="registerBtn">상품 등록</button>
                        <button class="form-btn" type="button" id="listBtn" >목록으로</button>
                    </div>
                </form>

                <script>
                    <%--$('#registerBtn').on("click",function (){--%>
                    <%--    let form =$('#productForm');--%>
                    <%--    form.attr("action","<c:url value='/admin/product/register'/>");--%>
                    <%--    form.attr("method","post");--%>
                    <%--    form.submit();--%>
                    <%--});--%>

                    // 할인 여부 라디오 버튼 클릭 이벤트 핸들러
                    $('input[name="DC_YN"]').on('click', function() {
                        // 할인 적용을 선택한 경우
                        if ($('#discount-use').is(':checked')) {
                            // 할인 관련 입력란 활성화
                            $('.discount-row').show();
                        } else {
                            // 할인 관련 입력란 비활성화
                            $('.discount-row').hide();
                        }
                    });





                    $('#listBtn').on("click",function (){
                        location.href="<c:url value='/admin/product/list'/>?page=${page}&pageSize=${pageSize}";
                    });



                    // $(document).ready(function () {
                    //     $("input[name='OPT_YN']").on("change", function () {
                    //
                    //         const option = $(".option-row");
                    //
                    //         if ($("#option-use").is(":checked")) {
                    //             option.show();
                    //         } else {
                    //             option.hide();
                    //         }
                    //     });
                    // });
                    //                     $(document).ready(function () {
                    //                         $("input[name='DC_YN']").on("change", function () {
                    //
                    //                             const discount = $(".discount-row");
                    //
                    //                             if ($("#discount-use").is(":checked")) {
                    //                                 discount.show();
                    //                             } else {
                    //                                 discount.hide();
                    //                             }
                    //                         });
                    //                         $(".discount-row").hide();
                    // // 이상하게 할인부분만 새로고침해도 안숨겨져있음 흠 이거 적용하면 숨겨짐
                    //                     });
                </script>
            </div>
        </div>
    </div>


    <div class="admin-footer">
        Copyright ⓒ 2023 됐나욧 All rights reserved.
    </div>



</div>
</body>
</html>
