
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
                        <form action="<c:url value="/admin/list"/>" class="search-form" method="get">
                        <tr>
                            <th scope="row">검색분류</th>
                            <td colspan="3">
                                <ul class="mForm typeVer" id="eSearchFormGeneral">
                                    <li>
                                        <select class="fSelect eSearch" name="option">
                                            <option value="T" ${ph.sc.option=='T' ? "selected" : ""} name="searchOption">상품명</option>
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
                            <th scope="row">상품분류</th>
                            <td colspan="3">
                                <div class="gSingle">
                                    <select class="fSelect category eCategory" id="eCategory1" depth="1" name="category"> <option value="">- 대분류 선택 -</option> <option value="CATE1" ${ph.sc.option=='CATE1' ? "selected" : ""} >(대분류) CATE1</option> <option value="CATE2" ${ph.sc.option=='CATE2' ? "selected" : ""} >(대분류) CATE2</option> <option value="CATE3"${ph.sc.option=='CATE3' ? "selected" : ""} >(대분류) CATE3</option> <option value="CATE4"${ph.sc.option=='CATE4' ? "selected" : ""} >(대분류) CATE4</option>  </select> <select class="fSelect category eCategory" id="eCategory2" depth="2" name="categorys[]"> <option value="">- 중분류 선택(미구현) -</option> <option value="34">(중분류) Skirts</option><option value="35">(중분류) Pants</option></select> <select class="fSelect category eCategory" id="eCategory3" depth="3" name="categorys[]"> <option value="">- 소분류 선택 (미구현) -</option> </select> <select class="fSelect category eCategory" id="eCategory4" depth="4" name="categorys[]"> <option value="">- 상세분류 선택 (미구현) -</option> </select> <input type="hidden" name="category" id="eHiddenCategory" value="27">                    <span class="gBreak">
<%--                                            <label class=""><input type="checkbox" class="fChk category_sort" name="sub_cate" value="T"> 하위분류 포함검색</label>--%>
<%--                                            <label class=""><input type="checkbox" class="fChk category_sort" name="notincategory" value="T"> 분류 미등록상품 검색</label>--%>
                                        </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">상품등록일</th>
                            <td colspan="3">
                                <select class="fSelect category" name="date">
                                    <option value="" ${ph.sc.dateField=='' ? "selected" : ""}>-등록일 선택-</option>
                                    <option value="regist" ${ph.sc.dateField=='regist' ? "selected" : ""}>상품등록일</option>
                                    <option value="modify" ${ph.sc.dateField=='modify' ? "selected" : ""}>상품최종수정일</option>
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
                        <tr>
                            <th scope="row">진열상태 (미구현)</th>
                            <td>
                                <label class="gSingleLabel eSelected"><input type="radio" class="fChk eDisplayStatus" name="display" value="A" checked="&quot;checked&quot;"> 전체</label>
                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="display" value="T"> 진열함</label>
                                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="display" value="F"> 진열안함</label>
                            </td>
                            <th scope="row">판매상태 (미구현)</th>
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
                    <a href="javascript:void(0)" class="btnSearch" id="eBtnSearch"><span >검색</span></a>
                    <a href="javascript:void(0)" class="btnSearch reset" id="eSearchFormInit"><span>초기화</span></a>
                </div>
                </form>


                <h2>상품 목록</h2>
                <div class="section">
                    <div class="mState">
                        <div class="gLeft">
                            <p class="total">[상품 총 <strong>${ph.totalCnt}</strong>개 / 품목 총 <strong>20</strong>개]</p>
                        </div>
                        <div class="gRight">
                            <select class="fSelect" name="orderby">
                                <option value="id_d" ${ph.sc.sortType=='id_d' ? "selected" : ""}>상품ID 역순</option>
                                <option value="id_a" ${ph.sc.sortType=='id_a' ? "selected" : ""}>상품ID 순</option>
                                <option>---------------</option>
                                <option value="regist_d" ${ph.sc.sortType=='regist_d' ? "selected" : ""}>등록일 역순</option>
                                <option value="regist_a" ${ph.sc.sortType=='regist_a' ? "selected" : ""}>등록일 순</option>
                                <option>---------------</option>
                                <option value="modify_d" ${ph.sc.sortType=='modify_d' ? "selected" : ""}>수정일 역순</option>
                                <option value="modify_a" ${ph.sc.sortType=='modify_a' ? "selected" : ""}>수정일 순</option>
                                <option>---------------</option>
                                <option value="name_d" ${ph.sc.sortType=='name_d' ? "selected" : ""}>상품명 역순</option>
                                <option value="name_a" ${ph.sc.sortType=='name_a' ? "selected" : ""}>상품명 순</option>
                                <option>---------------</option>
                                <option value="stock_d" ${ph.sc.sortType=='stock_d' ? "selected" : ""}>총 재고량 역순</option>
                                <option value="stock_a" ${ph.sc.sortType=='stock_a' ? "selected" : ""}>총 재고량 순</option>
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
                            <caption>상품목록</caption>
                            <colgroup>
                                <col style="width:50px">
                                <col style="width:200px">
                                <col style="width:75px">
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
                                <th scope="col">총 재고수량</th>
                                <th scope="col">카테고리명</th>

                                <th scope="col">재고수량</th>
                                <th scope="col">안전재고</th>
                                <th scope="col"><span>재고<br>상태</span></th>
                                <th scope="col">재고위치</th>
                                <th scope="col">상품상태</th>
                                <th scope="col"><strong>평균<br>별점</strong></th>
                            </tr>


                            </thead>

                            <tbody class="center" id="eStockManageTable">
