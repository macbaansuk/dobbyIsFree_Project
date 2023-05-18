
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 페이지</title>

    <style>

    </style>

</head>
<link rel="stylesheet" href="/css/hoon/admin.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/hoon/jquery/jquery-ui.css">
<script src="/css/hoon/jquery/jquery-ui.min.js"></script>



<body>

<div class="admin">
    <jsp:include page="../admin_header.jsp"/>


    <div class="admin-bar">
        <jsp:include page="../admin_left.jsp"/>


        <div class="admin-container">
            <div class="admin-location">HOME &gt; 쇼핑몰관리 &gt; 주문관리 &gt; 주문목록</div>
            <div class="content">

                <h1>주문목록 관리</h1>
                <div class="mOption">
                    <table border="1" summary="">
                        <caption>주문 검색</caption>
                        <colgroup>
                            <col style="width:154px;">
                            <col style="width:auto;">
                            <col style="width:154px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
<%--                        <form action="<c:url value="/admin/list"/>" class="search-form" method="get">--%>
                        <tr>
                            <th scope="row">검색분류</th>
                            <td colspan="3">
                                <ul class="mForm typeVer" id="eSearchFormGeneral">
                                    <li>
                                        <select class="fSelect eSearch" name="option">
                                            <option value="T" ${ph.sc.option=='T' ? "selected" : ""} name="searchOption">주문번호</option>
                                            <option value="eng_product_name">회원번호</option>
                                            <option value="">--------------------</option>
                                            <option value="pm_memo">메모</option>
                                            <option value="ins_user">등록아이디</option>
                                        </select>
                                        <input type="text" class="search-input" style="width:500px;" value="${ph.sc.keyword}" name="keyword">
                                        <select data-placeholder="- 분류 선택 -" class="chzn-select-deselect eTrend  chzn-done" style="width:312px; display:none;" name="Trend[]" id="selPC1">
                                            <option value=""></option>
                                        </select><div id="selPC1_chzn" class="chzn-container chzn-container-single eSearchSelects" style="width: 312px; display: none;" title=""><a href="javascript:void(0)" class="chzn-single chzn-default" tabindex="-1"><span>- 분류 선택 -</span><div><b></b></div></a><div class="chzn-drop"><div class="chzn-search"><input type="text" autocomplete="off" style="display: none;"><input type="text" autocomplete="off"></div><ul class="chzn-results" style=""></ul></div></div>
                                        <select data-placeholder="- 분류 선택 -" class="chzn-select-deselect eBrand  chzn-done" style="width:312px; display:none;" name="Brand[]" id="selW23">
                                            <option value=""></option>
                                        </select><div id="selW23_chzn" class="chzn-container chzn-container-single eSearchSelects" style="width: 312px; display: none;" title=""><a href="javascript:void(0)" class="chzn-single chzn-default" tabindex="-1"><span>- 분류 선택 -</span><div><b></b></div></a><div class="chzn-drop"><div class="chzn-search"><input type="text" autocomplete="off" style="display: none;"><input type="text" autocomplete="off"></div><ul class="chzn-results" style=""></ul></div></div>
                                        <select data-placeholder="- 분류 선택 -" class="chzn-select-deselect eSupplier  chzn-done" style="width:312px; display:none;" name="Supplier[]" id="selJIY">
                                            <option value=""></option>
                                        </select><div id="selJIY_chzn" class="chzn-container chzn-container-single eSearchSelects" style="width: 312px; display: none;" title=""><a href="javascript:void(0)" class="chzn-single chzn-default" tabindex="-1"><span>- 분류 선택 -</span><div><b></b></div></a><div class="chzn-drop"><div class="chzn-search"><input type="text" autocomplete="off" style="display: none;"><input type="text" autocomplete="off"></div><ul class="chzn-results" style=""></ul></div></div>
                                        <select data-placeholder="- 분류 선택 -" class="chzn-select-deselect eManufacturer  chzn-done" style="width:312px; display:none;" name="Manufacturer[]" id="selRDV">
                                            <option value=""></option>
                                        </select><div id="selRDV_chzn" class="chzn-container chzn-container-single eSearchSelects" style="width: 312px; display: none;" title=""><a href="javascript:void(0)" class="chzn-single chzn-default" tabindex="-1"><span>- 분류 선택 -</span><div><b></b></div></a><div class="chzn-drop"><div class="chzn-search"><input type="text" autocomplete="off" style="display: none;"><input type="text" autocomplete="off"></div><ul class="chzn-results" style=""></ul></div></div>
                                        <select data-placeholder="- 분류 선택 -" class="chzn-select-deselect eClassification  chzn-done" style="width:312px; display:none;" name="Classification[]" id="selMK1">
                                            <option value=""></option>
                                        </select><div id="selMK1_chzn" class="chzn-container chzn-container-single eSearchSelects" style="width: 312px; display: none;" title=""><a href="javascript:void(0)" class="chzn-single chzn-default" tabindex="-1"><span>- 분류 선택 -</span><div><b></b></div></a><div class="chzn-drop"><div class="chzn-search"><input type="text" autocomplete="off" style="display: none;"><input type="text" autocomplete="off"></div><ul class="chzn-results" style=""></ul></div></div>

                                        <span class="eSearchSelects eSearchOrigin" id="origin_level3_0" name="origin_level3[]" style="display:none;">
                                                <select class="fSelect eSearchOrigin" id="origin_levelT3_0" name="origin_place_no[]">
                                                    <option></option>
                                                </select>
                                            </span>
                                        <span class="eSearchSelects eSearchOrigin" id="origin_levelE_0" name="origin_levelE[]" style="display:none;">
                                                <input type="text" class="fText eSearchOrigin" style="width:200px;" name="made_in[]" value="" id="eMadeIn_0">
                                            </span>

