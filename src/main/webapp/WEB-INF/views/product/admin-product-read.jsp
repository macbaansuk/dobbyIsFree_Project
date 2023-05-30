<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 페이지</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../../css/product/admin-product.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
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

    <form id="productForm" action="<c:url value='/admin/product/modify'/>" enctype="multipart/form-data" method="POST">
<%--                <form id="productForm">--%>
                    <input type="hidden" name="PROD_ID" value="${totalDto.PROD_ID}">
                    <input type="hidden" id="page" name="page" value="${page}">
                    <input type="hidden" id="pageSize" name="pageSize" value="${pageSize}">

                    <table class="product-table">
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
                                    <option value="판매대기" ${totalDto.PROD_STUS == '판매대기' ? 'selected' : ''}>판매대기</option>
                                    <option value="판매" ${totalDto.PROD_STUS == '판매' ? 'selected' : ''}>판매</option>
                                    <option value="판매안함" ${totalDto.PROD_STUS== '판매안함' ? 'selected' : ''}>판매안함</option>
                                </select>


                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label for="category">카테고리</label>
                            </td>
                            <td>
                                <select id="category" name="CATE_CD">
                                    <option value=1 ${totalDto.CATE_CD == 1 ? 'selected' : ''}>스킨케어</option>
                                    <option value=2 ${totalDto.CATE_CD == 2 ? 'selected' : ''}>메이크업</option>
                                    <option value=3 ${totalDto.CATE_CD == 3 ? 'selected' : ''}>남성</option>
                                    <option value=4 ${totalDto.CATE_CD == 4 ? 'selected' : ''}>헤어/바디</option>
                                </select>


                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="product-name">상품명</label>
                            </td>
                            <td>
                                <input type="text" id="product-name" name="PROD_NM"
                                       value="${totalDto.PROD_NM}" ${mode=="readonly"?'readonly="readonly"': ''}>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="product-description">상품 설명</label>
                            </td>
                            <td>
                                <textarea id="product-description"
                                          name="PROD_DESC" ${mode=="readonly"?'readonly="readonly"': ''}>${totalDto.PROD_DESC}</textarea>
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
                                <input type="radio" id="new-use" name="NEW_YN"
                                       value="Y" ${ totalDto.NEW_YN == 'Y' ? 'checked' :'' } >
                                <label for="new-use">사용</label>
                                <input type="radio" id="new-not-use" name="NEW_YN"
                                       value="N" ${ totalDto.NEW_YN == 'N' ? 'checked' :'' } >
                                <label for="new-not-use">사용 안함</label>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>메인진열 여부</label>
                            </td>
                            <td>
                                <input type="radio" id="main-use" name="MAI_YN"
                                       value="Y" ${totalDto.MAI_YN == 'Y' ? 'checked' :'' }>
                                <label for="main-use">사용</label>
                                <input type="radio" id="main-not-use" name="MAI_YN"
                                       value="N" ${totalDto.MAI_YN== 'N' ? 'checked' :'' }>
                                <label for="main-not-use">사용 안함</label>
                            </td>
                        </tr>



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
                                <input type="number" id="price" name="AMT"
                                       value="${totalDto.AMT}" ${mode=="readonly"?'readonly="readonly"': ''}>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>할인 여부</label>
                            </td>
                            <td>
                                <input type="radio" id="discount-use" name="DC_YN"
                                       value="Y" ${totalDto.DC_YN=='Y' ? 'checked' : ''} >
                                <label for="discount-use">할인 적용</label>
                                <input type="radio" id="discount-not-use" name="DC_YN"
                                       value="N" ${totalDto.DC_YN=='N' ? 'checked' : ''} >
                                <label for="discount-not-use">할인 적용 안함</label>
                            </td>


                        </tr>
                        <tr class="discount-row">
                            <td>
                                <label for="discount-rate">할인율</label>
                            </td>
                            <td>
                                <input type="number" id="discount-rate" name="DC_RATE" value="${totalDto.DC_RATE}">
                            </td>
                        </tr>



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
                                <img id="main-image-preview"  src="<c:url value='${totalDto.REP_IMG}'/>"
                                     alt="${totalDto.PROD_NM}이미지">
