<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 페이지</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../../css/sun/admin-product.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<body>

<div class="admin">
    <div class="Header">
        <a href="/admin/main">
            <span class="span1">관리자 </span>
            <span class="span2">매뉴얼</span>
        </a>
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

                <%--                <form id="productForm">--%>
                <form id="productForm" action="<c:url value='/admin/product/modify'/>" enctype="multipart/form-data" method="POST">

                    <table class="product-table">
                        <%--                        <input type="hidden" name="prod_id" value="${read.prod_id}">--%>
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
                                <select id="product-status" name="PROD_STUS" >
                                    <option value="판매대기" ${read.PROD_STUS == '판매대기' ? 'selected' : ''}>판매대기</option>
                                    <option value="판매" ${read.PROD_STUS == '판매' ? 'selected' : ''}>판매</option>
                                    <option value="판매안함" ${read.PROD_STUS== '판매안함' ? 'selected' : ''}>판매안함</option>
                                </select>



                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label for="category">카테고리</label>
                            </td>
                            <td>
                                <select id="category" name="CATE_CD" >
                                    <option value=1 ${read.CATE_CD == 1 ? 'selected' : ''}>스킨케어</option>
                                    <option value=2 ${read.CATE_CD == 2 ? 'selected' : ''}>메이크업</option>
                                    <option value=3 ${read.CATE_CD == 3 ? 'selected' : ''}>남성</option>
                                    <option value=4 ${read.CATE_CD == 4 ? 'selected' : ''}>헤어/바디</option>
                                </select>


                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="product-name">상품명</label>
                            </td>
                            <td>
                                <input type="text" id="product-name" name="PROD_NM" value="${read.PROD_NM}" ${mode=="read"?'readonly="readonly"': mode=="register"?'required':''}>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="product-description">상품 설명</label>
                            </td>
                            <td>
                                <textarea id="product-description" name="PROD_DESC" ${mode=="read"?'readonly="readonly"': mode=="register"?'required':''}>${read.PROD_DESC}</textarea>
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
                                <input type="radio" id="new-use" name="NEW_YN" value="Y" ${ read.NEW_YN == 'Y' ? 'checked' :'' } >
                                <label for="new-use">사용</label>
                                <input type="radio" id="new-not-use" name="NEW_YN" value="N" ${ read.NEW_YN == 'N' ? 'checked' :'' } >
                                <label for="new-not-use">사용 안함</label>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>메인진열 여부</label>
                            </td>
                            <td>
                                <input type="radio" id="main-use" name="MAI_YN" value="Y" ${read.MAI_YN == 'Y' ? 'checked' :'' }>
                                <label for="main-use">사용</label>
                                <input type="radio" id="main-not-use" name="MAI_YN" value="N" ${read.MAI_YN == 'Y' ? 'checked' :'' }>
                                <label for="main-not-use">사용 안함</label>
                            </td>
                        </tr>


                        <%--                        <tr>--%>
                        <%--                            <td>--%>
                        <%--                                <label>옵션 사용</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="radio" id="option-use"  name="option-availability" value="use" ${read.OPT_YN=='Y' ? 'checked' : ''} >--%>
                        <%--                                <label for="option-use">사용</label>--%>
                        <%--                                <input type="radio" id="option-not-use" name="option-availability" value="not-use" ${read.OPT_YN =='N' ? 'checked' : ''} >--%>
                        <%--                                <label for="option-not-use">사용 안함</label>--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>


                        <%--                        <tr class="option-row" style="display: none;">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="option-name">옵션명</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="text" id="option-name" name="option-name"  value="${read.OPT_NM}" ${mode=="read"?'readonly="readonly"': mode=="register"?'required':''}>--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>
                        <%--                        <tr class="option-row" style="display: none;">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="option-value">옵션값</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td colspan="3">--%>
                        <%--                                <input type="text" id="option-value" name="option-value" value="${read.OPT_VAL}" ${mode=="read"?'readonly="readonly"': mode=="register"?'required':''}>--%>
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
                                <input type="number" id="price" name="AMT" value="${read.AMT}" ${mode=="read"?'readonly="readonly"': mode=="register"?'required':''}>
                            </td>
                        </tr>
                        <%--                        <tr>--%>
                        <%--                            <td>--%>
                        <%--                                <label>할인 여부</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="radio" id="discount-use" name="discount-availability" value="use" ${read.DC_YN=='Y' ? 'checked' : ''} >--%>
                        <%--                                <label for="discount-use">할인 적용</label>--%>
                        <%--                                <input type="radio" id="discount-not-use" name="discount-availability" value="not-use" ${read.DC_YN=='N' ? 'checked' : ''} >--%>
                        <%--                                <label for="discount-not-use">할인 적용 안함</label>--%>

                        <%--                            </td>--%>
                        <%--                        </tr>--%>
                        <%--                        <tr class="discount-row">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="discount-rate">할인율</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="number" id="discount-rate" name="discount-rate" value="${read.DC_RATE}">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>

                        <%--                        <tr class="discount-row">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="discount-amount">할인 금액</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <input type="number" id="discount-amount" name="discount-amount" value="${read.DC_AMT}" >--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>
                        <%--                        <tr class="discount-row">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="discount-start">할인 시작일</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td colspan="3">--%>
                        <%--                                <input type="date" autocomplete="off" id="discount-start" name="discount-period" value="${read.BGN_DTM}">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>
                        <%--                        <tr class="discount-row">--%>
                        <%--                            <td>--%>
                        <%--                                <label for="discount-end">할인 종료일</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td colspan="3">--%>
                        <%--                                <input type="date" autocomplete="off" id="discount-end" name="discount-period" value="${read.END_DTM}" >--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>



                                                <thead>
                                                <tr>
                                                    <th colspan="2">상품 이미지</th>
                                                </tr>
                                                </thead>
                                                <tr>
                                                    <td>
                                                        <label>대표 이미지</label>
                                                    </td>
                                                    <td>


                                                        <img id="main-image-preview" src="<c:url value='/img/sun/product-image/${read.REP_IMG}'/>" alt="${read.PROD_NM}이미지">
                                                        <button type="button" id="main-image-change-button">이미지 수정</button>
                                                        <input type="file" id="main-image-input" name="file" style="display: none;">
                                                        <input type="hidden" name="oldFilePath" value="<c:url value='/img/sun/product-image/${read.REP_IMG}'/>">



                                                    <%--                                                        <input type="file" id="main-image-input" name="file">--%>
