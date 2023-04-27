<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./css/hwa/order.css"/><!-- css -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 주소찾기 -->
</head>


<body>

<div id="wrap">
    <header id="orderHeader">
        <div class="orderHead">
            <h1 class="logo"><a href="/"><img  id ="logoImg" src="/img/main/logo_black.png" alt="dobbyisfree"></a></h1>
            <p class="helpArea">
                <strong>도움이 필요하세요?</strong>
                <span class="helpBtn">
                    <a href="" target="_blank" class="btnType1s"><span>FAQ</span></a> <!-- 고객센터, FAQ URL 추가 -->
                    <a href="" target="_blank" class="btnType1s"><span>1:1</span> 고객상담</a>
                </span>
            </p>
        </div>
    </header>
    <div id="container" class="orderRenewal" style="">

        <h2 class="orderTitle">결제하기</h2>
        <div class="orderContents">
            <div class="orderWrap">
                <input type="hidden" id="pageFl" value="orderRenewal">
                <!-- 주문 배송 정보 -->

                <section>
                    <h3 class="subTitle2">주문/배송정보</h3>
                    <form id="orderInfoForm" name="orderInfoForm" method="POST" onsubmit="return false;" novalidate="novalidate">
                        <input type="hidden" id="recentlyAddrNoDefaultListCnt" value="1">
                        <div class="tableTypeWrite">
                            <div id="ordererForm">
                            </div>
                            <table>
                                <caption>주문/배송정보 입력</caption>
                                <colgroup>
                                    <col style="width:214px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span class="required" aria-required="true">필수입력</span> 주문자</th>
                                    <td>
                                        <input type="text" name="ordNmTxt" id="ordNmTxt" maxlength="10" class="inputTxt altPosition" title="이름입력" style="width: 21%;" value="${mbrDto.MBR_NM}">
                                        <p class="inputAlt"></p>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span class="required" aria-required="true">필수입력</span> 연락처</th>
                                    <td>
                                        <div class="selectArea" style="width: 21%;">
                                            <button class="selTit" type="button" title="휴대전화번호 첫번째 선택" id="ordMblNo1"  onclick="selActive();">010</button>
                                            <ul class="selList" style="display: none;">

                                                <li>
                                                    <input type="radio" name="ordMblNo1" id="ordMblNo010" class="option" value="010" text="010" checked=""><label for="ordMblNo010">010</label>
                                                </li>

                                                <li>
                                                    <input type="radio" name="ordMblNo1" id="ordMblNo011" class="option" value="011" text="011"><label for="ordMblNo011">011</label>
                                                </li>

                                                <li>
                                                    <input type="radio" name="ordMblNo1" id="ordMblNo016" class="option" value="016" text="016"><label for="ordMblNo016">016</label>
                                                </li>

                                                <li>
                                                    <input type="radio" name="ordMblNo1" id="ordMblNo017" class="option" value="017" text="017"><label for="ordMblNo017">017</label>
                                                </li>

                                                <li>
                                                    <input type="radio" name="ordMblNo1" id="ordMblNo018" class="option" value="018" text="018"><label for="ordMblNo018">018</label>
                                                </li>

                                                <li>
                                                    <input type="radio" name="ordMblNo1" id="ordMblNo019" class="option" value="019" text="019"><label for="ordMblNo019">019</label>
                                                </li>

                                            </ul>
                                        </div>
                                        <span class="hyphen">-</span>
                                        <input type="text" name="ordMblNo2" id="ordMblNo2" class="inputTxt checkNum" style="width: 22%;" value="6868" maxlength="4" title="휴대전화번호 두번째">
                                        <span class="hyphen">-</span>
                                        <input type="text" name="ordMblNo3" id="ordMblNo3" class="inputTxt checkNum altPosition" style="width: 22%;" value="9854" maxlength="4" title="휴대전화번호 세번째">
                                        <p class="inputAlt"></p>
                                    </td>
                                </tr>
                                    <script> // 연락처 세개로 나누는 script [010-1234-1234] -> [010] [1234] [1234]
                                        let phoneNum = '${mbrDto.MPNO}';
                                        console.log('폰넘버타입',typeof phoneNum);  //number -> ${mbrDto.MPNO}를 문자열로 감싸서 string으로 변환
                                        console.log('폰넘버', '${mbrDto.MPNO}');  // ''문자열로 감싸야 올바른 값이 찍힌다
                                        console.log('폰넘버변수', phoneNum);
                                        let parts = phoneNum.split('-');

                                        console.log(parts[0]);
                                        console.log(parts[1]);
                                        console.log(parts[2]);

                                        document.getElementById("ordMblNo1").value = parts[0];
                                        document.getElementById("ordMblNo2").value = parts[1];
                                        document.getElementById("ordMblNo3").value = parts[2];

                                    </script>
                                <tr class="deliveryEmailWrap">
                                    <th scope="row"><span class="required" aria-required="true">필수입력</span> 이메일</th>
                                    <td>
                                        <input type="text" name="emailTxt" id="emailTxt" class="inputTxt altPosition" title="이메일 입력" style="width: 90%;" value="${mbrDto.EMAIL}">
                                        <p class="inputAlt"></p>
                                    </td>
                                </tr>


                                <tr class="deliverySelWrap addrSave">
                                    <!-- <th scope="row">배송지 선택</th>
                                    <td id="deliveryList">
                                        <div class="btn">
                                            <button type="button" class="btnType7s" id="dlvAddMngBtn">배송지 관리</button>
                                            <button type="button" class="btnType6s" id="manualAddDlvAddr">새로운 배송지</button>
                                        </div> -->
                                    <!-- <div class="list" id="selList">
                                       <label class="inputRadio noAddrList" style="display:block;">
                                            배송지를 등록 해주세요.
                                        </label>
                                        <label class="addrtemp" style="display:block;">
                                            <input type="radio" id="addr" name="useAddr" $basicfl="" $seq="" $rcvnm="" $zip="" $mblno="" $dlvnm="" $dlvaddr1st="" $dlvaddr2nd="" $mtdlvfl="" $dlvtype="" $cvscd="" onchange="setDlvAddr();">
                                            <span></span>
                                        </label> -->




                                    <!-- <label class="inputRadio division" for="addrList0">



                                <input type="radio" name="useAddr" id="addrList0" $seq="" $rcvnm="이현화" $dlvnm="" $zip="03164" $dlvaddr1st="서울특별시 종로구 종로 69" $mblno="010-6868-9854" $dlvaddr2nd="ㄴㄴㄴ" $mtdlvfl="N">
                                <span>
                                    <span class="name">이현화</span> 010-6868-9854<br>
                                    서울특별시 종로구 종로 69 ㄴㄴㄴ
                                </span>
                            </label>


                </div>-->
                                    </td>
                                </tr>

                                <!-- 배송지 작성 -->
                                <tr class="deliveryWriteWrap addWrite" style="display: table-row;">
                                    <th scope="row">배송지 작성</th>
                                    <td>

                                        <div class="row deliverySel">
                                            <label class="inputChk addNewDiv" for="isAddNewChk"> <input type="checkbox" id="isAddNewChk" checked="checked" readonly=""> <span>배송지 목록에 추가</span></label>
                                            <label class="inputChk" for="isAddDefaultChk"> <input type="checkbox" id="isAddDefaultChk"> <span>기본 배송지로 등록</span></label>
                                            <button type="button" class="btnType7s" id="cancelManualAddDlvAddr">입력취소</button>
                                        </div>

                                        <div class="row">
                                            <label for="dlvNmTxt" class="titLabel"  style="display: block"><span class="required" aria-required="true">필수입력</span> 배송지명</label>
                                                <div class="selectArea" style="width: 90%">
                                                    <button class="selTit" type="button" onclick="selActive();">배송지명 선택</button>
                                                    <ul class="selList">
                                                        <li><input type="radio" id="dlvRequest1" name="dlvReqCntRadio"><label for="dlvRequest1">신규입력</label></li>
                                                        <li><input type="radio" id="dlvRequest2" name="dlvReqCntRadio"><label for="dlvRequest2">집</label></li>
                                                        <li><input type="radio" id="dlvRequest3" name="dlvReqCntRadio"><label for="dlvRequest3">회사</label></li>
                                                    </ul>
                                                </div>
                                            <input type="text" id="dlvNmTxt" name="dlvNmTxt" maxlength="10" class="inputTxt" style="width:90%;margin-top:4px;" placeholder="최대 10자 까지 입력 가능">
                                            <p class="inputAlt"></p>
                                        </div>

                                        <div class="row">
                                            <label for="rcvNmTxt" class="titLabel"><span class="required" aria-required="true">필수입력</span> 받으실 분</label>
                                            <label class="inputChk" for="addOrdererInfo"><input type="checkbox" id="addOrdererInfo"> <span>주문자 정보와 동일</span></label>
                                            <input type="text" name="rcvNmTxt" id="rcvNmTxt" maxlength="10" class="inputTxt" style="width:90%;margin-top:4px;" placeholder="최대 10자 까지 입력 가능">
                                            <p class="inputAlt"></p>
                                        </div>

                                        <div class="row deliveryInput">
                                            <label for="ordzipTxt" class="titLabel"><span class="required" aria-required="true">필수입력</span> 주소</label>
                                            <div class="row">
                                                <input title="우편번호" type="text" id="ordzipTxt" name="ordzipTxt" class="inputTxt ordzipTxt read-only" style="width:13%;" value="" readonly="readonly">
                                                <button type="button" class="btnType7m" onclick="sample6_execDaumPostcode()">우편번호 검색</button>


                                                <p class="inputAlt"></p>
                                            </div>
                                            <div class="row">
                                                <input type="text" name="dlvAddr1stTxt" id="dlvAddr1stTxt" class="inputTxt dlvAddr1stTxt altPosition read-only" title="배송지 주소 입력" style="width:90%;" readonly="readonly">
                                                <p class="inputAlt"></p>
                                            </div>
                                            <div class="row">
                                                <input type="text" name="dlvAddr2ndTxt" id="dlvAddr2ndTxt" class="inputTxt dlvAddr2ndTxt" title="배송지 상세주소 입력" style="width:90%;" placeholder="상세주소">
                                                <p class="inputAlt"></p>
                                            </div>
                                        </div>

                                        <div class="row" id="mtDlvFlDiv">
                                            <div style="display:none" ;=""><label class="inputChk" for="mtDlvFlTxt"> <input type="checkbox" id="mtDlvFlTxt"> <span>군부대 배송 시 체크</span></label></div>
                                        </div>

                                        <div class="row mobileInput">
                                            <label for="dlvNmTxt" class="titLabel" style="width:100px"><span class="required" aria-required="true">필수입력</span> 휴대폰번호</label>

                                            <div class="selectArea" style="width:20%;">
                                                <button type="button" class="selTit"  id="mblNo1" onclick="selActive();">010</button>
                                                <ul class="selList">

                                                    <li>
                                                        <input type="radio" name="mblNo1" id="mblNo010" value="010" text="010" checked="">
                                                        <label for="mblNo010">010</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" name="mblNo1" id="mblNo011" value="011" text="011">
                                                        <label for="mblNo011">011</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" name="mblNo1" id="mblNo016" value="016" text="016">
                                                        <label for="mblNo016">016</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" name="mblNo1" id="mblNo017" value="017" text="017">
                                                        <label for="mblNo017">017</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" name="mblNo1" id="mblNo018" value="018" text="018">
                                                        <label for="mblNo018">018</label>
                                                    </li>

                                                    <li>
                                                        <input type="radio" name="mblNo1" id="mblNo019" value="019" text="019">
                                                        <label for="mblNo019">019</label>
                                                    </li>

                                                </ul>
                                            </div>
                                            <span class="hyphen">-</span>
                                            <input type="text" name="mblNo2" id="mblNo2" maxlength="4" title="휴대전화번호 두번째" class="inputTxt checkNum" style="width:20%;">
                                            <span class="hyphen">-</span>
                                            <input type="text" name="mblNo3" id="mblNo3" maxlength="4" title="휴대전화번호 세번째" class="inputTxt checkNum altPosition" style="width:20%;">

                                            <p class="inputAlt"></p>
                                        </div>
                                    </td>
                                </tr>
                                <!-- //배송지 작성 -->

                                <script>
                                    //주문자 정보와 동일 버튼 클릭시 주문자의 이름, 연락처 가져오기
                                    let rcvNmTxtVal = document.getElementById("rcvNmTxt").value;  //원래 값 변수에 저장해놓기
                                    let mblNo1Val = document.getElementById("mblNo1").value;
                                    let mblNo2Val = document.getElementById("mblNo2").value;
                                    let mblNo3val = document.getElementById("mblNo3").value;
                                    $('#addOrdererInfo').on('change', function() {

                                        if ($(this).is(':checked')) { //주문자 정보와 동일 체크박스 체크시

                                            document.getElementById("rcvNmTxt").value = '${mbrDto.MBR_NM}';  // 받으실 분 = 주문자 이름

                                            document.getElementById("mblNo1").value = parts[0]; //휴대폰 번호 = 주문자 연락처
                                            document.getElementById("mblNo2").value = parts[1];
                                            document.getElementById("mblNo3").value = parts[2];
                                        }
                                        else {
                                            document.getElementById("rcvNmTxt").value = rcvNmTxtVal;
                                            document.getElementById("mblNo1").value = mblNo1Val;
                                            document.getElementById("mblNo2").value = mblNo2Val;
                                            document.getElementById("mblNo3").value = mblNo3val;
                                        }
                                    });
                                </script>


                                <tr class="addrMasg">
                                    <th scope="row">배송 요청사항</th>
                                    <td class="shippingMsg">
                                        <div class="selectArea" style="width: 75%;">
                                            <button class="selTit" type="button" onclick="selActive();">배송 요청사항을 선택해 주세요.</button>
                                            <ul class="selList">
                                                <li><input type="radio" id="request2" name="dlvReqCntRadio"><label for="request2">부재시 경비(관리)실에 맡겨주세요.</label></li>
                                                <li><input type="radio" id="request3" name="dlvReqCntRadio"><label for="request3">부재시 문앞에 놓아주세요.</label></li>
                                                <li><input type="radio" id="request4" name="dlvReqCntRadio"><label for="request4">파손의 위험이 있는 상품이 있으니, 배송에 주의해주세요.</label></li>
                                                <li><input type="radio" id="request5" name="dlvReqCntRadio"><label for="request5">배송전에 연락주세요.</label></li>
                                                <li><input type="radio" id="request6" name="dlvReqCntRadio"><label for="request6">메시지 직접 입력</label></li>
                                            </ul>
                                        </div>
                                        <div class="writeMsg request">
                                            <input type="text" id="dlvReqCntTxt" class="inputTxt" maxlength="45" style="width: 75%;" placeholder="배송 요청사항을 입력해주세요. (최대 45자까지 입력 가능)">
                                        </div>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </form>
                </section>




                <!-- //주문 배송 정보 -->

                <!-- 주문 상품 정보 -->
                <form id="orderForm" name="orderForm" action="/kr/ko/OrderProc.do" onsubmit="return false;">
                    <section id="orderChk" style="display: block;">
                        <!-- [ARC] 배송비 - 뷰티포인트결제 -->