<%--                                        <a href="#none" class="btnIcon icoMinus" search-type="general"><span>삭제</span></a>--%>
<%--                                        <a href="#none" class="btnIcon icoPlus" search-type="general" style="display: inline-block;"><span>추가</span></a>--%>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">주문 분류</th>
                            <td colspan="3">
                                <div class="gSingle">
                                    <select class="fSelect category eCategory" id="eCategory1" depth="1" name="category"> <option value="">- 대분류 선택 -</option> <option value="1" ${ph.sc.option=='1' ? "selected" : ""} >(대분류) 입금대기</option> <option value="2" ${ph.sc.option=='2' ? "selected" : ""} >(대분류) 결제완료</option> <option value="3"${ph.sc.option=='3' ? "selected" : ""} >(대분류) 상품준비중</option> <option value="4"${ph.sc.option=='4' ? "selected" : ""} >(대분류) 배송중</option> <option value="4"${ph.sc.option=='4' ? "selected" : ""} >(대분류) 배송완료</option><option value="4"${ph.sc.option=='4' ? "selected" : ""} >(대분류) 구매확정</option> </select> <select class="fSelect category eCategory" id="eCategory2" depth="2" name="categorys[]"> <option value="">- 중분류 선택(미구현) -</option> <option value="34">(중분류) Skirts</option><option value="35">(중분류) Pants</option></select> <select class="fSelect category eCategory" id="eCategory3" depth="3" name="categorys[]"> <option value="">- 소분류 선택 (미구현) -</option> </select> <select class="fSelect category eCategory" id="eCategory4" depth="4" name="categorys[]"> <option value="">- 상세분류 선택 (미구현) -</option> </select> <input type="hidden" name="category" id="eHiddenCategory" value="27">                    <span class="gBreak">
<%--                                            <label class=""><input type="checkbox" class="fChk category_sort" name="sub_cate" value="T"> 하위분류 포함검색</label>--%>
<%--                                            <label class=""><input type="checkbox" class="fChk category_sort" name="notincategory" value="T"> 분류 미등록상품 검색</label>--%>
                                        </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">주문 등록일</th>
                            <td colspan="3">
                                <select class="fSelect category" name="date">
                                    <option value="" ${ph.sc.dateField=='' ? "selected" : ""}>-등록일 선택-</option>
                                    <option value="regist" ${ph.sc.dateField=='regist' ? "selected" : ""}>주문등록일</option>
                                    <option value="modify" ${ph.sc.dateField=='modify' ? "selected" : ""}>주문최종수정일</option>
                                </select>
                                <a href="javascript:void(0)" class="btnDate" period="0"><span>오늘</span></a>
                                <a href="javascript:void(0)" class="btnDate" period="3"><span>3일</span></a>
                                <a href="javascript:void(0)" class="btnDate" period="7"><span>7일</span></a>
                                <a href="javascript:void(0)" class="btnDate" period="30"><span>1개월</span></a>
                                <a href="javascript:void(0)" class="btnDate" period="90"><span>3개월</span></a>
                                <a href="javascript:void(0)" class="btnDate" period="365"><span>1년</span></a>
                                <a href="javascript:void(0)" class="btnDate" period="-1"><span>전체</span></a>
                                <input type="text" id="pr_start_date" name="start_date" class="fText gDate" value="">
                                <a href="javascript:void(0)" id="start_date" class="btnIcon icoCal"><span>달력보기</span></a>
                                ~
                                <input type="text" id="pr_end_date" name="end_date" class="fText gDate" value="">
                                <a href="javascript:void(0)" id="end_date" class="btnIcon icoCal"><span>달력보기</span></a>
                                <input type="hidden" name="date_type" value="9999">
                            </td>
                        </tr>
