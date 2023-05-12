<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/hwa/order.css"/><!-- css -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 주소찾기 -->
    <!-- jQuery -->
    <%--    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>--%>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>  <!--아임포트 -->
</head>


<body>

<div id="wrap">
    <header id="orderHeader">
        <div class="orderHead">
            <h1 class="logo"><a href="/"><img  id ="logoImg" src="/img/main/logo.png" alt="dobbyisfree"></a></h1>
            <p class="helpArea">
                <strong>도움이 필요하세요?</strong>
                <span class="helpBtn">
                    <a href="/cs/notice/list" target="_blank" class="btnType1s"><span>FAQ</span></a> <!-- 고객센터, FAQ URL 추가 -->
                    <a href="/mypage/counsel/write" target="_blank" class="btnType1s"><span>1:1</span> 고객상담</a>
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

                <form id="ordForm" onsubmit="return false;">
                <section>
                    <h3 class="subTitle2">주문/배송정보</h3>
<%--                    <form id="orderInfoForm" name="orderInfoForm" method="POST" onsubmit="return false;" novalidate="novalidate">--%>
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

                                <!-- 주문자 -->
                                <tr>
                                    <th scope="row"><span class="required" aria-required="true">필수입력</span> 주문자</th>
                                    <td>
                                        <input type="text" required name="ordNmTxt" id="ordNmTxt" maxlength="10" class="inputTxt altPosition" title="이름입력" style="width: 21%;" value="${mbrDto.MBR_NM}">
                                        <p class="inputAlt"></p>
                                    </td>
                                </tr>
                                <!-- 연락처 -->
                                <tr>
                                    <th scope="row"><span  class="required" aria-required="true">필수입력</span> 연락처</th>
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
                                        <input type="text" required name="ordMblNo2" id="ordMblNo2" class="inputTxt checkNum" style="width: 22%;" value="6868" maxlength="4" title="휴대전화번호 두번째">
                                        <span class="hyphen">-</span>
                                        <input type="text" required name="ordMblNo3" id="ordMblNo3" class="inputTxt checkNum altPosition" style="width: 22%;" value="9854" maxlength="4" title="휴대전화번호 세번째">
                                        <p class="inputAlt"></p>
                                    </td>
                                </tr>
                                <!--연락처 세개로 나누는 script [010-1234-1234] -> [010] [1234] [1234] -->
                                <script>
                                    let phoneNum = '${mbrDto.MPNO}';
                                    console.log('폰넘버타입',typeof phoneNum);  //number -> ${mbrDto.MPNO}를 문자열로 감싸서 string으로 변환
                                    console.log('폰넘버', '${mbrDto.MPNO}');  // ''문자열로 감싸야 올바른 값이 찍힌다
                                    console.log('폰넘버변수', phoneNum);

                                    let num1 = phoneNum.substring(0,3);
                                    let num2 = phoneNum.substring(3,7);
                                    let num3 = phoneNum.substring(7,11);

                                    console.log("num1",num1)
                                    console.log("num2",num2)
                                    console.log("num3",num3)

                                    document.getElementById("ordMblNo1").value = num1;
                                    document.getElementById("ordMblNo2").value = num2;
                                    document.getElementById("ordMblNo3").value = num3;
                                </script>

                                <!-- 이메일 -->
                                <tr class="deliveryEmailWrap">
                                    <th scope="row"><span class="required" aria-required="true">필수입력</span> 이메일</th>
                                    <td>
                                        <input type="text" name="emailTxt" id="emailTxt" class="inputTxt altPosition" title="이메일 입력" style="width: 90%;" value="${mbrDto.EMAIL}">
                                        <p class="inputAlt"></p>
                                    </td>
                                </tr>


                                <%--                                <tr class="deliverySelWrap addrSave">--%>  <!-- 무슨 html인지 몰라서 일단 주석 -->


                                <!-- 배송지 작성 -->
                                <tr class="deliveryWriteWrap addWrite" style="display: table-row;">
                                    <th scope="row">배송지 작성</th>
                                    <td>

                                        <!-- 배송지목록에 추가, 기본배송지로 등록 -->
                                        <div class="row deliverySel"  id="chkWrapper" style="display: none">
                                            <label class="inputChk addNewDiv" for="isAddNewChk"> <input type="checkbox"   name="isAddNewChk" id="isAddNewChk"  readonly=""  checked="checked"> <span>배송지 목록에 추가</span></label>
                                            <label class="inputChk" for="isAddDefaultChk"> <input type="checkbox" name="isAddDefaultChk" id="isAddDefaultChk" ㄴ > <span>기본 배송지로 등록</span></label>
