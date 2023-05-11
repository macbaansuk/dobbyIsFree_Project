<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../mypage-header.jsp"/>
<title>1:1 상담작성</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<link rel="stylesheet" href="/css/soo/mypage_counsel_write.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/css/hoon/jquery/jquery-ui.min.js"></script>

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
                            <col style="width: 20%" />
                            <col style="width: 80%" />
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
                                    <option class="category" value="" selected>선택하세요</option>
                                    <option class="category" value="C01" ${counselDto.CATE_ID == 'C01' ? 'selected' : ''}>상품문의</option>
                                    <option class="category" value="C02" ${counselDto.CATE_ID == 'C02' ? 'selected' : ''}>주문문의</option>
                                    <option class="category" value="C03" ${counselDto.CATE_ID == 'C03' ? 'selected' : ''}>결제문의</option>
                                    <option class="category" value="C04" ${counselDto.CATE_ID == 'C04' ? 'selected' : ''}>배송문의</option>
                                    <option class="category" value="C05" ${counselDto.CATE_ID == 'C05' ? 'selected' : ''}>취소문의</option>
                                    <option class="category" value="C06" ${counselDto.CATE_ID == 'C06' ? 'selected' : ''}>반품문의</option>
                                    <option class="category" value="C07" ${counselDto.CATE_ID == 'C07' ? 'selected' : ''}>교환문의</option>
                                    <option class="category" value="C08" ${counselDto.CATE_ID == 'C08' ? 'selected' : ''}>기타문의</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>문의제품</th>
                            <td>
                                <button id="prodSearchBtn" onclick="openModal()">제품 찾기</button>
                                <input id="prodName_input" name="prodName" value="${counselDto.PROD_ID}"  readonly>
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
                                <textarea name="CN" id="counselCn" placeholder="내용을 입력해 주세요.">${counselDto.CN}</textarea>
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
                                        <input type="radio" class="sns" name="RX" value="Y">
                                        <span>예</span>
                                    </label>
                                    <label>
                                        <input type="radio" class="sns" name="RX" value="N">
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

            const selectElement = document.querySelector('#counList');
            const selectedOption = selectElement.options[selectElement.selectedIndex];

            if (selectedOption.value === '') {
                alert('상담구분을 선택해주세요.');
            }

            if ($("#title").val().trim() == "") {
                alert("제목을 입력해주세요.");
                return false;
            }
            if($("#counselCn").val().trim() =="") {
                alert("내용을 입력해주세요.");
                return false;
            }
            const isSelected = document.querySelector('.sns:checked');
            if (!isSelected) {
                alert("SMS 수신여부를 선택해주세요.");
                return false;
            }


            form.submit();
            alert("1:1 상담이 등록되었습니다.")
        })



    });

    function receiveProductData(prodId, prodName) {
        // 선택한 제품 ID와 이름을 부모창의 input 요소에 설정
        document.getElementById("prodId_input").value = prodId;
        document.getElementById("prodName_input").value = prodName;
    }

    $(document).ready(function() {
        // 제품찾기 버튼 클릭 시 팝업창 열기
        $('#prodSearchBtn').on("click",function(e){
            e.preventDefault();
            let popUrl = "/mypage/counsel/write/prodPop";
            let popOption = "width = 400px, height=400px, top=300px, left=300px, scrollbars=yes";
            let popName = "제품 찾기";

            // 자식창 열기
            let popup = window.open(popUrl,popName,popOption);

            // 자식창에서 전달된 데이터 처리
            window.receiveProductData = receiveProductData;
        });
    });


</script>


</html>