<%--                        <tr>--%>
<%--                            <th scope="row">진열상태 (미구현)</th>--%>
<%--                            <td>--%>
<%--                                <label class="gSingleLabel eSelected"><input type="radio" class="fChk eDisplayStatus" name="display" value="A" checked="&quot;checked&quot;"> 전체</label>--%>
<%--                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="display" value="T"> 진열함</label>--%>
<%--                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="display" value="F"> 진열안함</label>--%>
<%--                            </td>--%>
<%--                            <th scope="row">판매상태 (미구현)</th>--%>
<%--                            <td>--%>
<%--                                <label class="gSingleLabel eSelected"><input type="radio" class="fChk eDisplayStatus" name="selling" value="A" checked="&quot;checked&quot;"> 전체</label>--%>
<%--                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="selling" value="T"> 판매함</label>--%>
<%--                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="selling" value="F"> 판매안함</label>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                        </tbody>
                    </table>
                </div>
                <div class="mButton">
                    <a href="javascript:void(0)" class="btnSearch" id="eBtnSearch"><span >검색</span></a>
                    <a href="javascript:void(0)" class="btnSearch reset" id="eSearchFormInit"><span>초기화</span></a>
                </div>
                </form>


                <h2>주문 목록</h2>
                <div class="section">
                    <div class="mState">
                        <div class="gLeft">
                            <p class="total">[ 총 <strong>1</strong>개]</p>
                        </div>
                        <div class="gRight">
                            <select class="fSelect" name="orderby">
                                <option value="id_d" ${ph.sc.sortType=='id_d' ? "selected" : ""}>주문번호 역순</option>
                                <option value="id_a" ${ph.sc.sortType=='id_a' ? "selected" : ""}>주문번호 순</option>
                                <option>---------------</option>
                                <option value="regist_d" ${ph.sc.sortType=='regist_d' ? "selected" : ""}>등록일 역순</option>
                                <option value="regist_a" ${ph.sc.sortType=='regist_a' ? "selected" : ""}>등록일 순</option>
                                <option>---------------</option>
                                <option value="modify_d" ${ph.sc.sortType=='modify_d' ? "selected" : ""}>수정일 역순</option>
                                <option value="modify_a" ${ph.sc.sortType=='modify_a' ? "selected" : ""}>수정일 순</option>

                            </select>
                            <select class="fSelect" name="limit">
                                <option value="10" selected="selected">10개씩보기</option>
                                <option value="20" >20개씩보기</option>
                                <option value="30">30개씩보기</option>
                                <option value="50">50개씩보기</option>
                                <option value="100">100개씩보기</option>
                            </select>
                        </div>
                    </div>
                    <div class="mBoard gCell gScroll">
                        <table border="1" summary="" class="eChkTr" id="listTable">
                            <caption>주문목록</caption>
                            <colgroup>
                                <col style="width:50px">
                                <col style="width:120px">
                                <col style="width:75px">
                                <col style="width:160px">

                                <col style="width:70px">
                                <col style="width:70px">
                                <col style="width:65px">
                                <col style="width:140px">
                                <col style="width:110px">
<%--                                <col style="width:82px">--%>
                            </colgroup>
                            <thead>

                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">주문일자</th>
                                <th scope="col">주문번호</th>
                                <th scope="col">대표제품 명</th>

                                <th scope="col">결제금액</th>
                                <th scope="col">처리현황</th>
                                <th scope="col">배송현황</th>
                                <th scope="col">주문취소</th>
                                <th scope="col">수정</th>

                            </tr>


                            </thead>

                            <tbody class="center" id="eStockManageTable">

                            <tr>




                                <tr class="test">
                               <!--상품 리스트 -->
                                <form id="form" class="frm" action="/admin/modify" method="post">
                                    <td rowspan="1" id="prod-id1" data-prod-id="{{inv.prod_ID}}">1
                                        <%--                                        <input type="checkbox" id="pd-check" data-prod-id="{{inv.prod_ID}}">--%>
                                    </td>

                                    <td rowspan="1" class="left">
                                        <div class="gGoods gMedium" style="z-index: 0;">
                                            <%--                                            <div class="mOpen">--%>
                                            <%--                                                <span class="frame eOpenOver" find="gGoods"><img src="../../img/hoon/44x44.gif" width="44" height="44" alt=""></span>--%>
                                            <%--                                            </div>--%>
                                            <p>
                                                <a href="#" onclick="openNewWindow();">2023.05.18</a>
                                            </p>
                                            <!-- <p class="txtCode">(P000000J)</p>
                                            <input type="hidden" name="product_no_list[]" value="10"> -->
                                        </div>
                                    </td>
                                    <td rowspan="1" id="total-qty-{{inv.prod_ID}}" data-prod-id="{{inv.prod_ID}}">20230518504666</td>

                                    <td rowspan="1" id="total-qty-{{inv.prod_ID1}}" data-prod-id="{{inv.prod_ID}}"><a href="#" onclick="openNewWindow()" >더마 그린티 프로바이오틱스 크림 외 1건</a></td>
                                    <td>44,000원
                                        <input type="hidden" class="cate-cd" name="cate-cd" value="P000000J000A">
                                    </td>
                                    <td rowspan="1" id="total-qty-{{inv.prod_ID2}}" data-prod-id="{{inv.prod_ID}}">상품준비중</td>
                                    <td rowspan="1" id="total-qty-{{inv.prod_ID3}}" data-prod-id="{{inv.prod_ID}}"></td>
                                    <td rowspan="1" id="total-qty-{{inv.prod_ID4}}" data-prod-id="{{inv.prod_ID}}"> </td>
                                    <td rowspan="1" id="total-qty-{{inv.prod_ID5}}" data-prod-id="{{inv.prod_ID}}"></td>
                                </tr>
