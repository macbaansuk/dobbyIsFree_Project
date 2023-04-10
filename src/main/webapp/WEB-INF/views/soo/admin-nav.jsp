
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 페이지</title>
</head>

<link rel="stylesheet" href="/css/soo/admin-nav.css"/>
<body>



<div class="admin">
    <div class="Header">
        <span class="span1">관리자 </span>
        <span class="span2">매뉴얼</span>
        <ul class="navi">
            <li>
                <a href="#">
                    <span class="menuWrap">쇼핑몰 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">회원 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">게시판 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">접속 통계<button type="button" class="bar"></button></span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuWrap">배너 관리<button type="button" class="bar"></button></span>
                </a>
            </li>
        </ul>
    </div>


    <div class="admin-bar">
        <div class="admin-left">
            <h2>쇼핑몰관리</h2>
            <ul  class="admin-ul">
                <li class="on"><a href="#" onfocus="this.blur();">운영정보설정</a></li>
                <li class="on"><a href="#" onfocus="this.blur();">상품관리</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품목록</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품분류</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">브랜드관리</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">옵션항목</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">재고관리</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품평관리</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품문의관리</a></li>
                    </ul>
                </li>
                <li class="on"><a href="#" onfocus="this.blur();">주문관리</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">주문목록</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">개별취소요청</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">세금계산서</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">현금영수증</a></li>
                    </ul>
                </li>
                <li class="on"><a href="#" onfocus="this.blur();">통계분석</a>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">매출통계분석</a></li>
                    </ul>
                    <ul>
                        <li><a href="#" onfocus="this.blur();">상품통계분석</a></li>
                    </ul>
                </li>
                <li class="on"><a href="#" onfocus="this.blur();">쿠폰관리</a></li>
                <li class="on"><a href="#" onfocus="this.blur();">적립금관리</a></li>
                <li class="on"><a href="#" onfocus="this.blur();">가격비교사이트</a></li>
            </ul>


        </div><!-- //admin-left// -->

        <div class="admin-container">
            <div class="admin-location">HOME &gt; 쇼핑몰관리 &gt; 상품관리 &gt; 재고관리</div>
            <div class="content">

                <h1>상품재고 관리</h1>
                <div class="mOption">
                    <table border="1" summary="">
                        <caption>상품 검색</caption>
                        <colgroup>
                            <col style="width:154px;">
                            <col style="width:auto;">
                            <col style="width:154px;">
                            <col style="width:auto;">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">검색분류</th>
                            <td colspan="3">
                                <ul class="mForm typeVer" id="eSearchFormGeneral">
                                    <li>
                                        <select class="fSelect eSearch" name="eField[]">
                                            <option value="product_name">상품명</option>
                                            <option value="eng_product_name">영문상품명</option>
                                            <option value="item_name">상품명(관리용)</option>
                                            <option value="purchase_prd_name">공급사 상품명</option>
                                            <option value="">--------------------</option>
                                            <option value="product_no">상품번호</option>
                                            <option value="product_code">상품코드</option>
                                            <option value="ma_product_code">자체 상품코드</option>
                                            <option value="item_code">품목코드</option>
                                            <option value="admin_item_code">자체 품목코드</option>
                                            <option value="">--------------------</option>
                                            <option value="Manufacturer">제조사</option>
                                            <option value="Supplier">공급사</option>
                                            <option value="Brand">브랜드</option>
                                            <option value="Trend">트렌드</option>
                                            <option value="Classification">자체분류</option>
                                            <option value="">--------------------</option>
                                            <option value="model_name">모델명</option>
                                            <option value="origin">원산지</option>
                                            <option value="Condition">상품상태</option>
                                            <option value="product_tag">상품 검색태그</option>
                                            <option value="product_weight">상품 전체중량</option>
                                            <option value="">--------------------</option>
                                            <option value="pm_memo">메모</option>
                                            <option value="ins_user">등록아이디</option>
                                        </select>
                                        <input type="text" class="fText eSearchText" style="width:500px;" value="" name="eValue[]">
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

                                        <a href="#none" class="btnIcon icoMinus" search-type="general"><span>삭제</span></a>
                                        <a href="#none" class="btnIcon icoPlus" search-type="general" style="display: inline-block;"><span>추가</span></a>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">상품분류</th>
                            <td colspan="3">
                                <div class="gSingle">
                                    <select class="fSelect category eCategory" id="eCategory1" depth="1" name="categorys[]"> <option value="">- 대분류 선택 -</option> <option value="23">(대분류) 미진열</option> <option value="24">(대분류) Outerwear</option> <option value="25">(대분류) Tops</option> <option value="26">(대분류) Dresses</option> <option value="27">(대분류) Bottoms</option> <option value="28">(대분류) Accessories</option> </select> <select class="fSelect category eCategory" id="eCategory2" depth="2" name="categorys[]"> <option value="">- 중분류 선택 -</option> <option value="34">(중분류) Skirts</option><option value="35">(중분류) Pants</option></select> <select class="fSelect category eCategory" id="eCategory3" depth="3" name="categorys[]"> <option value="">- 소분류 선택 -</option> </select> <select class="fSelect category eCategory" id="eCategory4" depth="4" name="categorys[]"> <option value="">- 상세분류 선택 -</option> </select> <input type="hidden" name="category" id="eHiddenCategory" value="27">                    <span class="gBreak">
                                            <label class=""><input type="checkbox" class="fChk category_sort" name="sub_cate" value="T"> 하위분류 포함검색</label>
                                            <label class=""><input type="checkbox" class="fChk category_sort" name="notincategory" value="T"> 분류 미등록상품 검색</label>
                                        </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">상품등록일</th>
                            <td colspan="3">
                                <select class="fSelect category" name="date">
                                    <option value="regist">상품등록일</option>
                                    <option value="modify">상품최종수정일</option>
                                </select>
                                <a href="#none" class="btnDate" period="0"><span>오늘</span></a>
                                <a href="#none" class="btnDate" period="3"><span>3일</span></a>
                                <a href="#none" class="btnDate" period="7"><span>7일</span></a>
                                <a href="#none" class="btnDate" period="30"><span>1개월</span></a>
                                <a href="#none" class="btnDate" period="90"><span>3개월</span></a>
                                <a href="#none" class="btnDate" period="365"><span>1년</span></a>
                                <a href="#none" class="btnDate" period="-1"><span>전체</span></a>
                                <input type="text" id="pr_start_date" name="start_date" class="fText gDate" value="2022-04-05">
                                <a href="javascript:;" id="start_date" class="btnIcon icoCal"><span>달력보기</span></a>
                                ~
                                <input type="text" id="pr_end_date" name="end_date" class="fText gDate" value="2023-04-05">
                                <a href="javascript:;" id="end_date" class="btnIcon icoCal"><span>달력보기</span></a>
                                <input type="hidden" name="date_type" value="9999">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">진열상태</th>
                            <td>
                                <label class="gSingleLabel eSelected"><input type="radio" class="fChk eDisplayStatus" name="display" value="A" checked="&quot;checked&quot;"> 전체</label>
                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="display" value="T"> 진열함</label>
                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="display" value="F"> 진열안함</label>
                            </td>
                            <th scope="row">판매상태</th>
                            <td>
                                <label class="gSingleLabel eSelected"><input type="radio" class="fChk eDisplayStatus" name="selling" value="A" checked="&quot;checked&quot;"> 전체</label>
                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="selling" value="T"> 판매함</label>
                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="selling" value="F"> 판매안함</label>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mButton">
                    <a href="#none" class="btnSearch" id="eBtnSearch"><span>검색</span></a>
                    <a href="#none" class="btnSearch reset" id="eSearchFormInit"><span>초기화</span></a>
                </div>

                <h2>상품 목록</h2>
                <div class="section">
                    <div class="mState">
                        <div class="gLeft">
                            <p class="total">[상품 총 <strong>2</strong>개 / 품목 총 <strong>2</strong>개]</p>
                        </div>
                        <div class="gRight">
                            <select class="fSelect" name="orderby">
                                <option value="regist_d">등록일 역순</option>
                                <option value="regist_a">등록일 순</option>
                                <option>---------------</option>
                                <option value="modify_d">수정일 역순</option>
                                <option value="modify_a">수정일 순</option>
                                <option>---------------</option>
                                <option value="name_d">상품명 역순</option>
                                <option value="name_a">상품명 순</option>
                                <option>---------------</option>
                                <option value="price_d">판매가 역순</option>
                                <option value="price_a">판매가 순</option>
                                <option>---------------</option>
                                <option value="stock_d">총 재고량 역순</option>
                                <option value="stock_a">총 재고량 순</option>
                                <option class="sort">---------------</option>
                                <option value="sort_d" class="sort">진열 역순</option>
                                <option value="sort_a" class="sort">진열 순</option>
                            </select>
                            <select class="fSelect" name="limit">
                                <option value="10">10개씩보기</option>
                                <option value="20" selected="selected">20개씩보기</option>
                                <option value="30">30개씩보기</option>
                                <option value="50">50개씩보기</option>
                                <option value="100">100개씩보기</option>
                            </select>
                        </div>
                    </div>
                    <div class="mBoard gCell gScroll">
                        <table border="1" summary="" class="eChkTr">
                            <caption>상품목록</caption>
                            <colgroup>
                                <col style="width:50px">
                                <col style="width:200px">
                                <col style="width:75px">
                                <!-- <col style="width:75px">
                                <col class="chk"> -->
                                <col style="width:160px">
                                <col style="width:130px">
                                <col style="width:160px">
                                <col style="width:160px">
                                <col style="width:70px">
                                <col style="width:70px">
                                <col style="width:65px">
                                <col style="width:140px">
                                <col style="width:110px">
                                <col style="width:82px">
                            </colgroup>
                            <thead>

                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">상품명</th>
                                <th scope="col">총 재고량</th>
                                <!-- <th scope="col">묶음선택</th>
                                <th scope="col"><input type="checkbox" class="allChk"></th> -->
                                <th scope="col">품목명</th>
                                <th scope="col">재고관리 사용</th>
                                <th scope="col">재고관리 등급</th>
                                <th scope="col"><span>수량체크 기준</span></th>
                                <th scope="col">재고수량</th>
                                <th scope="col">안전재고</th>
                                <th scope="col"><span>품절<br>표시</span></th>
                                <th scope="col">진열상태</th>
                                <th scope="col">판매상태</th>
                                <th scope="col"><strong>총 누적<br>판매량</strong></th>
                            </tr>


                            </thead>

                            <tbody class="center" id="eStockManageTable">
                            <tr>
                                <td rowspan="1">2</td>
                                <td rowspan="1" class="left">
                                    <div class="gGoods gMedium" style="z-index: 0;">
                                        <div class="mOpen">
                                            <span class="frame eOpenOver" find="gGoods"><img src="../../img/hoon/44x44.gif" width="44" height="44" alt=""></span>
                                            <div class="open" style="top: 20%; left: 20%; width: 145px; display: none;">
                                                <div class="wrap">
                                                    <ul class="default">
                                                        <li><a href="#none" class="eProductDetail" target="_blank" title="새창 열림" product_no="10">상품 상세보기</a></li>
                                                        <li><a href="#none" class="eProductDisplayPopup" popup="T" url="#">쇼핑몰화면 진열보기</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <p><a href="#" target="_blank" title="새창 열림" class="txtLink eProductDetail" product_no="10">샘플상품 2</a></p>
                                        <p class="txtCode">(P000000J)</p>
                                        <input type="hidden" name="product_no_list[]" value="10">
                                    </div>
                                </td>


                                <td rowspan="1"></td>


                                <!-- <td rowspan="1"><button type="button" class="btnIcon icoBunch eBindChk" id="P000000J"><span>묶음선택</span></button></td> -->

                                <!-- <td><input type="checkbox" class="rowChk eItemValueList" id="P000000J" item_code="P000000J000A" product_no="10" value="P000000J000A"></td> -->
                                <td>
                                    -
                                    <input type="hidden" class="eStockValue" name="itemCodeList[]" value="P000000J000A">
                                </td>


                                <td>
                                    <select class="fSelect eStockValue eStockValueDisabledControl eUseStock" name="use_stock[P000000J000A]">
                                        <option value="T">사용함</option>
                                        <option value="F" selected="selected">사용안함</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="fSelect eStockValue eStockValueDisabled" name="stock_importance[P000000J000A]" style="display:none;">
                                        <option value="A" selected="selected">일반재고</option>
                                        <option value="B">중요재고</option>
                                    </select>
                                    <span class="ec-use-inventory-display-item">-</span>                    </td>
                                <td>
                                    <select class="fSelect eStockValue eStockValueDisabled" name="stock_checking_type[P000000J000A]" style="display:none;">
                                        <option value="B" selected="selected">결제기준</option>
                                        <option value="A">주문기준</option>
                                    </select>
                                    <span class="ec-use-inventory-display-item">-</span>                    </td>
                                <td><input type="text" class="fText right eStockValue eStockValueDisabled" style="width:60px; display:none;" name="stock_number[P000000J000A]" value="0"><span class="ec-use-inventory-display-item">-</span></td>
                                <td><input type="text" class="fText right eStockValue eStockValueDisabled" style="width:60px; display:none;" name="stock_warn_value[P000000J000A]" value="0"><span class="ec-use-inventory-display-item">-</span></td>
                                <td><input type="checkbox" class="fChk eStockValue eStockValueDisabled eUseSoldout" style="display:none;" name="use_soldout[P000000J000A]" value="T"><span class="ec-use-inventory-display-item">-</span></td>
                                <td> - </td>
                                <td> - </td>
                                <td>0 (0)</td>
                            </tr>
                            <tr>
                                <td rowspan="1">1</td>
                                <td rowspan="1" class="left">
                                    <div class="gGoods gMedium" style="z-index: 0;">
                                        <div class="mOpen">
                                            <span class="frame eOpenOver" find="gGoods"><img src="../../img/hoon/44x44.gif" width="44" height="44" alt=""></span>
                                            <div class="open" style="top: 20%; left: 20%; width: 145px; display: none;">
                                                <div class="wrap">
                                                    <ul class="default">
                                                        <li><a href="#none" class="eProductDetail" target="_blank" title="새창 열림" product_no="9">상품 상세보기</a></li>
                                                        <li><a href="#none" class="eProductDisplayPopup" popup="T" url="https://youngsh92.cafe24.com/product/detail.html?product_no=9">쇼핑몰화면 진열보기</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <p><a href="/disp/admin/shop1/product/ProductRegister?product_no=9" target="_blank" title="새창 열림" class="txtLink eProductDetail" product_no="9">샘플상품 1</a></p>
                                        <p class="txtCode">(P000000I)</p>
                                        <input type="hidden" name="product_no_list[]" value="9">
                                    </div>
                                </td>


                                <td rowspan="1"></td>


                                <!-- <td rowspan="1"><button type="button" class="btnIcon icoBunch eBindChk" id="P000000I"><span>묶음선택</span></button></td>

                                                    <td><input type="checkbox" class="rowChk eItemValueList" id="P000000I" item_code="P000000I000A" product_no="9" value="P000000I000A"></td> -->
                                <td>
                                    -
                                    <input type="hidden" class="eStockValue" name="itemCodeList[]" value="P000000I000A">
                                </td>


                                <td>
                                    <select class="fSelect eStockValue eStockValueDisabledControl eUseStock" name="use_stock[P000000I000A]">
                                        <option value="T">사용함</option>
                                        <option value="F" selected="selected">사용안함</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="fSelect eStockValue eStockValueDisabled" name="stock_importance[P000000I000A]" style="display:none;">
                                        <option value="A" selected="selected">일반재고</option>
                                        <option value="B">중요재고</option>
                                    </select>
                                    <span class="ec-use-inventory-display-item">-</span>                    </td>
                                <td>
                                    <select class="fSelect eStockValue eStockValueDisabled" name="stock_checking_type[P000000I000A]" style="display:none;">
                                        <option value="B" selected="selected">결제기준</option>
                                        <option value="A">주문기준</option>
                                    </select>
                                    <span class="ec-use-inventory-display-item">-</span>                    </td>
                                <td><input type="text" class="fText right eStockValue eStockValueDisabled" style="width:60px; display:none;" name="stock_number[P000000I000A]" value="0"><span class="ec-use-inventory-display-item">-</span></td>
                                <td><input type="text" class="fText right eStockValue eStockValueDisabled" style="width:60px; display:none;" name="stock_warn_value[P000000I000A]" value="0"><span class="ec-use-inventory-display-item">-</span></td>
                                <td><input type="checkbox" class="fChk eStockValue eStockValueDisabled eUseSoldout" style="display:none;" name="use_soldout[P000000I000A]" value="T"><span class="ec-use-inventory-display-item">-</span></td>
                                <td> - </td>
                                <td> - </td>
                                <td>0 (0)</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>




            </div>
        </div>
    </div>

</div>

</div><!-- //Container// -->
</div>


</div>




<div class="admin-footer">
    Copyright ⓒ 2023 됐나욧 All rights reserved.
</div>

</body>
</html>