<%--                            <c:set var="page" value="${ph.page}" />--%>
<%--                            <c:set var="pageSize" value="${ph.pageSize}" />--%>
<%--                                                    <div class="open" style="top: 20%; left: 20%; width: 145px; display: none;">--%>
<%--                                                        <div class="wrap">--%>
<%--                                                            <ul class="default">--%>
<%--                                                                <li><a href="#none" class="eProductDetail" target="_blank" title="새창 열림" product_no="10">상품 상세보기</a></li>--%>
<%--                                                                <li><a href="#none" class="eProductDisplayPopup" popup="T" url="#">쇼핑몰화면 진열보기</a></li>--%>
<%--                                                            </ul>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>


                                <tr class="test">
                               <!--상품 리스트 -->
                                </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mButton">
                    <a href="javascript:void(0)" class="btnModify" id="eBtnModify"><span >저장</span></a>
                </div>

                <br>
                <div class="paging-container">
                    <div class="paging">
                        <c:if test="${ph.totalCnt==null || ph.totalCnt==0}">
                            <div> 게시물이 없습니다. </div>
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



<jsp:include page="../admin_footer.jsp"/>

  <script>
      //datePicker
      let calendar = $(function(){
          $('#start_date,#end_date').click(function() {
              let datePicker = $(this).prev('input');
              let isFirstTime = true; // 처음 클릭 시에만 setDate를 사용하기 위한 변수

              // datePicker 옵션 초기화 하기
              datePicker.datepicker({
                  closeText: "닫기",
                  prevText: "이전달",
                  nextText: "다음달",
                  currentText: "오늘",
                  monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                  monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                  dayNames: ["일","월","화","수","목","금","토"],
                  dayNamesShort: ["일","월","화","수","목","금","토"],
                  dayNamesMin: ["일","월","화","수","목","금","토"],
                  weekHeader: "주",
                  dateFormat: "yy-mm-dd",
                  firstDay: 0,
                  isRTL: false,
                  showMonthAfterYear: true,
                  yearSuffix: "년",
                  showButtonPanel: true,

                  beforeShow: function(input) {
                      if (isFirstTime) {
                          isFirstTime = false;
                          $(input).datepicker("setDate", 'today');
                      }
                  }

              });

              // datepicker 보여주기
              datePicker.datepicker("show");
              console.log('show')
          });
      });

  </script>

