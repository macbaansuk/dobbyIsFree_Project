<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>MyPage - 1:1 상담</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/soo/mypage_counsel_write.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style></style>
</head>

<body>
<jsp:include page="../header.jsp" />

<div class="mypage">
    <div id="mypageTop">
        <jsp:include page="../mypage_header.jsp" />
    </div>

    <div id="container">
        <div id="menu">
            <a href="#"><p>주문/배송현황</p></a>
            <a href="#"><p>뷰티포인트</p></a>
            <a href="#"><p>찜한 제품</p></a>
            <a href="#"><p>내 리뷰</p></a>
            <a href="/mypage/counsel/list"><p>1:1 상담내역</p></a>
            <a href="#"><p>공병수거 캠페인</p></a>
            <a href="#"><p>회원정보 수정</p></a>
            <a href="#"><p>배송지 관리</p></a>
        </div>
        <div id="page">
            <h2>1:1 상담내역</h2>
            <div class="tab">
                <ul class="cate">
                    <li id="W">
                        <a href="/mypage/counsel/write"><span>1:1 상담작성</span></a>
                    </li>
                    <li id="L">
                        <a href="/mypage/counsel/list"><span>답변확인</span></a>
                    </li>
                </ul>
            </div>

            <div class="counselInfo">
            <span class="img">
              <img src="/img/soo/bubble.png" width="50px" />
            </span>
                <span class="infoDetail">
              <p class="txt1">1:1 고객상담전에 꼭! 확인해주세요</p>
              <p>
                질문하신 질문의 답변은 개인 메일이나 마이페이지 > 내
                상담내역에서 답변내용을 확인 하실 수 있습니다.
                <br />
                1:1 고객문의 처리시간은 09:00 ~18:00 입니다. (문의는 24시간
                언제나 가능합니다.)
                <br />
                최단시간 내에 접수사항을 조치하여 해결해 드리도록 하겠습니다.
                <br />
                피해 발생시에는 공정거래위원회 소비자분쟁해결기준에 의거해서
                처리됩니다.
              </p>
              <p class="txt2">
                상담내용 본문에는 개인정보를 입력하지 말아주세요. 고객정보
                보호를 위해 마스킹 처리될 수 있습니다.
                <br />
                (예: 성명, 연락처, 이메일주소, 계좌번호 등)
              </p>
            </span>
            </div>

            <form id="writeForm" method="post">
                <input type="hidden" name="MBR_ID" value="${memberDto.MBR_ID}"/>

                <div class="tableForm">
                    <table>
                        <colgroup>
                            <col style="width: 25%" />
                            <col style="width: 75%" />
                        </colgroup>

                        <tbody>
                        <tr>
                            <th scope="col">이름</th>
                            <td>${memberDto.MBR_NM}</td>
                        </tr>
                        <tr>
                            <th scope="col"><span class="required"></span>상담구분</th>
                            <td class="">
                                <select name="CATE_ID" id="counList"  onclick="showOptions()">
                                    <option value="" selected>선택하세요</option>
                                    <option value="C01" ${counselDto.CATE_ID == 'C01' ? 'selected' : ''}>상품문의</option>
                                    <option value="C02" ${counselDto.CATE_ID == 'C02' ? 'selected' : ''}>주문문의</option>
                                    <option value="C03" ${counselDto.CATE_ID == 'C03' ? 'selected' : ''}>결제문의</option>
                                    <option value="C04" ${counselDto.CATE_ID == 'C04' ? 'selected' : ''}>배송문의</option>
                                    <option value="C05" ${counselDto.CATE_ID == 'C05' ? 'selected' : ''}>취소문의</option>
                                    <option value="C06" ${counselDto.CATE_ID == 'C06' ? 'selected' : ''}>반품문의</option>
                                    <option value="C07" ${counselDto.CATE_ID == 'C07' ? 'selected' : ''}>교환문의</option>
                                    <option value="C08" ${counselDto.CATE_ID == 'C08' ? 'selected' : ''}>기타문의</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>문의제품</th>
                            <td>
                                <button id="prodSearchBtn" >제품 찾기</button>
                                <input id="prodName_input" name="prodName"  readonly>
                                <input id="prodId_input" name="prodId" type="hidden">
                            </td>
                        </tr>

                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" value="${counselDto.TTL}" id="title" name="TTL" placeholder="제목을 입력해 주세요."/>
                            </td>
                        </tr>
                        <tr>
                            <th id="content">내용</th>
                            <td>
                                <textarea name="CN" placeholder="내용을 입력해 주세요.">${counselDto.CN}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <button id="imgBtn">사진첨부 (최대3개)</button>
                            </td>
                        </tr>

                        <tr>
                            <th id="phone">휴대전화 번호</th>
                            <td>
                                <input type="text" id="phoneNum1"/>
                                <p class="hyphen">-</p>
                                <input type="text" id="phoneNum2"/>
                                <p class="hyphen">-</p>
                                <input type="text" id="phoneNum3"/>
                                <br>
                                <p class="push">
                                    <span>답변결과를 SMS로 받으시겠습니까? </span>
                                    <label>
                                        <input type="radio" name="RX" value="Y">
                                        <span>예</span>
                                    </label>
                                    <label>
                                        <input type="radio" name="RX" value="N">
                                        <span>아니오</span>
                                    </label>
                                </p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>

            <div class="bottom_info">
                <p>
                    *휴대전화번호 정보 수정을 원하시는 경우 회원정보 수정을 통해 변경해주시기 바랍니다.
                </p>
            </div>

            <div class="btnList">
                <button type="submit" id="regBtn">작성완료</button>
                <button id="canBtn">취소</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp" />