<%--                        <input type="hidden" id="btPtDlcsUsgYn" name="btPtDlcsUsgYn">		<!-- 배송비 뷰티포인트사용 여부 -->--%>
<%--                        <input type="hidden" id="dlcsUsgBtPt" name="dlcsUsgBtPt">	<!-- 배송비 뷰티포인트 사용금액 -->--%>
<%--                        <input type="hidden" id="dlcsbtPtShowYn" name="dlcsbtPtShowYn" value="Y">	<!-- 배송비 뷰티포인트 결제 가능 여부 -->--%>

<%--                        <input type="hidden" id="skMpCpnOnlyYn" name="skMpCpnOnlyYn" value="N">		<!-- SKMP단독 사용 여부 -->--%>

                        <h3 class="subTitle2">주문 상품 정보</h3>
                        <div class="cartList">
                            <ul>
                                <c:forEach items="${orderList}" var="orderList">
                                    <c:choose>
                                    <c:when test="${orderList.DC_YN eq 'Y'}">
                                        <c:set var="prod_fee" value="${orderList.AMT * 0.9 * orderList.PROD_INDV_QTY}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="prod_fee" value="${orderList.AMT * orderList.PROD_INDV_QTY}"/>
                                    </c:otherwise>
                                    </c:choose>
                                <li>
                                <div class="pdtRow">
                                    <div class="cell pdtImg">

                                        <a href="javascript:void(0);" onclick="window.open('/kr/ko/ProductView.do?prdSeq=34662&amp;catCd01=UA','_blank');">
                                            <img  id ="pdtImg" src="${orderList.REP_IMG}" alt="상품이미지">
                                        </a>

                                    </div>
                                    <div class="cell pdtInfo">
                                        <div class="pdtName">
                                            <a href="javascript:void(0);" onclick="window.open('/kr/ko/ProductView.do?prdSeq=34662&amp;catCd01=UA','_blank');">
                                                ${orderList.PROD_NM}
                                            </a>
                                        </div>

                                        <div class="pdtOpt">

                                        </div>
                                    </div>
                                    <div class="cell pdtCount">${orderList.PROD_INDV_QTY} 개</div>
                                    <div class="cell pdtPrice">
                                                            <span class="price">
                                                                <span class="num"><fmt:formatNumber pattern="###,###,###" value="${prod_fee}"/></span>원
                                                            </span>
                                        <span class="point">+11,270 P</span>
                                    </div>
                                </div>

                                <div class="usePoint">

                                                        <span class="pointInput" style="display:none;">
                                                            <input type="text" name="useBtPt" id="useBtPt" class="inputTxt checkNum inputError colorRed" value="0"> P
                                                        </span>
                                </div>

                                </li>
                                </c:forEach>