<script>

    let pageHandler; // 전역변수로 담아서 다른 함수에서도 사용할 수 있다.
    let period = '';
    // 화면 비동기화 업데이트 함수
    let  showList = function(page, pageSize, keyword, sortType, category, period, dateField, startDate, endDate) {
        //서버에 전달할 검색어와 옵션을 변수에 담는다.

        let option = '';

        // let sortType='';

        console.log('가공 전 showList  ='+page)
        console.log('가공 전 showList  ='+pageSize)
        console.log('가공 전 showList  ='+keyword)
        console.log('가공 전 showList  ='+sortType)
        console.log('가공 전 showList  ='+category)
        console.log('가공 전 showList  ='+period)
        console.log('가공 전 showList  ='+dateField)
        console.log('가공 전 showList  ='+startDate)
        console.log('가공 전 showList  ='+endDate)



        if(page ===undefined || page<=0)
            page = 1;
        if (pageSize === undefined || pageSize <= 10)
            pageSize = 10;

        //달력보기로 설정후 등록일 기준이 없을시


        console.log('showList page =' +page)
        console.log('showList pageSize =' +pageSize)
        console.log('showList keyword =' +keyword)
        console.log('showList sortType =' +sortType)
        console.log('showList category =' +category)
        console.log('showList period =' +period)
        console.log('showList dateField =' +dateField)
        console.log('showList startDate =' +startDate)
        console.log('showList endDate =' +endDate)
        $('.test').empty();

        $.ajax({
            type: 'PATCH',
            url: "/admin/list",
            contentType : 'application/json',

            data: JSON.stringify({
                page : page,
                pageSize: pageSize,
                option: option,
                keyword: keyword,
                sortType: sortType, // sortType 값을 서버에 전달
                category : category,
                period : period,
                dateField : dateField,
                startDate : startDate,
                endDate : endDate,

            }),
            // traditional: true, // 배열 형태의 데이터를 전송할 때 필요한 옵션
            success: function (data) {
                console.log(data);
                processListData(data);// 화면에 뿌리는 부분 중복


            },
            error: function () {
                // 에러 시 처리할 코드
            }
        });
     }




     // 자동 체크박스 체크 함수
    const checkbox = function () {
        const prodId = $(this).data('prod-id');
        const invQty = $('input.option-number[data-prod-id="' + prodId + '"]').val();
        const safeInv = $('input.safe-number[data-prod-id="' + prodId + '"]').val();
        let invStusCd = $('select.inv-status[data-prod-id="' + prodId + '"]').val();
        const invLoc = $('select.inv-loc[data-prod-id="' + prodId + '"]').val();

        const $checkbox = $('input[type="checkbox"][id="pd-check"][data-prod-id="' + prodId + '"]');

        if (invQty !== '' || safeInv !== '' || invStusCd !== '' || invLoc !== '') {
            $checkbox.prop('checked', true);
            console.log('Checkbox checked:', $checkbox.prop('checked'));
        } else {
            $checkbox.prop('checked', false);
            console.log('Checkbox checked:', $checkbox.prop('checked'));
        }
    };

    $('input.option-number, input.safe-number, select.inv-status, select.inv-loc').on('input', checkbox);
        // 클릭시 검색어와 옵션의 값을 포함하여 전달함.


    function processListData(data) {
        pageHandler = data.ph;
        const totalCnt = data.ph.totalCnt;
        console.log("totalCnt = "+totalCnt)
        $('.total strong').text(totalCnt); // 상품 총 개수를 보여주는
        $('.center').html(toHtml(data.list)); // 상품을 보여주는
        $('.paging').html(updatePaging(data.ph)); // 페이징을 업데이트 하는
        checkbox;
    }


    // 비동기화 후 페이징 처리를 비동기화로 변경하는 함수
    let updatePaging = function (ph){

        console.log(ph)
        let pagingHtml = '';
//
        if(ph.totalCnt == null || ph.totalCnt ==0 ){
            pagingHtml += '<div> 게시물이 없습니다. </div>'
        }
        if(ph.showPrev) {
            let beginPage = (ph.beginPage <= 1) ? 2 : ph.beginPage;
                pagingHtml += '<a class="page" href="/admin/list?page='+(ph.beginPage-1)+'&pageSize='+ph.sc.pageSize+'&option='+ph.sc.option+'&keyword='+ph.sc.keyword+'">&lt;</a>'
        }
        for (let i=ph.beginPage; i<= ph.endPage; i++) {
            let classText = (i===ph.sc.page)? 'page paging-active' : 'page';
            let url = "/admin/list?page="+ph.sc.page+"&pageSize="+ph.sc.pageSize+"&option="+ph.sc.option+"&keyword="+ph.sc.keyword; // 누르면 해당하는 번호로 변경되게 해야함
            pagingHtml += '<a class="'+classText+'" href="'+url+'">'+i+'</a>';
        }
        if(ph.showNext) {
            let beginPage = (ph.beginPage <= 1) ? 1 : ph.beginPage;
            pagingHtml += '<a class="page" href="/admin/list?page='+(ph.beginPage+1)+'&pageSize='+ph.sc.pageSize+'&option='+ph.sc.option+'&keyword='+ph.sc.keyword+'">&gt;</a>'
        }
        // console.log(pagingHtml)
        return pagingHtml;
    }


    // 비동기화 호출 뒤 배열에 담긴 값들을 태그에 담는 함수
    let toHtml = function (object) {
        let tmp =''
        object.forEach(function(inv){
            tmp += '<tr>'
            tmp += '<form id="form" class="frm" action="/admin/modify" method="post">'
            tmp += '<td rowspan="1" id="prod-id" data-prod-id="' + inv.prod_ID + '">' + inv.prod_ID + '<input type="checkbox" id="pd-check" data-prod-id="' + inv.prod_ID + '"></td>'
            tmp += '<td rowspan="1" class="left">'
            tmp += '<div class="gGoods gMedium" style="z-index: 0;">'
            tmp += '<div class="mOpen">'
            tmp += '<span class="frame eOpenOver" find="gGoods"><img src="../../img/hoon/44x44.gif" width="44" height="44" alt=""></span>'
            tmp += '</div>'
            tmp += ' <p>'
            tmp += '<a href="#" target="_blank" title="새창 열림" class="txtLink eProductDetail" product_no="10">'+inv.prod_NM+'</a>'
            tmp += '</p>'
            tmp += '<p class="txtCode">(P000000J)</p>'
            tmp += '<input type="hidden" name="product_no_list[]" value="10">'
            tmp +=  '</div>'
            tmp +=  '</td>'
            tmp +=  '<td rowspan="1" id="total-qty-'+inv.prod_ID+'" data-prod-id="'+inv.prod_ID+'">'+inv.inv_QTY+'</td>'
            tmp +=  '<td>'+inv.cate_CD
            tmp += '<input type="hidden" class="cate-cd" name="cate-cd" value="P000000J000A">'
            tmp += '</td>'
            //
            tmp += '<td>'
            tmp += '<input type="number" class="option-number" data-prod-id="'+inv.prod_ID+'" style="width:60px;" name="s" value="'+inv.inv_QTY+'">'
            tmp += '</td>'
            tmp += '<td>'
            tmp += '<input type="number" class="safe-number" data-prod-id="'+inv.prod_ID+'" style="width:60px;" name="stock_warn_value[P000000J000A]" value="'+inv.safe_INV+'">'
            tmp += '</td>'

            // tmp += '<td>'
            tmp += '<td>'
            tmp += '<select class="inv-status" data-prod-id="' + inv.prod_ID + '" name="inv_status[P000000J000A]">'
            tmp += '<option id="opt1" value="여유" data-prod-id="' + inv.prod_ID + '"' + (inv.inv_STUS_CD == '여유' ? 'selected' : '') + '>여유</option>'
            tmp += '<option id="opt2" value="부족" data-prod-id="' + inv.prod_ID + '"' + (inv.inv_STUS_CD == '부족' ? 'selected' : '') + '>부족</option>'
            tmp += '<option id="opt3" value="품절" data-prod-id="' + inv.prod_ID + '"' + (inv.inv_STUS_CD == '품절' ? 'selected' : '') + '>품절</option>'
            tmp += '</select>'
            tmp += '</td>'
            //
            tmp += '<td>'
            tmp += '<span class="ec-use-inventory-display-item" style="display: none;">' + inv.inv_LOC + '</span>'
            tmp += '<select class="inv-loc" data-prod-id="' + inv.prod_ID + '" name="inv_loc[P000000J000A]">'
            tmp += '<option value="창고 1(1A-14)" ' + (inv.inv_LOC == '창고 1(1A-14)' ? 'selected' : '') + '>창고 1(1A-14)</option>'
            tmp += '<option value="창고 1(2A-14)" ' + (inv.inv_LOC == '창고 1(2A-14)' ? 'selected' : '') + '>창고 1(2A-14)</option>'
            tmp += '<option value="창고 1(3A-14)" ' + (inv.inv_LOC == '창고 1(3A-14)' ? 'selected' : '') + '>창고 1(3A-14)</option>'
            tmp += '</select>'
            tmp += '</td>'

            tmp += '<td>' + inv.prod_STUS + '</td>'
            tmp += '<td>' + inv.avg_ASCR + '/ 5</td>'
            tmp += '</form>'
            tmp += '</tr>'

        })
        // console.log(tmp);
        return  tmp + "<br>" ;
    }

    $(document).ready(function() {

        let page = '';
        let pageSize = '';
        let keyword =' ';
        let sortType ='';
        let category ='';
        let period ='';
        let dateField ='';
        let startDate ='';
        let endDate ='';

        showList(page, pageSize, keyword, sortType, category, period, dateField, startDate, endDate);



        // 페이지 숫자를 클릭했을 때의 이벤트 핸들러
        $('.paging').on('click', '.page', function(event) {
            event.preventDefault(); // 기본 동작 중단

            let page = $(this).text(); // 클릭한 그 값을 가져옴 , 즉 i 의 값
            let pageSize =pageHandler.sc.pageSize; // 전역 변수인 pageHandler를 참조하여 pageSize 추출 //
            // let option = $('select[name="option"] option:selected').val(); // 옵션
            // let keyword = $('.search-input').val(); // 검색어
            // let sortType = $('select[name="orderby"] option:selected').val();

            //담아서 showList에 매개변수로 전달한다.
            showList(page, pageSize, keyword, sortType, category, period, dateField, startDate, endDate);
            // showList(page,pageSize,'','')

            });


// 저장버튼 누를시 변경
        $('#eBtnModify').on("click", function () {
            const code1 = $('#opt1').val(); // 여유
            const code2 = $('#opt2').val(); // 부족
            const code3 = $('#opt3').val(); // 품절
        // 서버에 객체를 담아 전달할 객체배열 하나 생성
            const jsonData = [];
            // 체크박스 or id = pd-check 가 체크된 박스들을 .each 로 순회해서 아래의 행동을 한다,
            $('input[type="checkbox"][id="pd-check"]:checked').each(function () {
                //변경할 값들을 변수에 담는다.
                const prodId = $(this).data('prod-id'); // 아이디
                const invQty = $('input.option-number[data-prod-id="' + prodId + '"]').val(); // 재고수량
                const safeInv = $('input.safe-number[data-prod-id="' + prodId + '"]').val(); // 안전재고
                let invStusCd = $('select.inv-status[data-prod-id="' + prodId + '"]').val(); // 재고상태
                const invLoc = $('select.inv-loc[data-prod-id="' + prodId + '"]').val(); // 재고위치

                if (invQty !== '' || safeInv !== '' || invStusCd !== '' || invLoc !== '') {
                    $(this).prop('checked', true);
                }

                // 안전재고보다 많거나 적을시 옵션의 값을 다음과 같이 지정한다.
                // invStusCd의 값이 cde3 과 똑같다면  == invStusCd 는 code3 이된다.
                if ( invStusCd === code3) {
                    invStusCd = code3;
                } else if (parseInt(invQty) >= parseInt(safeInv)) {
                    invStusCd = code1;
                } else {
                    invStusCd = code2;
                }

                // invDto 객체에 아래의 값들을 담는다.
                const invDto = {
                    prod_ID: parseInt(prodId),
                    inv_QTY: parseInt(invQty),
                    safe_INV: parseInt(safeInv),
                    inv_STUS_CD: invStusCd,
                    inv_LOC: invLoc,
                    upd_DTM : new Date()
                };
                //배열에 객체를 담는다.
                jsonData.push(invDto);
            }); //each의 끝

            $.ajax({
                url: '/admin/modify',
                type: 'POST',
                data: JSON.stringify(jsonData),
                contentType: 'application/json',
                success: function (result) {
                    console.log('전송 성공.');
                    showList();
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                    alert('수정 실패: ' + xhr.responseText);
                }
            });
        });

        //검색 버튼 누를시
        // 상품명과 pageSize 같이 적용되서 검색
        $('#eBtnSearch').click(function () {
            let page = $('.classText').val();
            let pageSize = $('select[name="limit"] option:selected').val();
            let keyword = $('.search-input').val(); // 검색어
            let sortType = $('select[name="orderby"] option:selected').val()
            let category = $('select[name="category"] option:selected').val()
            let startDate = $('#pr_start_date').val()
            let endDate =$('#pr_end_date').val()
            let dateField = $('select[name="date"] option:selected').val();

            console.log("dateField = " +dateField)
            console.log("startDate = " +startDate)
            console.log("endDate = " +endDate)

            if (startDate !== '' && endDate !== '')
            {
                period = '';
            }

            if (startDate > endDate)
            {alert('시작일을 종료일보다 이전으로 설정 하세요')}

             else if ((startDate !== '' && endDate !== '') && (dateField ===''))
            {
                alert('등록일 기준을 선택해주세요')
            }
             else{
            showList(page, pageSize, keyword, sortType, category,null,dateField,startDate,endDate);

            }
            // category값이 undefined가 아니라면 dateField 는 null로 변경된다.

        });

        //초기화 버튼을 누를시
        $('#eSearchFormInit').click(function () {

            $('.search-input').val(''); // 검색어 입력 필드의 값을 빈 문자열로 설정
            $('select[name="category"]').val(''); // 카테고리 선택을 기본값으로 설정
            $('#pr_start_date, #pr_end_date').val(''); // 날짜 선택(input 태그)의 값을 빈 문자열로 설정
            $('select[name="limit"]').val('10');
            $('select[name="orderby"]').val('id_d');
            $('select[name="date"]').val("");
            $('select[name="option"]').val("T");
            let page = '';
            let pageSize = '';
            let keyword =' ';
            let sortType ='';
            let category ='';
            let period ='';
            let dateField ='';
            let startDate ='';
            let endDate ='';
            showList(page, pageSize, keyword, sortType, category, period, dateField, startDate, endDate);

        });

            // 검색창에 커서가 있고 Enter를 누를 경우에만
        $('.search-input').keydown(function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                $('#eBtnSearch').trigger('click'); // Simulate a click on the search button
            }
        });


        // 체크박스 이벤트 처리 등록 // 이게 있어야 자동으로 체크박스가 체크된다.
        $(document).on('input', 'input.option-number, input.safe-number, select.inv-status, select.inv-loc', checkbox);

        // select 요소의 change 이벤트 처리 등록 - 10개씩 보기 , 20개씩 보기
        $('select[name="limit"]').on('change', function() {
            // 선택된 옵션의 값을 가져온다

            let page = $('.classText').val();
            let pageSize = $('select[name="limit"] option:selected').val();
            let keyword = $('.search-input').val(); // 검색어
            let sortType = $('select[name="orderby"] option:selected').val()
            let category = $('select[name="category"] option:selected').val()
            // let period = $(this).attr('period');
            let dateField = $('select[name="date"]').val();
            let startDate = $('#pr_start_date').val();
            let endDate = $('#pr_end_date').val();
            // 선택된 값을 이용하여 원하는 동작을 수행한다

            if (startDate !== '' && endDate !== '')
            {
                period = '';
            }
            console.log('startDate ='+ startDate);
            console.log('endDate ='+ endDate);
            // 예: showList 함수 호출 등
            showList(page, pageSize, keyword, sortType, category, period, dateField, startDate, endDate);
        });

        // 상품 정렬방식 - ORDER BY
        $('select[name="orderby"]').on('change', function() {
            // 선택된 옵션의 값을 가져온다
            let page = $('.classText').val();
            let pageSize = $('select[name="limit"] option:selected').val();
            let keyword = $('.search-input').val(); // 검색어
            let sortType = $('select[name="orderby"] option:selected').val()
            let category = $('select[name="category"] option:selected').val()
            // let period = $(this).attr('period');
            let dateField = $('select[name="date"]').val();
            let startDate = $('#pr_start_date').val();
            let endDate = $('#pr_end_date').val();

            if (startDate !== '' && endDate !== '')
            {
                period = '';
            }
            // 선택된 값을 이용하여 원하는 동작을 수행한다
            // 예: showList 함수 호출 등
            console.log('startDate ='+ startDate);
            console.log('endDate ='+ endDate);
            console.log('period ='+ period);
            showList(page, pageSize, keyword, sortType, category, period, dateField, startDate, endDate);
        });

        // 1일 3일 날짜버튼을 클릭할시
        $('.btnDate').click(function () {

            $('#pr_start_date, #pr_end_date').val(''); // 날짜 선택(input 태그)의 값을 빈 문자열로 설정, 중복 x

            let page = $('.classText').val();
            let pageSize = $('select[name="limit"] option:selected').val();
            let keyword = $('.search-input').val(); // 검색어
            let sortType = $('select[name="orderby"] option:selected').val()
            let category = $('select[name="category"] option:selected').val()
            period = $(this).attr('period');
            let dateField = $('select[name="date"]').val();
            let startDate = '';
            let endDate ='';
            // let dateField = $('select[name="date"] option:selected').val();
            console.log("period ="+period)
            console.log("dateField ="+dateField)

            if (dateField == undefined || dateField =='')
            {alert('등록일 기준을 선택 하세요')}


            // 선택한 날짜 필터링 값을 서버로 전달하고 결과를 화면에 표시하는 함수 호출
            showList(page, pageSize, keyword, sortType, category, period, dateField, startDate, endDate);
        });





    });

</script>
<script>
    let msg ="${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_OK") alert("수정이 완료되었습니다.");

    if(msg=="LIST_ERR") alert("올바른 값을 입력해 주세요.");


</script>

</body>
</html>