<%--                                                        <button type="button" id="main-image-change-button">Change Image</button>--%>
<%--                                                        <input type="hidden" name="oldFilePath" value="<c:url value='/img/sun/product-image/${read.REP_IMG}'/>">--%>




<%--                                                        <input type="file" id="main-image-input" name="file" style="display: none;">--%>
<%--                                                        <input type="file" id="main-image-input" name="file" >--%>
<%--                                                        <button type="button" id="main-image-change-button">Change Image</button>--%>
<%--                                                        <input type="hidden" name="oldFilePath" value="<c:url value='/img/sun/product-image/${read.REP_IMG}'/>">--%>
                                                    </td>




                                                </tr>

                        <%--                        <tr>--%>
                        <%--                            <td>--%>
                        <%--                                <label>상세정보 이미지</label>--%>
                        <%--                            </td>--%>
                        <%--                            <td>--%>
                        <%--                                <img id="detail-image-preview" src="${read.PATH}" alt="${read.PROD_NM}상세이미지">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>


                        <%--                        <thead>--%>
                        <%--                        <tr>--%>
                        <%--                            <th colspan="2">해시태그</th>--%>
                        <%--                        </tr>--%>
                        <%--                        </thead>--%>
                        <%--                        <tr>--%>
                        <%--                            <td><label for="hashtag">해시태그</label></td>--%>
                        <%--                            <td colspan="3">--%>
                        <%--                                <input type="text" id="hashtag" name="hashtag" placeholder="예: #스킨케어 #메이크업" value="${read.HASHTAG_NM}">--%>
                        <%--                            </td>--%>
                        <%--                        </tr>--%>
                    </table>
                    <div class="form-btnWrap" style="text-align: center;">
                        <%--                        <button class="form-btn" type="submit" id="registerBtn">등록하기</button>--%>

                        <button class="form-btn" type="submit" id="modifyBtn">수정하기</button>
                        <%--                        <button class="form-btn" type="button" id="previewBtn">미리보기</button>--%>
                        <button class="form-btn" type="button" id="listBtn" >목록으로</button>
                    </div>
                </form>



                <script>

                    $('#listBtn').on("click",function (){
                        location.href="<c:url value='/admin/product/list'/>?page=${page}&pageSize=${pageSize}";
                    });

                    $('#modifyBtn').on("click",function (event){
                        event.preventDefault();  // 이벤트의 기본 동작을 중지

                        // "수정하기" 버튼을 누르면 mode를 'modify'로 변경
                        mode = 'modify';

                        // 모든 입력 필드를 수정 가능하게 만듦
                        $('input, select, textarea').prop('readonly', false);
                        $('input[type="checkbox"], input[type="radio"]').off('click');
                        $('select').off('mousedown');

                        // 옵션 사용, 할인 여부에 따른 행 표시 이벤트 핸들러를 추가
                        $('input[name="OPT_YN"]').on("change", function () {
                            const option = $(".option-row");
                            if ($("#option-use").is(":checked")) {
                                option.show();
                            } else {
                                option.hide();
                            }
                        });

                        $('input[name="DC_YN"]').on("change", function () {
                            const discount = $(".discount-row");
                            if ($("#discount-use").is(":checked")) {
                                discount.show();
                            } else {
                                discount.hide();
                            }
                        });

                        // 초기 상태 설정
                        if ($("#option-use").is(":checked")) {
                            $(".option-row").show();
                        } else {
                            $(".option-row").hide();
                        }

                        if ($("#discount-use").is(":checked")) {
                            $(".discount-row").show();
                        } else {
                            $(".discount-row").hide();
                        }


                        // "수정하기" 버튼의 텍스트를 "수정완료"로 변경
                        $(this).text("수정완료");



                        $('#main-image-change-button').on('click', function() {
                            $('#main-image-input').click();
                        });

                        $('#main-image-input').on('change', function() {
                            var reader = new FileReader();
                            reader.onload = function(e) {
                                $('#main-image-preview').attr('src', e.target.result);
                            };
                            reader.readAsDataURL(this.files[0]);
                        });



                        // "수정완료" 버튼 클릭 시, form을 제출하도록 이벤트 핸들러 변경
                        $(this).off('click').on('click', function() {

                            let form = $("#productForm");
                            form.attr("action", "<c:url value='/admin/product/modify'/>");
                            form.attr("enctype", "multipart/form-data");
                            form.attr("method", "post");
                            form.submit();
                        });
                    });




                    <%--$('#previewBtn').on("click",function (){--%>
                    <%--    location.href="<c:url value='/admin/product/read/${id}'/>";--%>
                    <%--});--%>


                    <%--$(document).ready(function() {--%>
                    <%--    var mode = '${mode}';--%>

                    <%--    if (mode === 'read') {--%>
                    <%--        $('input[type="checkbox"], input[type="radio"]').on('click', function(event) {--%>
                    <%--            event.preventDefault();--%>
                    <%--        });--%>

                    <%--        $('select').on('mousedown', function(event) {--%>
                    <%--            event.preventDefault();--%>
                    <%--        });--%>
                    <%--    }--%>

                    <%--    if (mode === 'register') {--%>
                    <%--        $("input[name='option-availability']").on("change", function () {--%>
                    <%--            const option = $(".option-row");--%>
                    <%--            if ($("#option-use").is(":checked")) {--%>
                    <%--                option.show();--%>
                    <%--            } else {--%>
                    <%--                option.hide();--%>
                    <%--            }--%>
                    <%--        });--%>

                    <%--        $("input[name='discount-availability']").on("change", function () {--%>
                    <%--            const discount = $(".discount-row");--%>
                    <%--            if ($("#discount-use").is(":checked")) {--%>
                    <%--                discount.show();--%>
                    <%--            } else {--%>
                    <%--                discount.hide();--%>
                    <%--            }--%>
                    <%--        });--%>

                    <%--        // 초기 상태--%>
                    <%--        if ($("#discount-use").is(":checked")) {--%>
                    <%--            $(".discount-row").show();--%>
                    <%--        } else {--%>
                    <%--            $(".discount-row").hide();--%>
                    <%--        }--%>
                    <%--    }--%>
                    <%--});--%>









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