<%--                                <li>--%>
<%--                                    <input type="hidden" name="cartSeq" value="34877$131174577" id="prdOrd1Info" $multipurtype="" $beautymemberfl="true" $prdseq="34877" $salfl="1" $salprc="35000" $sapprdcd="131174577" $beautypoint="0" $btpurfl="false" $adduppprdseq="0" $hidsalfl="" $addmaxqty="0" $prdstk="149" $ordqty="1" $ptordqty="" $ptprc="0" $prodstat="1" $maxpurqty="5" $freeqty="" $payqty="" $salchannel="A" $addprdqty="0" $ordtype="01" $cpnexfl="false" $stdprc="52000" $cpndcprc="0" $cartcpndcprc="0" $ptusenafl="false" $ptrat="1" $btyptunpaidfl="false" $stkstat="2" $purrwrdprdunpaidfl="false" $prdnm="유브이 액티브 포어리스 선스크린 x 2개 패키지" $masspurfl="true" $masspurqty="5" $masspurday="0" $envlpurlmtdbgndt="20230418" $envlpurlmtdenddt="20230430" $prdrwrdprdpmtnafl="false" $amtrwrdprdpmtnafl="false" $btyptpmtnafl="false" $btyptpmtnaflbtweek="false" $btyptusenafl="false" $ptype="P" $minpurtype="N" $minprc="0" $minpurtext="" $seedyn="N" $bogoseq="0" $catnm01="스킨케어" $catnm02="선케어" $catnm03="" $catcd01="UA" $catcd02="UAKN" $catcd3nd="" $catcd4nd01="UA" $catcd4nd="UAKN" $catcd4sw="Y" $catcd5nd01="" $catcd5nd="" $catcd5sw="N" $kindnm="IF. 유브이 액티브 포어리스 선스크린 50ml (23)" $btptuseprc="0" $catecpnyn="N" $catecdno="" $dblcpndcprc="0" $dblcartcpndcprc="0" $inmdoubcpndupprmstpcd="" $shopcartcpnprc="0" $xtraacmlbtptrat="4000" $inmspcfprdbtpnpymttpcd="1" $empprusprdyn="N" $dclmtdprdyn="N" $exgrevntprdyn="N">--%>
<%--                                    <div class="pdtRow">--%>
<%--                                        <div class="cell pdtImg">--%>