<%--                                            <button type="button" class="btnType7s" id="cancelManualAddDlvAddr">입력취소</button>--%>
                                        </div>


                                            <script>
                                                function dlvChk(radioButton) {
                                                    let chkWrapper = document.getElementById("chkWrapper");

                                                    // 신규 입력 선택
                                                    if (radioButton.id === "dlvRequest1" && radioButton.checked) {
                                                        chkWrapper.style.display = "block";
                                                    } else {
                                                        chkWrapper.style.display = "none";
                                                    }
                                                }
                                            </script>
                                        <!-- 배송지명 -->
                                        <div class="row">
                                            <label for="dlvNmTxt" class="titLabel"  style="display: block"><span class="required" aria-required="true">필수입력</span> 배송지명</label>
                                            <div class="selectArea" style="width: 90%">
                                                <button class="selTit" type="button" onclick="selActive();">배송지명 선택</button>
                                                <ul class="selList">
                                                    <li><input type="radio" id="dlvRequest1" name="dlvReqCntRadio" onclick="dlvChk(this)"><label for="dlvRequest1" >신규입력</label></li>
                                                    <%--                                                        <li><input type="radio" id="dlvRequest1" name="dlvReqCntRadio"><label for="dlvRequest1">신규입력</label></li>--%>
                                                    <%--                                                        <li><input type="radio" id="dlvRequest2" name="dlvReqCntRadio"><label for="dlvRequest2">집</label></li>--%>
                                                    <%--                                                        <li><input type="radio" id="dlvRequest3" name="dlvReqCntRadio"><label for="dlvRequest3">회사</label></li>--%>

                                                    <c:set var="loop" value="${2}" />
                                                    <c:forEach items="${dlvsList}" var="dlvsList">
                                                        <li><input onclick="dlvNmClick(this); dlvChk(this)" data-dlvpnId="${dlvsList.DLVPN_ID}" type="radio" id="dlvRequest${loop}" name="dlvReqCntRadio" ><label for="dlvRequest${loop}">${dlvsList.DLVPN_NM}</label></li>
                                                        <c:set var="loop" value="${loop + 1}" />
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <input type="text" id="dlvNmTxt" name="dlvNmTxt" maxlength="10" class="inputTxt dlvInput" style="width:90%;margin-top:4px;" placeholder="최대 10자 까지 입력 가능" >

                                            <p class="inputAlt"></p>
                                        </div>

                                        <script>
                                            //신규입력 클릭시 배송지추가버튼 보이게하기


                                            //배송지명 : 신규 입력 클릭시 입력값 처음 val로 나타내기
                                            let dlvRequest1 = document.getElementById("dlvRequest1").value;  //원래 값 변수에 저장해놓기
                                            $('#dlvRequest1').on('click', function() {
                                                console.log("신규입력 클릭확인")

                                                document.getElementById("dlvNmTxt").value = '';
                                                document.getElementById("dlvRequest1").value = '';
                                                document.getElementById("dlvRequest1").value = '';
                                                document.getElementById("rcvNmTxt").value = '';
                                                document.getElementById("ordzipTxt").value = '';
                                                document.getElementById("dlvAddr1stTxt").value = '';
                                                document.getElementById("dlvAddr2ndTxt").value = '';
                                                document.getElementById("mblNo1").value = '';
                                                document.getElementById("mblNo2").value = '';
                                                document.getElementById("mblNo3").value = '';
                                            });


                                            //-----------------------배송지명 li  클릭 ----------------------------
                                            function dlvNmClick(this1){ //this1 -> 클릭된 li > input
                                                console.log('this1',this1);
                                                console.log('this',this);

                                                const dlvpnId = this1.dataset.dlvpnid; //data 속성으로 dlvpnId 찾음
                                                console.log('dlvpnId',dlvpnId);
                                                console.log('dlvpnId 타입',typeof  dlvpnId);
                                                $.ajax({
                                                    headers: {
                                                        'Accept': 'application/json',
                                                        'Content-Type': 'application/json',
                                                    },
                                                    contentType: "application/json; charset=utf-8",
                                                    url: "/order/dlv",
                                                    type: "POST",
                                                    data: JSON.stringify( Number(dlvpnId) ),
                                                    dataType: 'json',
                                                    success: function (response) {
                                                        console.log('반환 JSON data:', response);

                                                        let dlvNm = response;

                                                        let dlvNmTxt = document.getElementById('dlvNmTxt');
                                                        let rcvNmTxt = document.getElementById('rcvNmTxt');
                                                        let ordzipTxt = document.getElementById('ordzipTxt');
                                                        let dlvAddr1stTxt = document.getElementById('dlvAddr1stTxt');
                                                        let dlvAddr2ndTxt = document.getElementById('dlvAddr2ndTxt');
                                                        let mblNo1 = document.getElementById('mblNo1');
                                                        let mblNo2 = document.getElementById('mblNo2');
                                                        let mblNo3 = document.getElementById('mblNo3');

                                                        let getPhoneNum = dlvNm.mblNo;
                                                        // let NgetPhoneNum = getPhoneNum* 1;  // * 1을 하니 맨첫번째자리 0이 제대로 형변환 되지 않았다.
                                                        // let NgetPhoneNum = Number(getPhoneNum); // 어이없어 왜 형변환을 했을까 ?
                                                        // let NgetPhoneNum = parseInt(getPhoneNum);

                                                        // 앞자리 0일 날라가는 이유 JS에서는 첫번째가 0으로 시작하면 8진수로 취급
                                                        //parseInt("01", 10) -> 10진수 변환으로 작성하면 해결


                                                        console.log('배송지명 연락처',getPhoneNum);
                                                        console.log('배송지명 연락처',typeof getPhoneNum);
                                                        // console.log('배송지명 연락처 형변환',typeof getPhoneNum);
                                                        // console.log('배송지명 연락처 형변환 값',getPhoneNum);

                                                        let getNum1 = getPhoneNum.substring(0,3); console.log("1번째",getNum1);
                                                        let getNum2 = getPhoneNum.substring(3,7); console.log("2번째",getNum2);
                                                        let getNum3 = getPhoneNum.substring(7,11); console.log("3번째",getNum3);


                                                        let getdlvNmTxt = dlvNm.dlvNm;
                                                        let getRcvNmTxt = dlvNm.rcvNm;
                                                        let getOrdzipTxt = dlvNm.ordzip;
                                                        let getDlvAddr1stTxt = dlvNm.dlvAddr1st;
                                                        let getDlvAddr2ndTxt = dlvNm.dlvAddr2nd;


                                                        document.getElementById("dlvNmTxt").value = getdlvNmTxt;
                                                        document.getElementById("rcvNmTxt").value = getRcvNmTxt;
                                                        document.getElementById("ordzipTxt").value = getOrdzipTxt;
                                                        document.getElementById("dlvAddr1stTxt").value = getDlvAddr1stTxt;
                                                        document.getElementById("dlvAddr2ndTxt").value = getDlvAddr2ndTxt;
                                                        document.getElementById("mblNo1").textContent = getNum1;
                                                        document.getElementById("mblNo2").value = getNum2;
                                                        document.getElementById("mblNo3").value = getNum3;
                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown) {
                                                        console.log('Error:', jqXHR, textStatus, errorThrown);
                                                        alert('배송지명으로 불러오기 실패');
                                                    }
                                                });<!--ajax -->
                                            }
                                        </script>

                                        <!-- 받으실 분 -->
                                        <div class="row">
                                            <label for="rcvNmTxt" class="titLabel"><span class="required" aria-required="true" required>필수입력</span> 받으실 분</label>
                                            <label class="inputChk" for="addOrdererInfo"><input type="checkbox" id="addOrdererInfo"> <span>주문자 정보와 동일</span></label>
                                            <input type="text" name="rcvNmTxt" id="rcvNmTxt" maxlength="10" class="inputTxt dlvInput" style="width:90%;margin-top:4px;"  placeholder="최대 10자 까지 입력 가능"  >
                                            <p class="inputAlt"></p>
                                        </div>

                                        <!-- 우편 번호 -->
                                        <div class="row deliveryInput">
                                            <label for="ordzipTxt" class="titLabel"><span class="required" aria-required="true">필수입력</span> 주소</label>
                                            <div class="row">
                                                <input title="우편번호" type="text" id="ordzipTxt" name="ordzipTxt" class="inputTxt ordzipTxt read-only dlvInput" style="width:13%;"  readonly="readonly" >
                                                <button type="button" class="btnType7m" onclick="sample6_execDaumPostcode()">우편번호 검색</button>
                                                <p class="inputAlt"></p>
                                            </div>
                                            <div class="row"> <!-- 기본 주소 -->
                                                <input type="text" name="dlvAddr1stTxt" id="dlvAddr1stTxt" class="inputTxt dlvAddr1stTxt altPosition read-only dlvInput" title="배송지 주소 입력" style="width:90%;" readonly="readonly" >
                                                <p class="inputAlt"></p>
                                            </div>
                                            <div class="row"> <!-- 상세 주소 -->
                                                <input type="text" name="dlvAddr2ndTxt" id="dlvAddr2ndTxt" class="inputTxt dlvAddr2ndTxt dlvInput" title="배송지 상세주소 입력" style="width:90%;"  placeholder="상세주소" >
                                                <p class="inputAlt"></p>
                                            </div>
                                        </div>

                                        <!-- 휴대폰번호 -->
                                        <div class="row mobileInput">
                                            <label for="dlvNmTxt" class="titLabel" style="width:100px"><span class="required" aria-required="true">필수입력</span> 휴대폰번호</label>

                                            <div class="selectArea" style="width:20%;">
                                                <button type="button" class="selTit dlvInput"  id="mblNo1" onclick="selActive();">010</button>
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
                                            <input type="text" name="mblNo2" id="mblNo2" maxlength="4" title="휴대전화번호 두번째" class="inputTxt checkNum dlvInput" style="width:20%;">
                                            <span class="hyphen">-</span>
                                            <input type="text" name="mblNo3" id="mblNo3" maxlength="4" title="휴대전화번호 세번째" class="inputTxt checkNum altPosition dlvInput" style="width:20%;">

                                            <p class="inputAlt"></p>
                                        </div>


                                    </td>
                                </tr>

                                <!-- 배송지 작성 -->

                                <c:if test="${empty dlvsList}">  <!-- 회원의 배송주소록이 등록되어있지 않을때 -->
                                <script>
                                    let nameDlv =  document.getElementById('dlvNmTxt');  //배송지명
                                    let rcvDlv =  document.getElementById('rcvNmTxt');   //수령인
                                    let zipDlv =  document.getElementById('ordzipTxt');  //우편번호
                                    let Addr1stDlv =  document.getElementById('dlvAddr1stTxt'); //기본주소
                                    let Addr2stDlv =  document.getElementById('dlvAddr2ndTxt'); //상세주소
                                    nameDlv.value = '';
                                    rcvDlv.value = '';
                                    zipDlv.value = '';
                                    Addr1stDlv.value = '';
                                    Addr2stDlv.value = '';
                                    </c:if>
                                </script>

                                <c:forEach var="addressList" items="${addressList}"> <!-- 기본배송지여부가 'Y'인 배송지List -->
                                    <script>
                                        let nameDlv2 =  document.getElementById('dlvNmTxt');
                                        let rcvDlv2 =  document.getElementById('rcvNmTxt');
                                        let zipDlv2 =  document.getElementById('ordzipTxt');
                                        let Addr1stDlv2 =  document.getElementById('dlvAddr1stTxt');
                                        let Addr2stDlv2 =  document.getElementById('dlvAddr2ndTxt');
                                        nameDlv2.value = '${addressList.DLVPN_NM}';
                                        rcvDlv2.value = '${addressList.RCPR}';
                                        zipDlv2.value = '${addressList.ZPCD}';
                                        Addr1stDlv2.value = '${addressList.BASIC_ADDR}';
                                        Addr2stDlv2.value = '${addressList.DTL_ADDR}';

                                        <!-- 배송주소록에 등록된 연락처 세자리 자르기 -->
                                        let rcprPhoneNum = '${addressList.RCPR_MPNO}';
                                        console.log('폰넘버타입',typeof rcprPhoneNum);
                                        console.log('폰넘버', '${addressList.RCPR_MPNO}');

                                        let rcprNum1 = rcprPhoneNum.substring(0,3);
                                        let rcprNum2 = rcprPhoneNum.substring(3,7);
                                        let rcprNum3 = rcprPhoneNum.substring(7,11);
                                        console.log("rcprNum1",rcprNum1)
                                        console.log("rcprNum2",rcprNum2)
                                        console.log("rcprNum3",rcprNum3)

                                        document.getElementById("mblNo1").textContent  = rcprNum1;
                                        document.getElementById("mblNo2").value = rcprNum2;
                                        document.getElementById("mblNo3").value = rcprNum3;
                                    </script>
                                </c:forEach>

                                <!--주문자 정보와 동일 버튼 클릭시 주문자의 이름, 연락처 가져오기 -->
                                <script>
                                    let rcvNmTxtVal = document.getElementById("rcvNmTxt").value;  //원래 값 변수에 저장해놓기
                                    let mblNo1Val = document.getElementById("mblNo1").value;
                                    let mblNo2Val = document.getElementById("mblNo2").value;
                                    let mblNo3val = document.getElementById("mblNo3").value;
                                    $('#addOrdererInfo').on('change', function() {

                                        if ($(this).is(':checked')) { //주문자 정보와 동일 체크박스 체크시

                                            document.getElementById("rcvNmTxt").value = '${mbrDto.MBR_NM}';  // 받으실 분 = 주문자 이름

                                            document.getElementById("mblNo1").value = num1; //휴대폰 번호 = 주문자 연락처
                                            document.getElementById("mblNo2").value = num2;
                                            document.getElementById("mblNo3").value = num3;
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
                                                <li><input  type="radio" id="request6" name="dlvReqCntRadio"><label for="request6">메시지 직접 입력</label></li>
                                            </ul>
                                        </div>
                                        <div class="writeMsg request">
                                            <input  type="text" id="dlvReqCntTxt" class="inputTxt" maxlength="45" style="width: 75%;" placeholder="배송 요청사항을 입력해주세요. (최대 45자까지 입력 가능)">
                                        </div>
                                    </td>
                                </tr>

                                <!-- 요청사항 메세지 직접입력 -->
                                <script>
                                    // 1. 메세지 직접입력 클릭시 .writeMsg display: none -> block으로 바뀌게 한다 (요청사항 직접입력)
                                    // 2. else이면  none으로

                                    $('input[name="dlvReqCntRadio"]').click(function() {
                                        console.log('배송요청사항 클릭확인')
                                        if (this.id !== 'request6') {
                                            console.log('this확인', this);
                                            $('.writeMsg').css('display', 'none');
                                        } else {
                                            $('.writeMsg').css('display', 'block');
                                        }
                                    });
                                </script>

                                </tbody>
                            </table>
                        </div>
<%--                    </form>--%>
                </section>



                <!-- //주문 배송 정보 -->

                <!-- 주문 상품 정보 -->
                <form id="orderForm" name="orderForm" action="" onsubmit="return false;">
                    <section id="orderChk" style="display: block;">
                        <h3 class="subTitle2">주문 상품 정보</h3>
                        <div class="cartList">
                            <ul>
                                <%--                                <c:forEach items="${orderList}" var="orderList">--%>
                                <%--                                    <c:choose>--%>
                                <%--                                    <c:when test="${orderList.DC_YN eq 'Y'}">--%>
                                <%--                                        <c:set var="prod_fee" value="${orderList.AMT * 0.9 * orderList.PROD_INDV_QTY}"/>--%>
                                <%--                                    </c:when>--%>
                                <%--                                    <c:otherwise>--%>
                                <%--                                        <c:set var="prod_fee" value="${orderList.AMT * orderList.PROD_INDV_QTY}"/>--%>
                                <%--                                    </c:otherwise>--%>
                                <%--                                        <c:set var="point" value="${prod_fee * 0.01}"/>--%>
                                <%--                                    </c:choose>--%>

                                <c:forEach items="${orderList}" var="orderList">
                                    <c:set var="prod_fee" value="${orderList.AMT * orderList.PROD_INDV_QTY}"/>
                                    <c:if test="${orderList.DC_YN eq 'Y'}">
                                        <c:set var="prod_fee" value="${prod_fee * 0.9}"/>
                                    </c:if>
                                    <c:set var="point" value="${prod_fee * 0.01}"/>

                                    <li>
                                        <div class="pdtRow">
                                            <div class="cell pdtImg">

                                                <a href="javascript:void(0);" onclick="window.open('','_blank');">
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
                                                                <span id="price" class="num"><fmt:formatNumber pattern="###,###,###" value="${prod_fee}"/></span>원
                                                            </span>
                                                <span id="point" class="point">+<fmt:formatNumber pattern="###,###,###" value="${point}"/> P</span>
                                            </div>
                                        </div>

                                        <div class="usePoint">

                                                        <span class="pointInput" style="display:none;">
                                                            <input type="text" name="useBtPt" id="useBtPt" class="inputTxt checkNum inputError colorRed" value="0"> P
                                                        </span>
                                        </div>

                                    </li>
                                </c:forEach> <!-- orderList -->



                            </ul>
                        </div>


                    </section></form>


                <!-- 쿠폰확인 & 포인트적립 -->
<%--                <section id="cpnPt">--%>

<%--                    <h3 class="subTitle2">쿠폰/포인트 적용</h3>--%>


<%--                    <div class="tableTypeWrite typeline basicOrderCoupon">--%>
<%--                        <table>--%>
<%--                            <caption>쿠폰/포인트 적용</caption>--%>
<%--                            <colgroup>--%>
<%--                                <col style="width:214px;">--%>
<%--                                <col>--%>
<%--                            </colgroup>--%>
<%--                            <tbody>--%>
<%--                            <tr id="userCouponList" class="">--%>
<%--                                <th scope="row">쿠폰 <span class="ftColor3">(사용 가능한 쿠폰 <span class="ftColor7" id="couponAllCnt">7장</span>)</span></th>--%>
<%--                                <td>--%>
<%--                                    <div class="selectArea" style="width: 75%;">--%>
<%--                                        <button type="button" class="selTit" onclick="selActive();" id="btnSelCoupon">쿠폰을 선택하세요.</button>--%>
<%--                                        <ul class="selList" id="cpnSelList" style="display: none;">--%>
<%--                                            <li $cpnseq="" $prdseq="" $cpnclcd="" $cpntpcd="" $cpnnm="" $cpnno="" $cpnprc="" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="" $mxdcamt="" $maxordamt="" $cpnprctp="" $prdnm="" $webyn="" $mobileyn="" $appyn="" $stdatetime="" $enddatetime="" $unitprc="" $prdrwrdprdpmtnafl="" $amtrwrdprdpmtnafl="" $btyptpmtnafl="" $btyptusenafl="" $idx="" $cdnm="" $cpnclnm="" $cpnorderby="" $useablecpnyn="" $inmprdcatcpntpcd="" $inmprdcatcd1="" $extradctypeyn="" $catcd="" $skttdaycpnyn="" $sktusecpnonlyyn="">--%>
<%--                                                <input type="radio" name="couponSeq" id="" value="" $cpnclcd="" $cpnorderby="" $useablecpnyn="" $webyn="" $mobileyn="" $appyn="" $extradctypeyn="">--%>
<%--                                                <label for=""><span class="couponName">쿠폰을 선택하세요.</span><em></em></label>--%>
<%--                                            </li>--%>
<%--                                            <li $cpnseq="8751" $prdseq="0" $cpnclcd="CT03" $cpntpcd="CT0301" $cpnnm="신규 가입 기념 무료 배송 쿠폰" $cpnno="MjMwMzA5MjAyNjE3MDQ0NDY=" $cpnprc="0" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="ST50" $mxdcamt="0" $maxordamt="0" $cpnprctp="2" $prdnm="" $webyn="Y" $mobileyn="Y" $appyn="Y" $stdatetime="2023-03-09 00:00" $enddatetime="2023-05-08 23:59" $unitprc="0" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="N" $btyptusenafl="N" $idx="0" $cdnm="배송비무료쿠폰" $cpnclnm="" $cpnorderby="0" $useablecpnyn="Y" $inmprdcatcpntpcd="1" $inmprdcatcd1="" $extradctypeyn="" $catcd="" $skttdaycpnyn="N" $sktusecpnonlyyn="N" id="MjMwMzA5MjAyNjE3MDQ0NDY=" style="display: block;">--%>
<%--                                                <input type="radio" name="couponSeq" id="userCoupon0" value="MjMwMzA5MjAyNjE3MDQ0NDY=" $cpnclcd="CT03" $cpnorderby="0" $useablecpnyn="Y" $webyn="Y" $mobileyn="Y" $appyn="Y" $extradctypeyn="" disabled="">--%>
<%--                                                <label for="userCoupon0"><span class="couponName">[사용불가][배송비무료쿠폰] 신규 가입 기념 무료 배송 쿠폰 (1원 이상 구매시 사용가능)</span><em>0%</em></label>--%>
<%--                                            </li><li $cpnseq="7414" $prdseq="0" $cpnclcd="CT03" $cpntpcd="CT0301" $cpnnm="[전등급혜택] 최초1회 무료배송" $cpnno="MjMwMzA5MjAyNjE3MDcyNTA=" $cpnprc="0" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="ST50" $mxdcamt="0" $maxordamt="0" $cpnprctp="2" $prdnm="" $webyn="Y" $mobileyn="Y" $appyn="Y" $stdatetime="2023-03-09 00:00" $enddatetime="2023-06-07 23:59" $unitprc="0" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="N" $btyptusenafl="N" $idx="0" $cdnm="배송비무료쿠폰" $cpnclnm="" $cpnorderby="1" $useablecpnyn="Y" $inmprdcatcpntpcd="1" $inmprdcatcd1="" $extradctypeyn="" $catcd="" $skttdaycpnyn="N" $sktusecpnonlyyn="N" id="MjMwMzA5MjAyNjE3MDcyNTA=" style="display: block;">--%>
<%--                                            <input type="radio" name="couponSeq" id="userCoupon1" value="MjMwMzA5MjAyNjE3MDcyNTA=" $cpnclcd="CT03" $cpnorderby="1" $useablecpnyn="Y" $webyn="Y" $mobileyn="Y" $appyn="Y" $extradctypeyn="" disabled="">--%>
<%--                                            <label for="userCoupon1"><span class="couponName">[사용불가][배송비무료쿠폰] [전등급혜택] 최초1회 무료배송 (1원 이상 구매시 사용가능)</span><em>0%</em></label>--%>
<%--                                        </li><li $cpnseq="21050049" $prdseq="0" $cpnclcd="posCoupon" $cpntpcd="" $cpnnm="[신규]1만원이상 2천원할인" $cpnno="21050049" $cpnprc="2000" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="" $mxdcamt="2000" $maxordamt="0" $cpnprctp="1" $prdnm="" $webyn="" $mobileyn="" $appyn="" $stdatetime="" $enddatetime="2023-05-08" $unitprc="10000" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="Y" $btyptusenafl="Y" $idx="0" $cdnm="" $cpnclnm="" $cpnorderby="6" $useablecpnyn="" $inmprdcatcpntpcd="" $inmprdcatcd1="" $extradctypeyn="N" $catcd="" $skttdaycpnyn="" $sktusecpnonlyyn="" id="21050049" style="display: block;">--%>
<%--                                            <input type="radio" name="couponSeq" id="userCoupon6" value="21050049" $cpnclcd="posCoupon" $cpnorderby="6" $useablecpnyn="undefined" $webyn="undefined" $mobileyn="undefined" $appyn="undefined" $extradctypeyn="">--%>
<%--                                            <label for="userCoupon6"><span class="couponName">[온 · 오프 통합쿠폰] [신규]1만원이상 2천원할인</span><em>-2000 원</em></label>--%>
<%--                                        </li><li $cpnseq="21050050" $prdseq="0" $cpnclcd="posCoupon" $cpntpcd="" $cpnnm="[신규]2만원이상 5천원할인" $cpnno="21050050" $cpnprc="5000" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="" $mxdcamt="5000" $maxordamt="0" $cpnprctp="1" $prdnm="" $webyn="" $mobileyn="" $appyn="" $stdatetime="" $enddatetime="2023-05-08" $unitprc="20000" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="Y" $btyptusenafl="Y" $idx="0" $cdnm="" $cpnclnm="" $cpnorderby="7" $useablecpnyn="" $inmprdcatcpntpcd="" $inmprdcatcd1="" $extradctypeyn="N" $catcd="" $skttdaycpnyn="" $sktusecpnonlyyn="" id="21050050" style="display: block;">--%>
<%--                                            <input type="radio" name="couponSeq" id="userCoupon7" value="21050050" $cpnclcd="posCoupon" $cpnorderby="7" $useablecpnyn="undefined" $webyn="undefined" $mobileyn="undefined" $appyn="undefined" $extradctypeyn="">--%>
<%--                                            <label for="userCoupon7"><span class="couponName">[온 · 오프 통합쿠폰] [신규]2만원이상 5천원할인</span><em>-5000 원</em></label>--%>
<%--                                        </li><li $cpnseq="21050051" $prdseq="0" $cpnclcd="posCoupon" $cpntpcd="" $cpnnm="[신규]3만원이상 1만원할인" $cpnno="21050051" $cpnprc="10000" cpnprctp="" $pritemnm="" $pritemseqstr="" $dctpcd="" $mxdcamt="10000" $maxordamt="0" $cpnprctp="1" $prdnm="" $webyn="" $mobileyn="" $appyn="" $stdatetime="" $enddatetime="2023-05-08" $unitprc="30000" $prdrwrdprdpmtnafl="N" $amtrwrdprdpmtnafl="N" $btyptpmtnafl="Y" $btyptusenafl="Y" $idx="0" $cdnm="" $cpnclnm="" $cpnorderby="8" $useablecpnyn="" $inmprdcatcpntpcd="" $inmprdcatcd1="" $extradctypeyn="N" $catcd="" $skttdaycpnyn="" $sktusecpnonlyyn="" id="21050051" style="display: block;">--%>
<%--                                            <input type="radio" name="couponSeq" id="userCoupon8" value="21050051" $cpnclcd="posCoupon" $cpnorderby="8" $useablecpnyn="undefined" $webyn="undefined" $mobileyn="undefined" $appyn="undefined" $extradctypeyn="">--%>
<%--                                            <label for="userCoupon8"><span class="couponName">[온 · 오프 통합쿠폰] [신규]3만원이상 1만원할인</span><em>-10000 원</em></label>--%>
<%--                                        </li></ul>--%>
<%--                                    </div>--%>

<%--                                    <ul class="selCouponList" id="selUserCouponList">--%>
<%--                                        <li style="display:none;">--%>
<%--                                            <span></span>--%>
<%--                                            <button type="button" class="btnDel" $cpnno="" $cpnclcd="">삭제</button>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                    <ul class="selCouponList" id="dlvCouponList">--%>
<%--                                        <li style="display:none;">--%>
<%--                                            <span></span>--%>
<%--                                            <button type="button" class="btnDel" $cpnno="" $cpnclcd="">삭제</button>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                    <ul class="selCouponList" id="prdCouponList" style="display: none;">--%>
<%--                                        <li style="display:none;">--%>
<%--                                            <span></span>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                    <ul class="bulListType2" id="cpnNotice">--%>
<%--                                        <li>쿠폰은 조건에 따라 적용이 되지 않을 수 있습니다.</li>--%>
<%--                                        <li>쿠폰 사용 후, 최종 결제 금액에 대하여 적립금이 산정/적립 됩니다. (적립금 사용분 및 배송비제외) </li>--%>
<%--                                        <li>쿠폰 사용 요건에 따라 사은품이 지급되지 않을 수 있습니다. 최종 주문 완료 후, &lt;마이페이지-주문내역-사은품 목록&gt;에서사은품 내역을 반드시 확인해주세요. </li>--%>
<%--                                    </ul>--%>
<%--                                </td>--%>
<%--                            </tr>--%>




<%--                            <tr class="btPtUseTr" id="btPtUseTr">--%>
<%--                                <th scope="row">적립금</th>--%>
<%--                                <td>--%>
<%--                                    <div class="beautyPoint">--%>
<%--                                        사용가능 <strong><span id="canUseBtPt">0</span></strong> P &nbsp;/&nbsp; 보유 <strong><span id="myBtPtTxt">0</span></strong> P--%>

<%--                                        <input type="text" class="inputTxt" name="totalUseBtPt" id="totalUseBtPt" value="0"> p--%>
<%--                                        <button type="button" class="btnType7m" name="useAllBtPt" id="useAllBtPt">모두사용</button>--%>

<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>

<%--                            <!-- [ARC] 배송비 - 뷰티포인트 결제-->--%>
<%--                            <tr id="totDlvPrcTr" style="display: none">--%>
<%--                                <th scope="row">배송비</th>--%>
<%--                                <td>--%>
<%--                                    <div class="beautyPoint">--%>
<%--                                        <label class="inputChk" for="deliveryCost"><input type="checkbox" id="deliveryCost"><span>적립금 사용</span></label>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                    <div class="tableTypeWrite typeline abcCampaignChk" style="display:none;">--%>
<%--                        <table>--%>
<%--                            <caption>쿠폰/포인트 적용</caption>--%>
<%--                            <colgroup>--%>
<%--                                <col style="width:214px;">--%>
<%--                                <col>--%>
<%--                            </colgroup>--%>
<%--                            <tbody>--%>
<%--                            <tr>--%>
<%--                                <th scope="row">연계 구매 프로모션</th>--%>
<%--                                <td>--%>
<%--                                    <ul class="selCouponList">--%>
<%--                                        <li id="abcBnfTxt"></li>--%>
<%--                                    </ul>--%>
<%--                                    <ul class="bulListType2">--%>
<%--                                        <li>연계 구매 프로모션 적용 시 장바구니에서 쿠폰적용이 불가합니다.</li>--%>
<%--                                        <li>할인 쿠폰 사용을 원할 경우 연계 구매 프로모션 상품을 제외하고 분할 주문을 해주세요.</li>--%>
<%--                                        <li>프로모션 제품에 뷰티포인트 사용 시 연계구매 프로모션이 적용되지 않습니다.</li>--%>
<%--                                    </ul>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr class="okPtChk_abc">--%>
<%--                                <th scope="row">OK캐쉬백 포인트 사용<button type="button" class="btnTooltip" onclick="tooltip('okcashbagPointUseInfo');">자세히 보기</button></th>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="btnType7s" id="chkOkPt_abc">포인트 조회</button>--%>
<%--                                    <div class="okcashbagPoint">--%>
<%--                                        <input type="text" name="okPtUse" class="inputTxt checkNum" id="okPtUse" value=""><span>P /</span><span class="point" id="schOkPt_abc">0 P</span>--%>
<%--                                        <button type="button" class="btnType7s chkOkPt2 okPointBtn_abc" id="chkOkPt2_abc">포인트 재조회</button>--%>
<%--                                        <button type="button" class="btnType3s okPtCancel okPointBtn_abc" id="okPtCancel_abc" style="display: none;">취소</button>--%>
<%--                                        <button type="button" class="btnType3s okPointBtn">적용</button>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                </section>--%>





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
<%--                        <div class="radioTab">--%>
<%--                            <label class="inputRadio refundPayMethod1" for="refundPayMethod1"><input type="radio" name="refundPayMethod" id="refundPayMethod1" value="PG" checked="checked"> <span>결제 수단으로 환불 받기</span></label>--%>
<%--                            <label class="inputRadio refundPayMethod2" for="refundPayMethod2" style="display: none;"><input type="radio" name="refundPayMethod" id="refundPayMethod2" value="ACCOUNT"> <span>계좌로 환불 받기</span></label>--%>
<%--                        </div>--%>
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
                                                    <button type="button" class="selTit" onclick="selActive();" id="bank">은행을 선택해 주세요.</button>
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
                                                <input type="text" name="tempAccNo" id="tempAccNo" class="inputTxt checkNum" title="계좌번호 입력" placeholder="‘-’제외하고 숫자만 입력해주세요." style="width:534px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">예금주명</th>
                                            <td>
                                                <input type="text" name="tempDpoSiTr" id="tempDpoSiTr" class="inputTxt" title="예금주명 입력" placeholder="예금주명을 입력해주세요." style="width:534px;">
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
                </form><!--ordForm -->

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
                                <dd><span class="num" id="totPrdPrcTxt"></span>원</dd>
                            </dl>
                            <dl>
                                <dt>할인/차감 금액</dt>
                                <dd class="totalSale"><span class="num" id="totDcCpnPrcTxt">0</span>원</dd>
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
                                <%--                                <dd id="totPurDlvPrcTxt" $dlvcost="2500"></dd>--%>
                                <dd id="totalDlvTxt" $dlvcost="2500"><span class="num" id="totPurDlvPrcTxt">- 0</span>원</dd>
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
                                <dd><span class="num" id="totReservePtTxt"></span>P</dd>
                            </dl>

                            <!-- 									<dt>적립 예정 씨드</dt> -->
                            <!-- 									<dd><span class="num" id="totAddSeedPoint">0</span>개</dd> -->
                            <!-- 								</dl> -->
                            <dl class="totalPrice">
                                <dt>최종 결제 금액</dt>
                                <dd><span class="num" id="totPurPrcTxt"></span>원</dd>
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
                    <button type="button" class="btnType4xl" id="payBtn"><span class="num" id="totPurPrcBtnTxt"></span>원 결제하기</button>
                </div>
            </div>
            <!-- //결제 금액 정보 -->
        </div>
    </div>
</div>

<script>

    // 이니스프리 select script
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

    //결제박스
    function setTotalInfo() {

        let totalOrdPrc = 0;  //주문금액
        let totalDlvCost = 0;  // 배송비
        let totalPt = 0;  // 예정 적립금
        let totalPrc = 0; // 최종 결제 금액
        let dcPrc = 0;  // 할인,차감 금액
        let prodPrc = 0; // 상품별 금액
        let amt = 0; //상품별 금액
        let pt = 0; //개별 적립금

        $(".pdtRow").each(function (index, element) {

            //장바구니와 달리 장바구니에서 최종으로 넘어온 값들이기 때문에 상품별 금액을 총 더함 = 주문금액
            // @주문금액 = 총 금액 ( +=상품최종가격 );
            // @배송비 = 최종 결제 금액이 2만원 이상 = 0;
            // @예정적립금 = (+= point )


            // prodPrc = $(element).find("#price").text();  // 상품별 가격
            // console.log('상품가격 type',typeof prodPrc); // string
            // prodPrc = parseInt($(element).find("#price").text());  // string -> int
            prodPrc =  parseInt($(element).find("#price").text().replace(/,/g, ""));
            console.log('상품가격',prodPrc);

            totalOrdPrc += prodPrc;
            console.log('주문금액',totalOrdPrc);

            // pt =  parseInt($(element).find("#point").text().replace(/,/g, ""));
            // totalPt += pt;


        });


        //@최종결제금액 = 주문금액 - 할인/차감금액
        // 아직 쿠폰 적립금이 적용안된 상태 -> 할인/차감금액 빼기 없이 주문금액으로 대체
        totalPrc = totalOrdPrc;

        //예정적립금 = 최종결제금액  * 0.01 (할인.차감금액이 적용된 상태에서 1% 적립)
        totalPt = totalPrc * 0.01;

        // 주문금액 2만원이상시 배송비 무료
        if (totalPrc >= 20000) {
            totalDlvCost = 0;
        } else {
            totalDlvCost = 2500;
        }
        console.log('배송비', totalDlvCost);

        $("#totPrdPrcTxt").text(totalOrdPrc.toLocaleString());  //주문금액
        $("#totPurDlvPrcTxt").text(totalDlvCost.toLocaleString());  //배송비
        $("#totReservePtTxt").text(totalPt.toLocaleString());  //예정적립금
        $("#totPurPrcTxt").text((totalPrc + totalDlvCost).toLocaleString() ); //최종결제금액
        $("#totPurPrcBtnTxt").text(totalPrc.toLocaleString()); // 결제하기 버튼
    }


    function order_Id(){
        const date = new Date();
        const year = date.getFullYear().toString();
        const month = (date.getMonth() + 1).toString().padStart(2, '0');  //0부터시작 +1 ,한자리숫자로 나오는거 padStart로 수정
        const day = date.getDate().toString().padStart(2, '0');


        let orderNum = year + month + day;
        for(let i=0;i<6;i++) {
            orderNum += Math.floor(Math.random() * 8);
        }

        return orderNum;
    }
    const orderId = order_Id();
    console.log("주문번호",orderId);



    //input태그
            function input(){

                let ordForm = $("<form>").attr('method', 'POST').attr('action', '/order/done'); //폼생성

                let ordNmTxtVal = $('#ordNmTxt').val(); //주문자
                let inputOrdNmTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputOrdNmTxt').val(ordNmTxtVal).appendTo(ordForm); //주문자

                let ordMblNo1Val = $('#ordMblNo1').text();
                let ordMblNo2Val = $('#ordMblNo2').val();
                let ordMblNo3tVal = $('#ordMblNo3').val();
                let ordMblNoVal = ordMblNo1Val + ordMblNo2Val+ ordMblNo3tVal; //주문자 연락처
                let inputOrdMblNo = $('<input>').attr('type', 'hidden').attr('name', 'inputOrdMblNo').val(ordMblNoVal).appendTo(ordForm); //주문자 연락처 1+2+3

                let emailTxtVal = $('#emailTxt').val();
                let inputEmailTxt  = $('<input>').attr('type', 'hidden').attr('name', 'inputEmailTxt').val(emailTxtVal).appendTo(ordForm);  // 주문자 이메일

                let dlvNmTxtVal = $('#dlvNmTxt').val();  //배송지명
                let inputDlvNmTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputDlvNmTxt').val(dlvNmTxtVal).appendTo(ordForm);  // 배송지명

                let rcvNmTxtVal = $('#rcvNmTxt').val();  //받으실분
                let inputRcvNmTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputRcvNmTxt').val(rcvNmTxtVal).appendTo(ordForm); //받으실분

                let ordzipTxtVal = $('#ordzipTxt').val(); //우편번호
                let inputOrdzipTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputOrdzipTxt').val(ordzipTxtVal).appendTo(ordForm); //우편번호

                let dlvAddr1stTxtVal = $('#dlvAddr1stTxt').val(); // 기본주소
                let inputDlvAddr1stTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputDlvAddr1stTxt').val(dlvAddr1stTxtVal).appendTo(ordForm);  //기본주소

                let dlvAddr2ndTxtVal = $('#dlvAddr2ndTxt').val(); // 상세주소
                let inputDlvAddr2ndTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputDlvAddr2ndTxt').val(dlvAddr2ndTxtVal).appendTo(ordForm);  //상세주소

                let mblNo1Val = $('#mblNo1').text();
                let mblNo2Val = $('#mblNo2').val();
                let mblNo3Val = $('#mblNo3').val();

                let mblNoVal = mblNo1Val + mblNo2Val + mblNo3Val; // 수령인 연락처
                let inputMblNoVal = $('<input>').attr('type', 'hidden').attr('name', 'inputMblNoVal').val(mblNoVal).appendTo(ordForm);  //수령인연락처 1 + 2 + 3

                let dlvReqCntTxtVal = $('#dlvReqCntTxt').val(); //배송 요청사항
                let inputDlvReqCntTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputDlvReqCntTxt').val(dlvReqCntTxtVal).appendTo(ordForm);  //배송요청사항

                let bankVal = $('#bank').text();  //은행
                let inputBank = $('<input>').attr('type', 'hidden').attr('name', 'inputBank').val(bankVal).appendTo(ordForm);  //은행

                let tempAccNoVal = $('#tempAccNo').val(); // 계좌번호
                let inputTempAccNo = $('<input>').attr('type', 'hidden').attr('name', 'inputTempAccNo').val(tempAccNoVal).appendTo(ordForm);   //계좌번호

                let tempDpoSiTrVal = $('#tempDpoSiTr').val();  //예금주
                let inputTempDpoSiTr = $('<input>').attr('type', 'hidden').attr('name', 'inputTempDpoSiTr').val(tempDpoSiTrVal).appendTo(ordForm); //예금주명

                let totPrdPrcTxtVal = parseInt($('#totPrdPrcTxt').text().replace(/,/g, "")); //주문금액
                let inputTotPrdPrcTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputTotPrdPrcTxt').val(totPrdPrcTxtVal).appendTo(ordForm); //주문금액

                let totPurPrcTxtVal = parseInt($('#totPurPrcTxt').text().replace(/,/g, ""));  //결제금액
                let inputTotPurPrcTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputTotPurPrcTxt').val(totPurPrcTxtVal).appendTo(ordForm); //결제금액

                let totDcCpnPrcTxtVal = parseInt($('#totDcCpnPrcTxt').text().replace(/,/g, "")); //할인,차감금액
                let inputTotDcCpnPrcTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputTotDcCpnPrcTxt').val(totDcCpnPrcTxtVal).appendTo(ordForm);  //할인차감금액

                let totReservePtTxtVal = parseInt($('#totReservePtTxt').text().replace(/,/g, "")); //적립금
                let inputTotReservePtTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputTotReservePtTxt').val(totReservePtTxtVal).appendTo(ordForm); //적립금

                let totPurDlvPrcTxtVal = parseInt($('#totPurDlvPrcTxt').text().replace(/,/g, "")); //배송비
                let inputTotPurDlvPrcTxt = $('<input>').attr('type', 'hidden').attr('name', 'inputTotPurDlvPrcTxt').val(totPurDlvPrcTxtVal).appendTo(ordForm);//배송비

                let inputOrdId = $('<input>').attr('type', 'hidden').attr('name', 'inputOrdId').val(orderId).appendTo(ordForm);//주문번호
                console.log('inputTotPurPrcTxt',totPrdPrcTxtVal);
                console.log('inputTotPurPrcTxt',totPurPrcTxtVal);
                console.log('totDcCpnPrcTxtVal',totDcCpnPrcTxtVal);
                console.log('totReservePtTxtVal',totReservePtTxtVal);
                console.log('totPurDlvPrcTxtVal',totPurDlvPrcTxtVal);

                let isAddNewChkVal = document.getElementById("isAddNewChk").checked ? "Y" : "N";
                let inputIsAddNewChk = $('<input>').attr('type', 'hidden').attr('name', 'inputIsAddNewChk').val(isAddNewChkVal).appendTo(ordForm);

                let isAddDefaultChkVal = document.getElementById("isAddDefaultChk").checked ? "Y" : "N";
                console.log('기본배송치체크',isAddDefaultChkVal);
                let inputIsAddDefaultChk = $('<input>').attr('type', 'hidden').attr('name', 'inputIsAddDefaultChk').val(isAddDefaultChkVal).appendTo(ordForm);


                // if (ordNmTxtVal.trim() === "") { // Check if the value is empty or contains only whitespace
                //     alert('Please enter the ID.');
                //     $('#ordNmTxt').focus();
                //     return false;
                // }
                $(document.body).append(ordForm);
                ordForm.submit();

            } //input()

    function submit() {

    }



    //------------------------------------------------------------------------------------------
    //결제 API
$("#payBtn").click(function() {
    // function validation() {
        let ordNmTxt = document.getElementById("ordNmTxt").value.trim(); //주문자
        let ordMblNo2 = document.getElementById("ordMblNo2").value.trim(); //연락처2
        let ordMblNo3 = document.getElementById("ordMblNo3").value.trim(); //연락처2
        let emailTxt = document.getElementById("emailTxt").value.trim(); //주문자 이메일
        let dlvNmTxt = document.getElementById("dlvNmTxt").value.trim(); // 배송지명
        let rcvNmTxt = document.getElementById("rcvNmTxt").value.trim(); //수령인
        let ordzipTxt = document.getElementById("ordzipTxt").value.trim(); //우편번호
        let dlvAddr1stTxt = document.getElementById("dlvAddr1stTxt").value.trim(); //기본주소
        let mblNo2 = document.getElementById("mblNo2").value.trim(); //수령인 연락처2
        let mblNo3 = document.getElementById("mblNo3").value.trim(); //연락처3
        let bank = document.getElementById("bank").textContent; //은행
        let bankLabel = document.querySelector("label[for='bankCd00']").textContent;//은행 li(0)
        let tempAccNo = document.getElementById("tempAccNo").value.trim(); //계좌
        let tempDpoSiTr = document.getElementById("tempDpoSiTr").value.trim(); //예금주


    // }



    console.log('버튼클릭확인');
        let agreeChk = document.getElementById('payWayProvision');
        if(agreeChk.checked){ //동의여부 체크해야만
            if (ordNmTxt === "") {
                alert('주문자 이름을 입력해주세요');
                $('#ordNmTxt').focus();
                return false;
            }

            if (ordMblNo2 === "") {
                alert('전화번호를 입력해주세요');
                $('#ordMblNo2').focus();
                return false;
            }
            if (ordMblNo3 === "") {
                alert('전화번호를 입력해주세요');
                $('#ordMblNo3').focus();
                return false;
            }
            if (emailTxt === "") {
                alert('이메일을 입력해주세요');
                $('#emailTxt').focus();
                return false;
            }
            if (dlvNmTxt === "") {
                alert('배송지명을 입력해주세요');
                $('#dlvNmTxt').focus();
                return false;
            }
            if (rcvNmTxt === "") {
                alert('받으실분을 입력해주세요');
                $('#rcvNmTxt').focus();
                return false;
            }
            if (ordzipTxt === "") {
                alert('우편번호를 입력해주세요');
                $('#ordzipTxt').focus();
                return false;
            }
            if (dlvAddr1stTxt === "") {
                alert('주소를 입력해주세요');
                $('#ordNmTxt').focus();
                return false;
            }
            if (mblNo2 === "") {
                alert('받으실분 연락처를 입력해주세요');
                $('#mblNo2').focus();
                return false;
            }
            if (mblNo3 === "") {
                alert('받으실분 연락처를 입력해주세요');
                $('#mblNo3').focus();
                return false;
            }
            if (bank === bankLabel) {
                alert('환불받으실 은행을 선택해주세요');
                // $('#bank').focus();
                return false;
            }
            if (tempAccNo === "") {
                alert('환불받으실 계좌번호를 입력해주세요');
                $('#tempAccNo').focus();
                return false;
            }
            if (tempDpoSiTr === "") {
                alert('환불받으실 계좌의 예금자명을 입력해주세요');
                $('#tempDpoSiTr').focus();
                return false;
            }


            let zipDlvPay =  document.getElementById('ordzipTxt').value;
            let Addr1stDlvPay =  document.getElementById('dlvAddr1stTxt').value;
            let totPurPrcTxt =  parseInt(document.getElementById('totPurPrcTxt').textContent.replace(/,/g, ""));

            console.log("결제 우편 ",typeof zipDlvPay);
            console.log("결제 주소",typeof Addr1stDlvPay);
            console.log("결제 금액",typeof totPurPrcTxt);
            console.log("결제 금액 최종값", totPurPrcTxt);

            // input();


            IMP.init('imp21837643');
            IMP.request_pay({
                pg : 'html5_inicis.INIpayTest',  //pg사 - kg이니시스
                pay_method : 'card',       //결제방법 - 카드
                // merchant_uid : 'merchant_' + new Date().getTime(),  //주문아이디
                merchant_uid : orderId,  //주문아이디
                // name : '주문명:결제테스트', //주문명
                name : '도비스프리 결제',
                // amount :  totPurPrcTxt, //상품가격 - Number()
                amount :  100, //상품가격  -----**********test 용 100원************
                buyer_email : '${mbrDto.EMAIL}',     //주문자 이메일
                buyer_name : '${mbrDto.MBR_NM}',     //주문자
                buyer_tel :  '${mbrDto.MPNO}',       //주문자연락처
                buyer_addr : Addr1stDlvPay,            //주문자 우편번호
                buyer_postcode :zipDlvPay        //주문자 기본주소
            }, function(rsp) {  //-------콜백함수
                let result = '';
                if ( rsp.success ) {
                    let msg ='';
                    result ='0';
                } else {
                    // let msg = '결제에 실패하였습니다.';
                    msg = '결제에 실패하였습니다.';
                    msg +=  rsp.error_msg;
                    result ='1';
                }
                if(result==='0') {
                    // msg = '결제가 완료되었습니다.';
                    // msg += '고유ID : ' + rsp.imp_uid;  //가맹점번호
                    // msg += '상점 거래ID : ' + rsp.merchant_uid;
                    // msg += '결제 금액 : ' + rsp.paid_amount;
                    // msg += '카드 승인번호 : ' + rsp.apply_num;
                    input();

                    alert("결제가 성공하였습니다")
                }
                alert(msg);
            });//rsp

    } else{ //체크 X면
            alert("동의하셔야 결제할 수 있습니다")
            return false;
    }
}); //payBtn click





    //---------------------------------------------------------------------------------------------------------------------
    $(document).ready(function () {
        setTotalInfo();
        //나중에 포인트 쿠폰 적용 클릭 이벤트시에도 결제박스계산 함수 호출하기 (나중에)

    });
</script>

</body>
</html>