<%--                            <td rowspan="1" id="prod-id" data-prod-id="{{inv.prod_ID}}">1--%>
<%--                                &lt;%&ndash;                                        <input type="checkbox" id="pd-check" data-prod-id="{{inv.prod_ID}}">&ndash;%&gt;--%>
<%--                            </td>--%>

<%--                            <td rowspan="1" class="left">--%>
<%--                                <div class="gGoods gMedium" style="z-index: 0;">--%>
<%--                                    &lt;%&ndash;                                            <div class="mOpen">&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                                <span class="frame eOpenOver" find="gGoods"><img src="../../img/hoon/44x44.gif" width="44" height="44" alt=""></span>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--                                    <p>--%>
<%--                                        <a href="#" onclick="openNewWindow2();">2023.05.15</a>--%>
<%--                                    </p>--%>
<%--                                    <!-- <p class="txtCode">(P000000J)</p>--%>
<%--                                    <input type="hidden" name="product_no_list[]" value="10"> -->--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                            <td rowspan="1" id="total-qty-{1}" data-prod-id="{{inv.prod_ID}}">20230515163372</td>--%>

<%--                            <td rowspan="1" id="total-qty-{2}" data-prod-id="{{inv.prod_ID}}"><a href="#" onclick="openNewWindow2()" >납작 아이브로우 펜슬</a></td>--%>
<%--                            <td>9,000원--%>
<%--                                <input type="hidden" class="cate-cd" name="cate-cd" value="P000000J000A">--%>
<%--                            </td>--%>
<%--                            <td rowspan="1" id="total-qty-{3}" data-prod-id="{{inv.prod_ID}}">상품준비중</td>--%>
<%--                            <td rowspan="1" id="total-qty-{4}" data-prod-id="{{inv.prod_ID}}">운송장 입력</td>--%>
<%--                            <td rowspan="1" id="total-qty-{5}" data-prod-id="{{inv.prod_ID}}"> </td>--%>
<%--                            <td rowspan="1" id="total-qty-{6}" data-prod-id="{{inv.prod_ID}}"></td>--%>
<%--                            </tr>--%>
                                </form>
                            </tbody>

                        </table>
                    </div>
                </div>
<%--                <div class="mButton">--%>
<%--                    <a href="javascript:void(0)" class="btnModify" id="eBtnModify"><span >저장</span></a>--%>
<%--                </div>--%>

                <br>
                <div class="paging-container">
                    <div class="paging">
                        <c:if test="${ph.totalCnt==null || ph.totalCnt==0}">
<%--                            <div> 게시물이 없습니다. </div>--%>
                            <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value=""/>">1</a>
                        </c:if>
                        <c:if test="${ph.totalCnt!=null && ph.totalCnt!=0}">
                            <c:if test="${ph.showPrev}">
                                <a class="page" href="<c:url value="/admin/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                            </c:if>
                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/admin/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                            </c:forEach>
                            <c:if test="${ph.showNext}">
                                <a class="page" href="<c:url value="/admin/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                            </c:if>
                        </c:if>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>



<jsp:include page="../admin_footer.jsp"/>


<script>
    function openNewWindow() {
        window.open('/admin/order/list', 'newwindow', 'width=800,height=600');
    }
    function openNewWindow2() {
        window.open('/admin/order/list2', 'newwindow', 'width=800,height=600');
    }
</script>

            <script >
                let msg = "${msg}";
                if (msg=="login_ERR") alert("관리자 아이디로 로그인 해주세요.")
            </script>

</body>
</html>