<%--                                            <a href="javascript:void(0);" onclick="window.open('/kr/ko/ProductView.do?prdSeq=34877&amp;catCd01=UA','_blank');">--%>
<%--                                                <img src="https://images.innisfree.co.kr/upload/product/34877_l_S_107.jpg?T202304251337" alt="유브이 액티브 포어리스 선스크린 x 2개 패키지 ">--%>
<%--                                            </a>--%>


<%--                                        </div>--%>
<%--                                        <div class="cell pdtInfo">--%>
<%--                                            <div class="pdtName">--%>
<%--                                                <a href="javascript:void(0);" onclick="window.open('/kr/ko/ProductView.do?prdSeq=34877&amp;catCd01=UA','_blank');">--%>
<%--                                                    유브이 액티브 포어리스 선스크린 x 2개 패키지--%>
<%--                                                </a>--%>
<%--                                            </div>--%>

<%--                                            <div class="pdtOpt">--%>

<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="cell pdtCount">1개</div>--%>
<%--                                        <div class="cell pdtPrice">--%>
<%--                                                            <span class="price">--%>
<%--                                                                <span class="num">35,000</span>원--%>
<%--                                                            </span>--%>
<%--                                            <span class="point">+4,350 P</span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <div class="usePoint">--%>

<%--                                                        <span class="pointInput" style="display:none;">--%>
<%--                                                            <input type="text" name="useBtPt" id="useBtPt" class="inputTxt checkNum inputError colorRed" value="0"> P--%>
<%--                                                        </span>--%>
<%--                                    </div>--%>
<%--                                </li>--%>

                            </ul>
                        </div>


                    </section></form>


                <!-- 쿠폰확인 & 포인트적립 -->
                <section id="cpnPt">

                    <h3 class="subTitle2">쿠폰/포인트 적용</h3>


                    <div class="tableTypeWrite typeline basicOrderCoupon">
                        <table>
                            <caption>쿠폰/포인트 적용</caption>
                            <colgroup>
                                <col style="width:214px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr id="userCouponList" class="">
                                <th scope="row">쿠폰 <span class="ftColor3">(사용 가능한 쿠폰 <span class="ftColor7" id="couponAllCnt">7장</span>)</span></th>
                                <td>
                                    <div class="selectArea" style="width: 75%;">
                                        <button type="button" class="selTit" onclick="selActive();" id="btnSelCoupon">쿠폰을 선택하세요.</button>
                                        <ul class="selList" id="cpnSelList" style="display: none;">
                                            <li $cpnseq="" $prdseq="" $cpnclcd="" $cpntpcd="" $cpnnm="" $cpnno="" $cpnprc="" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="" $mxdcamt="" $maxordamt="" $cpnprctp="" $prdnm="" $webyn="" $mobileyn="" $appyn="" $stdatetime="" $enddatetime="" $unitprc="" $prdrwrdprdpmtnafl="" $amtrwrdprdpmtnafl="" $btyptpmtnafl="" $btyptusenafl="" $idx="" $cdnm="" $cpnclnm="" $cpnorderby="" $useablecpnyn="" $inmprdcatcpntpcd="" $inmprdcatcd1="" $extradctypeyn="" $catcd="" $skttdaycpnyn="" $sktusecpnonlyyn="">
                                                <input type="radio" name="couponSeq" id="" value="" $cpnclcd="" $cpnorderby="" $useablecpnyn="" $webyn="" $mobileyn="" $appyn="" $extradctypeyn="">
                                                <label for=""><span class="couponName">쿠폰을 선택하세요.</span><em></em></label>
                                            </li>
                                            <li $cpnseq="8751" $prdseq="0" $cpnclcd="CT03" $cpntpcd="CT0301" $cpnnm="신규 가입 기념 무료 배송 쿠폰" $cpnno="MjMwMzA5MjAyNjE3MDQ0NDY=" $cpnprc="0" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="ST50" $mxdcamt="0" $maxordamt="0" $cpnprctp="2" $prdnm="" $webyn="Y" $mobileyn="Y" $appyn="Y" $stdatetime="2023-03-09 00:00" $enddatetime="2023-05-08 23:59" $unitprc="0" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="N" $btyptusenafl="N" $idx="0" $cdnm="배송비무료쿠폰" $cpnclnm="" $cpnorderby="0" $useablecpnyn="Y" $inmprdcatcpntpcd="1" $inmprdcatcd1="" $extradctypeyn="" $catcd="" $skttdaycpnyn="N" $sktusecpnonlyyn="N" id="MjMwMzA5MjAyNjE3MDQ0NDY=" style="display: block;">
                                                <input type="radio" name="couponSeq" id="userCoupon0" value="MjMwMzA5MjAyNjE3MDQ0NDY=" $cpnclcd="CT03" $cpnorderby="0" $useablecpnyn="Y" $webyn="Y" $mobileyn="Y" $appyn="Y" $extradctypeyn="" disabled="">
                                                <label for="userCoupon0"><span class="couponName">[사용불가][배송비무료쿠폰] 신규 가입 기념 무료 배송 쿠폰 (1원 이상 구매시 사용가능)</span><em>0%</em></label>
                                            </li><li $cpnseq="7414" $prdseq="0" $cpnclcd="CT03" $cpntpcd="CT0301" $cpnnm="[전등급혜택] 최초1회 무료배송" $cpnno="MjMwMzA5MjAyNjE3MDcyNTA=" $cpnprc="0" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="ST50" $mxdcamt="0" $maxordamt="0" $cpnprctp="2" $prdnm="" $webyn="Y" $mobileyn="Y" $appyn="Y" $stdatetime="2023-03-09 00:00" $enddatetime="2023-06-07 23:59" $unitprc="0" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="N" $btyptusenafl="N" $idx="0" $cdnm="배송비무료쿠폰" $cpnclnm="" $cpnorderby="1" $useablecpnyn="Y" $inmprdcatcpntpcd="1" $inmprdcatcd1="" $extradctypeyn="" $catcd="" $skttdaycpnyn="N" $sktusecpnonlyyn="N" id="MjMwMzA5MjAyNjE3MDcyNTA=" style="display: block;">
                                            <input type="radio" name="couponSeq" id="userCoupon1" value="MjMwMzA5MjAyNjE3MDcyNTA=" $cpnclcd="CT03" $cpnorderby="1" $useablecpnyn="Y" $webyn="Y" $mobileyn="Y" $appyn="Y" $extradctypeyn="" disabled="">
                                            <label for="userCoupon1"><span class="couponName">[사용불가][배송비무료쿠폰] [전등급혜택] 최초1회 무료배송 (1원 이상 구매시 사용가능)</span><em>0%</em></label>
                                        </li><li $cpnseq="21050049" $prdseq="0" $cpnclcd="posCoupon" $cpntpcd="" $cpnnm="[신규]1만원이상 2천원할인" $cpnno="21050049" $cpnprc="2000" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="" $mxdcamt="2000" $maxordamt="0" $cpnprctp="1" $prdnm="" $webyn="" $mobileyn="" $appyn="" $stdatetime="" $enddatetime="2023-05-08" $unitprc="10000" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="Y" $btyptusenafl="Y" $idx="0" $cdnm="" $cpnclnm="" $cpnorderby="6" $useablecpnyn="" $inmprdcatcpntpcd="" $inmprdcatcd1="" $extradctypeyn="N" $catcd="" $skttdaycpnyn="" $sktusecpnonlyyn="" id="21050049" style="display: block;">
                                            <input type="radio" name="couponSeq" id="userCoupon6" value="21050049" $cpnclcd="posCoupon" $cpnorderby="6" $useablecpnyn="undefined" $webyn="undefined" $mobileyn="undefined" $appyn="undefined" $extradctypeyn="">
                                            <label for="userCoupon6"><span class="couponName">[온 · 오프 통합쿠폰] [신규]1만원이상 2천원할인</span><em>-2000 원</em></label>
                                        </li><li $cpnseq="21050050" $prdseq="0" $cpnclcd="posCoupon" $cpntpcd="" $cpnnm="[신규]2만원이상 5천원할인" $cpnno="21050050" $cpnprc="5000" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="" $mxdcamt="5000" $maxordamt="0" $cpnprctp="1" $prdnm="" $webyn="" $mobileyn="" $appyn="" $stdatetime="" $enddatetime="2023-05-08" $unitprc="20000" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="Y" $btyptusenafl="Y" $idx="0" $cdnm="" $cpnclnm="" $cpnorderby="7" $useablecpnyn="" $inmprdcatcpntpcd="" $inmprdcatcd1="" $extradctypeyn="N" $catcd="" $skttdaycpnyn="" $sktusecpnonlyyn="" id="21050050" style="display: block;">
                                            <input type="radio" name="couponSeq" id="userCoupon7" value="21050050" $cpnclcd="posCoupon" $cpnorderby="7" $useablecpnyn="undefined" $webyn="undefined" $mobileyn="undefined" $appyn="undefined" $extradctypeyn="">
                                            <label for="userCoupon7"><span class="couponName">[온 · 오프 통합쿠폰] [신규]2만원이상 5천원할인</span><em>-5000 원</em></label>
                                        </li><li $cpnseq="21050051" $prdseq="0" $cpnclcd="posCoupon" $cpntpcd="" $cpnnm="[신규]3만원이상 1만원할인" $cpnno="21050051" $cpnprc="10000" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="" $mxdcamt="10000" $maxordamt="0" $cpnprctp="1" $prdnm="" $webyn="" $mobileyn="" $appyn="" $stdatetime="" $enddatetime="2023-05-08" $unitprc="30000" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="Y" $btyptusenafl="Y" $idx="0" $cdnm="" $cpnclnm="" $cpnorderby="8" $useablecpnyn="" $inmprdcatcpntpcd="" $inmprdcatcd1="" $extradctypeyn="N" $catcd="" $skttdaycpnyn="" $sktusecpnonlyyn="" id="21050051" style="display: block;">
                                            <input type="radio" name="couponSeq" id="userCoupon8" value="21050051" $cpnclcd="posCoupon" $cpnorderby="8" $useablecpnyn="undefined" $webyn="undefined" $mobileyn="undefined" $appyn="undefined" $extradctypeyn="">
                                            <label for="userCoupon8"><span class="couponName">[온 · 오프 통합쿠폰] [신규]3만원이상 1만원할인</span><em>-10000 원</em></label>
                                        </li></ul>
                                    </div>

                                    <ul class="selCouponList" id="selUserCouponList">
                                        <li style="display:none;">
                                            <span></span>
                                            <button type="button" class="btnDel" $cpnno="" $cpnclcd="">삭제</button>
                                        </li>
                                    </ul>
                                    <ul class="selCouponList" id="dlvCouponList">
                                        <li style="display:none;">
                                            <span></span>
                                            <button type="button" class="btnDel" $cpnno="" $cpnclcd="">삭제</button>
                                        </li>
                                    </ul>
                                    <ul class="selCouponList" id="prdCouponList" style="display: none;">
                                        <li style="display:none;">
                                            <span></span>
                                        </li>
                                    </ul>
                                    <ul class="bulListType2" id="cpnNotice">
                                        <li>쿠폰은 조건에 따라 적용이 되지 않을 수 있습니다.</li>
                                        <li>쿠폰 사용 후, 최종 결제 금액에 대하여 적립금이 산정/적립 됩니다. (적립금 사용분 및 배송비제외) </li>
                                        <li>쿠폰 사용 요건에 따라 사은품이 지급되지 않을 수 있습니다. 최종 주문 완료 후, &lt;마이페이지-주문내역-사은품 목록&gt;에서사은품 내역을 반드시 확인해주세요. </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="okPtChk" style="display:none;">
                                <th scope="row">OK캐쉬백 포인트 사용<button type="button" class="btnTooltip" onclick="tooltip('okcashbagPointUseInfo');">자세히 보기</button></th>
                                <td>
                                    <button type="button" class="btnType7s" id="chkOkPt">포인트 조회</button>
                                    <div class="okcashbagPoint">
                                        <input type="text" name="okPtUse" class="inputTxt checkNum" id="okPtUse" value=""><span>P /</span><span class="point" id="schOkPt">0 P</span>
                                        <button type="button" class="btnType7s chkOkPt2 okPointBtn" id="chkOkPt2">포인트 재조회</button>
                                        <button type="button" class="btnType3s okPtCancel okPointBtn" id="okPtCancel" style="display: none;">취소</button>
                                        <button type="button" class="btnType3s okPointBtn">적용</button>
                                    </div>
                                </td>
                            </tr>

                            <!-- 통합회원만  -->
                            <tr id="posGiftCard" style="display:none;">
                                <th scope="row">쇼핑카드 사용</th>
                                <td>
                                    <div class="shoppingCartPoint" $cpnclcd="" $cpnseq="" $prdseq="" $targetgoodsfg="" $overlapaplyyn="" $overlapappranking="" $mxdcamt="" $maxordamt="" $cpnnm="" $cpnno="" $apcpntype="" $cpnprc="" $cpnprctp="" $unitprc="" $stepno="" $dctype="" $enddatetime="" $prdrwrdprdpmtnafl="" $amtrwrdprdpmtnafl="" $btyptpmtnafl="" $btyptusenafl="" $idx="" $cdnm="" $cpnclnm="">
                                        <!-- <strong class="txt" id="shopPercent"> -->
                                        <span class="txt" id="shopPercent">쇼핑카드 (<span class="num">0</span>% 할인)</span>
                                        <!-- </strong> -->
                                        <span class="point">
                                                                        잔여 할인 한도 금액
                                                                        <span class="price"><span class="num" id="shopCartAmt">1,782원</span></span>
                                                                    </span>
                                        <button type="button" class="btnType7m" id="shopCartBtn">적용</button>
                                    </div>
                                    <div id="setPosGiftCardArea"></div>
                                    <ul class="bulListType2" id="shopCardNotice">
                                        <li>쿠폰 사용 후 금액에서 10% 추가 적용 가능 (단, 잔여 할인 한도 금액 내)</li>
                                        <li>할인 제외 상품 구매시 적용 불가</li>
                                        <li>적용 금액 만큼 적립 예정 적립금에서 제외 및 모든 사은품 증정 및 쿠폰 사용 기준 금액에서 제외</li>
                                        <li>한도 및 이용 내역은 마이페이지 &gt; 쇼핑카드 내역 조회에서 확인 가능</li>
                                    </ul>
                                </td>
                            </tr>



                            <!--공병수거 id 추가 -->
                            <tr class="btPtUseTr" id="btPtUseTr">
                                <th scope="row">적립금</th>
                                <td>
                                    <div class="beautyPoint">
                                        사용가능 <strong><span id="canUseBtPt">0</span></strong> P &nbsp;/&nbsp; 보유 <strong><span id="myBtPtTxt">0</span></strong> P

                                        <input type="text" class="inputTxt" name="totalUseBtPt" id="totalUseBtPt" value="0"> p
                                        <button type="button" class="btnType7m" name="useAllBtPt" id="useAllBtPt">모두사용</button>

                                    </div>
                                </td>
                            </tr>

                            <!-- [ARC] 배송비 - 뷰티포인트 결제-->
                            <tr id="totDlvPrcTr" style="display: none">
                                <th scope="row">배송비</th>
                                <td>
                                    <div class="beautyPoint">
                                        <label class="inputChk" for="deliveryCost"><input type="checkbox" id="deliveryCost"><span>적립금 사용</span></label>
                                    </div>
                                </td>
                            </tr>
                            <!-- //[ARC] 배송비 - 뷰티포인트 결제 -->
                            </tbody>
                        </table>
                    </div>
                    <div class="tableTypeWrite typeline abcCampaignChk" style="display:none;">
                        <table>
                            <caption>쿠폰/포인트 적용</caption>
                            <colgroup>
                                <col style="width:214px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">연계 구매 프로모션</th>
                                <td>
                                    <ul class="selCouponList">
                                        <li id="abcBnfTxt"></li>
                                    </ul>
                                    <ul class="bulListType2">
                                        <li>연계 구매 프로모션 적용 시 장바구니에서 쿠폰적용이 불가합니다.</li>
                                        <li>할인 쿠폰 사용을 원할 경우 연계 구매 프로모션 상품을 제외하고 분할 주문을 해주세요.</li>
                                        <li>프로모션 제품에 뷰티포인트 사용 시 연계구매 프로모션이 적용되지 않습니다.</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="okPtChk_abc">
                                <th scope="row">OK캐쉬백 포인트 사용<button type="button" class="btnTooltip" onclick="tooltip('okcashbagPointUseInfo');">자세히 보기</button></th>
                                <td>
                                    <button type="button" class="btnType7s" id="chkOkPt_abc">포인트 조회</button>
                                    <div class="okcashbagPoint">
                                        <input type="text" name="okPtUse" class="inputTxt checkNum" id="okPtUse" value=""><span>P /</span><span class="point" id="schOkPt_abc">0 P</span>
                                        <button type="button" class="btnType7s chkOkPt2 okPointBtn_abc" id="chkOkPt2_abc">포인트 재조회</button>
                                        <button type="button" class="btnType3s okPtCancel okPointBtn_abc" id="okPtCancel_abc" style="display: none;">취소</button>
                                        <button type="button" class="btnType3s okPointBtn">적용</button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>





                <div id="odGift">
                    <section id="orderGift" style="display: none;">












                        <script>
                            // $("#prdCouponList").hide();
                        </script>


                        <p class="helpWrap">
                            저희 쇼핑몰은 고객님의 안전한 거래를 위해 무통장입금/계좌이체 거래에 대해 구매안전서비스를 적용하고 있습니다.
                            <a href="https://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=innisfree" target="_blank" title="새창 열림" class="btnType5">토스페이먼츠 구매안전 서비스 가입확인</a>
                        </p>
                    </section>



                    <!-- 결제 수단 선택 -->

                    <!-- 품절 시 환불 방법 -->
                    <section id="refundMethodArea" style="display: block;">
                        <h3 class="subTitle2">품절 시 환불 방법</h3>
                        <div class="radioTab">
                            <label class="inputRadio refundPayMethod1" for="refundPayMethod1"><input type="radio" name="refundPayMethod" id="refundPayMethod1" value="PG" checked="checked"> <span>결제 수단으로 환불 받기</span></label>
                            <label class="inputRadio refundPayMethod2" for="refundPayMethod2" style="display: none;"><input type="radio" name="refundPayMethod" id="refundPayMethod2" value="ACCOUNT"> <span>계좌로 환불 받기</span></label>
                        </div>
                        <div class="refundPayMethod radioTabContents">
                            <div id="ACCOUNT" class="radioTabCont">
                                <div class="tableTypeWrite">
                                    <table>
                                        <caption>환불 은행 계좌 정보 입력</caption>
                                        <colgroup>
                                            <col style="width:210px;">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">입금은행</th>
                                            <td>
                                                <div class="selectArea" style="width:534px;">
                                                    <button type="button" class="selTit" onclick="selActive();">은행을 선택해 주세요.</button>
                                                    <ul class="selList">
                                                        <li><input type="radio" name="tempBankCd" id="bankCd00" value=""><label for="bankCd00">은행을 선택해 주세요.</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd01" value="11"><label for="bankCd01">농협</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd02" value="06"><label for="bankCd02">국민은행</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd03" value="20"><label for="bankCd03">우리은행</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd04" value="88"><label for="bankCd04">신한은행</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd05" value="03"><label for="bankCd05">기업은행</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd06" value="39"><label for="bankCd06">경남은행</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd07" value="31"><label for="bankCd07">대구은행</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd08" value="32"><label for="bankCd08">부산은행</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd09" value="07"><label for="bankCd09">수협</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd10" value="71"><label for="bankCd10">우체국</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd11" value="81"><label for="bankCd11">KEB하나</label></li>
                                                        <li><input type="radio" name="tempBankCd" id="bankCd12" value="90"><label for="bankCd12">카카오</label></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">계좌번호</th>
                                            <td>
                                                <input type="text" name="tempAccNo" class="inputTxt checkNum" title="계좌번호 입력" placeholder="‘-’제외하고 숫자만 입력해주세요." style="width:534px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">예금주명</th>
                                            <td>
                                                <input type="text" name="tempDpoSiTr" class="inputTxt" title="예금주명 입력" placeholder="예금주명을 입력해주세요." style="width:534px;">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="helpWrap">
                                    <ul class="bulListType">
                                        <li>주문취소나 품절 시 환불 받으실 계좌입니다. 빠르고 편리한 환불서비스를 위해 정확한 계좌정보를 입력해주세요.</li>
                                        <li>환불계좌는 본인명의 계좌만 등록/변경 가능합니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- //품절 시 환불 방법 -->
                </div>
                <!-- //상품 정보 -->


            </div>
            <!-- 결제 금액 정보 -->
            <div class="totalPayment">
                <div class="inner">
                    <h3 class="subTitle2">결제 예정 금액</h3>
                    <div class="box">

                        <section class="orderPrice">
                            <!-- <h4 class="subTitle2">결제정보(<em id="totOrdQtyInfo">0</em>)</h4> -->
                            <dl>
                                <dt>주문금액</dt>
                                <dd><span class="num" id="totPrdPrcTxt">162,000</span>원</dd>
                            </dl>
                            <dl>
                                <dt>할인/차감 금액</dt>
                                <dd class="totalSale"><span class="num" id="totDcCpnPrcTxt">- 0</span>원</dd>
                            </dl>
                            <div class="saleBox" style="display: none;">
                                <dl id="cpnDcDl" style="display:none;">
                                    <dt>쿠폰 할인</dt>
                                    <dd><span class="num" id="cpnDcTxt"></span>원</dd>
                                </dl>
                                <dl id="useOkPtDl" style="display:none;">
                                    <dt>OK캐쉬백 포인트 사용</dt>
                                    <dd><span class="num" id="okPtDcTxt">-0</span>원</dd>
                                </dl>
                                <dl id="abcCampDcDl" style="display:none;">
                                    <dt>연계 구매 프로모션 할인</dt>
                                    <dd><span class="num" id="abcCampDcTxt">-0</span>원</dd>
                                </dl>
                                <dl id="promotionDcDl" style="">
                                    <dt>프로모션 할인</dt>
                                    <dd><span class="num" id="promotionDcTxt">-0</span>원</dd>
                                </dl>
                                <dl id="posGiftCardDcDl" style="display:none;">
                                    <dt>쇼핑카드 사용</dt>
                                    <dd><span class="num" id="posGiftCardDcTxt"></span>원</dd>
                                </dl>
                            </div>
                            <dl id="useBtPtDl" style="display:none;">
                                <dt>뷰티포인트 사용</dt>
                                <dd><span class="num" id="totPurPtTxt">- 0</span>P</dd>
                            </dl>
                            <dl>
                                <dt>배송비</dt>
                                <dd id="totPurDlvPrcTxt" $dlvcost="2500">무료</dd>
                            </dl>
                            <!-- [ARC] 배송비 - 뷰티포인트 결제  -->
                            <div class="saleBox" id="dlvUseBtPtDiv" style="display: none;">
                                <dl id="dlvUseBtPtDl">
                                    <dt>적립금 사용</dt>
                                    <dd><span class="num" id="dlvPurPtTxt">-0</span>P</dd>
                                </dl>
                            </div>

                            <!--//[ARC] 배송비 - 뷰티포인트 결제  -->
                            <dl>
                                <dt>예정 적립금 <button type="button" class="btnTooltip" onclick="tooltip('btPointInfo3','fixed');">툴팁</button></dt>
                                <dd><span class="num" id="totReservePtTxt">+15,620</span>P</dd>
                            </dl>

                            <!-- 									<dt>적립 예정 씨드</dt> -->
                            <!-- 									<dd><span class="num" id="totAddSeedPoint">0</span>개</dd> -->
                            <!-- 								</dl> -->
                            <dl class="totalPrice">
                                <dt>최종 결제 금액</dt>
                                <dd><span class="num" id="totPurPrcTxt">162,000</span>원</dd>
                            </dl>
                            <div class="paymentAgreeWrap">

                                <div class="agree">
                                    <label class="inputChk" for="payWayProvision"><input type="checkbox" id="payWayProvision"><span>[필수] 구매 조건 및 결제 진행 동의</span></label>
                                    <p class="txt">주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매 진행에 동의 하시겠습니까? (전자상거래법 제8조 제2항)</p>
                                </div>
                                <div class="agree">
                                    <label class="inputChk VbankWayProvision" for="VbankWayProvision" style="display: none;"><input type="checkbox" id="VbankWayProvision"><span>[필수] 개인정보 수집/이용동의</span></label>
                                    <button type="button" class="btn VbankWayProvision" onclick="layerOpen('privacyTerms');" style="display: none;">개인정보 수집 자세히 보기</button>
                                </div>

                            </div>
                        </section>
                    </div>
                    <button type="button" class="btnType4xl" id="payBtn"><span class="num" id="totPurPrcBtnTxt">162,000</span>원 결제하기</button>
                </div>
            </div>
            <!-- //결제 금액 정보 -->
        </div>
    </div>
</div>

<script>
    let selActive = function() {
        let target = event.currentTarget || event.srcElement;
        let $this = $(target);
        let selWrap = $this.closest('.selectArea');
        let selList = $this.next('.selList');
        let input = selList.find('input[type="radio"]');
        let option = selList.find('li label');

        let selChk = function(txt){
            $this.removeClass('open').html(txt);
            selList.slideUp(200);
        }

        $this.addClass('open');
        selList.slideDown(200).find('li:first-child input').focus();

        input.on('keydown', function(){
            if(event.keyCode == 13) {
                let txt = $(this).next('label').html();
                selChk(txt);
            }
        })
        option.off().on('click', function(){
            if(!$(this).parent().find('input').is(":disabled")) {
                let txt = $(this).html();
                selChk(txt);
            }
        });

        selWrap.off().on('mouseleave', function(){
            selChk();
        });
    }




    // 우편번호 검색 API
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ordzipTxt').value = data.zonecode;  //우편번호
                document.getElementById("dlvAddr1stTxt").value = addr;  //주소
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("dlvAddr2ndTxt").focus();
            }
        }).open();
    }
</script>


</body>
</html>