</body>

<script>
    function showOptions() {
        // 셀렉트 박스의 옵션 목록을 보이게 함
        document.getElementById("counList").size = "1";

        // "선택하세요" 옵션 숨김 처리
        document.querySelector("#counList option[value='']").style.display = "none";

        // 옵션을 선택하면 옵션 목록을 다시 숨김 처리하고 선택한 옵션으로 대체
        document.getElementById("counList").onchange = function () {
            document.getElementById("counList").size = "1";
        };
    }

    document.getElementById("counList").onchange = function () {
        document.getElementById("counList").size = "1";
    };



// 핸드폰 번호, phone 변수에 저장
    let phone = '${memberDto.MPNO}';
    // 3개로 쪼개서 저장
    let num1 = phone.substring(0,3);
    let num2 = phone.substring(3,7);
    let num3 = phone.substring(7,11);
    // id로 지정 후 value의 값 넣어주기
    document.getElementById("phoneNum1").value = num1;
    document.getElementById("phoneNum2").value = num2;
    document.getElementById("phoneNum3").value = num3;

    // SMS 수신여부(radio)
    var counselDto = {};
    counselDto.RX = "";
    const radioButtons = document.querySelectorAll('input[name="RX"]');
    radioButtons.forEach((button) => {
        button.addEventListener("change", (event) => {
            counselDto.RX = event.target.value;
        });
    });



    // 작성완료 버튼
    $(document).ready(function(){
        $("#regBtn").on("click", function (){
            let form = $("#writeForm");
            form.attr("action", "/mypage/counsel/write");
            form.attr("method", "post");
            form.submit();
        })

    });


    // 제품찾기 팝업창
    $('#prodSearchBtn').on("click",function(e){ // 제품찾기 버튼 클릭하면

        e.preventDefault(); // 이벤트의 기본 동작을 막음, 버튼 클릭시에만 이벤트 발생

        let popUrl = "/mypage/counsel/write/prodPop";   // 팝업창 url
        let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
        let popName = "제품 찾기"   // 팝업창 이름
        window.open(popUrl,popName,popOption);

    });
</script>


</html>