<%--                                <button type="button" id="main-image-change-button" >이미지 수정</button>--%>
                                <input type="file" id="main-image-input" name="file" >
                                <input type="hidden" name="oldFilePath" value="<c:url value='${totalDto.REP_IMG}'/>">
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label>상세정보 이미지</label>
                            </td>
<%--                            style="display: none;"--%>
                            <td>
                                <img id="detail-image-preview" class="detail-image-preview" src="${totalDto.FILE_PATH}"
                                     alt="${totalDto.PROD_NM}상세이미지">
<%--                                <button type="button" id="detail-image-change-button">이미지 수정</button>--%>
                                <input type="file" id="detail-image-input" name="detailFile" >
                                <input type="hidden" name="oldDetailFilePath"
                                       value="<c:url value='${totalDto.FILE_PATH}'/>">
                            </td>
                        </tr>


                    </table>
                    <div class="form-btnWrap" style="text-align: center;">

                        <c:if test="${mode=='readonly'}">
                            <button class="form-btn" type="button" id="before-modifyBtn">수정하기</button>
                        </c:if>
                            <c:if test="${mode=='modify'}">
                            <button class="form-btn" type="button" id="modifyBtn">수정완료</button>
                        </c:if>

                        <button class="form-btn" type="button" id="previewBtn"><a href="/product/productDetail/${totalDto.PROD_ID}"> 미리보기</a></button>
                        <button class="form-btn" type="button" id="listBtn">목록으로</button>
                    </div>
                </form>


                <script>
                    $('#listBtn').on("click",function (){
                        location.href="<c:url value='/admin/product/list'/>?page=${page}&pageSize=${pageSize}";
                    });

                    $(document).ready(function () {
                        var mode = '${mode}'; // 초기 모드 설정

                        if (mode === 'readonly') {
                            $('select').on('mousedown', false);
                            $('input, select, textarea').prop('readonly', true);
                            $('input[type="checkbox"], input[type="radio"],input[type="file"]').on('click', false);

                            if ($("#discount-use").is(":checked")) {
                                $(".discount-row").show();
                            } else {
                                $(".discount-row").hide();
                            }
                        }
                        // 초기 상태 설정


                        $('#before-modifyBtn').on("click", function (event) {
                            event.preventDefault(); // 이벤트의 기본 동작을 중지

                            mode = 'modify'; // 모드 변경

                            location.href="<c:url value='/admin/product/modify'/>?id=${totalDto.PROD_ID}&page=${page}&pageSize=${pageSize}";



                            // 모든 입력 필드를 수정 가능하게 만듦
                            $('input, select, textarea').prop('readonly', false);
                            $('input[type="checkbox"], input[type="radio"],input[type="file"]').off('click');
                            $('select').off('mousedown');


                            $("#discount-use").on("click", function () {
                                const discount = $(".discount-row");
                                if ($("#discount-use").is(":checked")) {
                                    discount.show();
                                } else {
                                    discount.hide();
                                }
                            });

                            // "수정하기" 버튼의 텍스트를 "수정완료"로 변경
                            $(this).hide();
                            $('#modifyBtn').show();
                        });

                        $('#main-image-change-button').on('click', function () {
                            $('#main-image-input').click();
                        });

                        $('#main-image-input').on('change', function () {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('#main-image-preview').attr('src', e.target.result);
                            };
                            reader.readAsDataURL(this.files[0]);
                        });

                        $('#detail-image-change-button').on('click', function () {
                            $('#detail-image-input').click();
                        });

                        $('#detail-image-input').on('change', function () {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('#detail-image-preview').attr('src', e.target.result);
                            };
                            reader.readAsDataURL(this.files[0]);
                        });

                        $('#modifyBtn').on("click", function (event) {
                            let form = $("#productForm");
                            let page = $("#page").val(); // 수정 후에 해당되는 페이지, val() => 해당 요소의 값을 가져오거나 설정하는 메서드
                            let pageSize = $("#pageSize").val(); // 페이지 크기
                            form.attr("action", "<c:url value='/admin/product/modify'/>");
                            form.attr("enctype", "multipart/form-data");
                            form.attr("method", "post");
                            form.append('<input type="hidden" name="page" value="' + page + '">'); // 페이지 전달
                            form.append('<input type="hidden" name="pageSize" value="' + pageSize + '">'); // 페이지 크기 전달
                            form.submit();
                            alert("상품이 수정되었습니다.");
                        });
                    });


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
