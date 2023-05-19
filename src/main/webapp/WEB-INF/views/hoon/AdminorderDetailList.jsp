<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
      integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
      crossorigin="anonymous" />
<link rel="stylesheet" href="/css/hwa/orderDetail.css"/><!-- css -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax -->
<style>
  .print {
    background-color: #00a2ff;
  }
</style>




<div class="section-title-wrap bottom-line">
  <div class="section-title">
    <h3 class="title">주문/배송 조회</h3>
  </div>
</div>



<h3 class="subTitle2">주문정보</h3>
<div class="tableType noLine">
  <table>
    <caption>주문 정보</caption>
    <colgroup>
      <col style="width:15%;">
      <col style="width:35%;">
      <col style="width:15%;">
      <col style="width:35%;">
    </colgroup>
    <tbody>
    <tr>
      <th>주문번호</th>
      <td colspan="3">20230518504666</td>
    </tr>
    <tr>
      <th scope="col">주문자(아이디) / 회원등급</th>
      <td>김정석(jungsuk) / WELCOME</td>
      <th scope="col">이메일</th>
      <td>jungsuk@coding.com</td>
    </tr>
    <tr>
      <th scope="col">주문일</th>
      <td>2023-05-18</td>
      <th scope="col">결제완료일</th>
      <td></td>
    </tr>
    <tr>
      <th scope="col">결제방법</th>
      <td>카드결제</td>
      <th scope="col"></th>
      <td></td>
    </tr>
    <tr>
      <th scope="col">주문상태</th>
      <td class="state">상품준비중</td>

      <th scope="col">송장번호</th>
      <td>
      </td>
    </tr>
    <tr>
      <th scope="col">배송일</th>
      <td></td>
      <th scope="col">배송완료일</th>
      <td>

      </td>


      <th scope="col"></th>
      <td></td>

    </tr>
    </tbody>
  </table>
</div>




<h3 class="subTitle2">주문상품정보</h3>
<div class="tableType noLine noPdg">
  <table>
    <caption>내 주문상품정보</caption>
    <colgroup>
      <col style="width:10%;">
      <col style="width: 13%">
      <col style="width:5%;">
      <col style="width:8%;">
      <col style="width:8%;">
      <col style="width:8%;">
      <col style="width:10%;">
    </colgroup>
    <thead>
    <tr>
      <th scope="col" colspan="2">제품명</th>
      <th scope="col">수량</th>
      <th scope="col">판매가</th>
      <th scope="col">적립포인트</th>
      <th scope="col">상태</th>
      <th scope="col">구매후기</th>
    </tr>
    </thead>
    <tbody class="center">


<%--    <c:forEach items="${opiDto}" var="opiDto">--%>
      <tr>
        <td>
          <a href="/kr/ko/ProductView.do?prdSeq=34497">
            <img src="/img/sun/product-image/skincare/derma_cream/derma_cream_main.jpg"  alt="" width="100px">
          </a>
        </td>
        <td class="pdtCont">
          <a href="/kr/ko/ProductView.do?prdSeq=34497" target="_blank">
                                    <span class="name">
                                        더마 그린티 프로바이오틱스 크림
                                    </span>
              <%--                <span class="opt">제품코드: 34497</span>--%>
          </a>
        </td>
        <td>2</td>
<%--        <c:choose>--%>
<%--          <c:when test="${opiDto.DC_YN eq 'Y'}">--%>
<%--            <c:set var="prod_fee" value="${opiDto.PROD_AMT * 0.9}"/>--%>
<%--          </c:when>--%>
<%--          <c:otherwise>--%>
<%--            <c:set var="prod_fee" value="${opiDto.PROD_AMT}"/>--%>
<%--          </c:otherwise>--%>
<%--        </c:choose>--%>
        <td>
          22,500원
        </td>

        <td>
         225P
        <td>
           상품준비중
        </td>
        <td></td>


<%--    </c:forEach>--%>
    </tbody>
    <tbody class="center">
    <%--        추가--%>
    <td>
      <a href="/kr/ko/ProductView.do?prdSeq=34497">
        <img src="/img/sun/product-image/makeup/eyebrow/eyebrow_main.jpg"  alt="" width="100px">
      </a>
    </td>
    <td class="pdtCont">
      <a href="/kr/ko/ProductView.do?prdSeq=34497" target="_blank">
                                    <span class="name">
                                        납작 아이브로우 펜슬
                                    </span>
        <%--                <span class="opt">제품코드: 34497</span>--%>
      </a>
    </td>
    <td>2</td>

    <td>
      4,500원
    </td>

    <td>
      90P
    <td>
      상품준비중
    </td>
    <td></td>

    </tr>
    </tbody>
  </table>
</div>


<div class="myOrderPrice">
  <div class="orderPrice">
    <dl>
      <dt>총 주문 금액</dt>
      <dd><span class="num">44,000</span>원</dd>
    </dl>
    <dl>
      <dt>할인 및 차감금액
      </dt>
      <dd><span class="num">-</span>10,000원</dd> <!-- 20210506 할인 및 차감금액에서 뷰포 삭제 -->
    </dl>


    <dl>
      <dt>배송비</dt>
      <dd>0원</dd>
    </dl>


    <dl>
      <dt>적립 뷰티포인트</dt>
      <dd>
        <span class="num">+540</span>P
      </dd>
    </dl>
    <div class="totalPrice">
      <dl>
        <dt>최종 결제 금액</dt>
        <dd class="total"><span class="num">44,000</span>원</dd>
      </dl>
    </div>
  </div>
</div>


<h3 class="subTitle2">
  결제정보
</h3>
<div class="tableType noLine">
  <table>
    <caption>결제정보</caption>
    <colgroup>
      <col style="width:175px;">
      <col style="width:30%;">
      <col style="width:175px;">
      <col>
    </colgroup>
    <tbody>
    <tr>

      <th scope="row">결제방법</th>
      <td colspan="3">카드결제</td>

    </tr>

    <tr>
      <th scope="row">결제금액</th>
      <td colspan="3">44,000원</td>
    </tr>
    <tr>
      <th scope="row">환불 받을 은행</th>
      <td>미입력</td>
      <th scope="row">환불 계좌번호</th>
      <td>미입력</td>
    </tr>
    <tr>
      <th scope="row">예금주</th>
      <td>미입력</td>
      <th scope="row"></th>
      <td></td>
    </tr>



    </tbody>
  </table>
</div>


<form name="updateFrm" id="updateFrm" method="post">

  <h3 class="subTitle2"> 배송지 정보</h3>


  <div class="subRight"><button type="button" class="btnType7s" id="dlvAddMngBtn">배송지 변경</button></div>


  <div class="tableType noLine">
    <table id="rcvTable">
      <caption> 배송지 정보</caption>
      <colgroup>
        <col style="width:175px;">
        <col>
      </colgroup>
      <tbody>
      <tr>
        <th scope="row">받으실 분</th>
        <td>
          <input type="text" id="userName" class="inputTxt" name="rcvNm" value="김정석" readonly="readonly">
        </td>
      </tr>
      <tr>
        <th scope="row">주소</th>
        <td class="deliveryWriteWrap">
          <div class="deliveryInput">
            <div class="row">
              <input title="우편번호" type="text" readonly="" class="inputTxt ordzipTxt" style="width:13%;" value="03164 ">


            </div>
            <div class="row">
              <input type="text" name="dlvAddr1st" class="inputTxt dlvAddr1stTxt" readonly="readonly" title="주소 입력" style="width:90%;" value="서울 종로구 종로2가 9">
            </div>
            <div class="row">
              <input type="text" name="dlvAddr2nd" class="inputTxt dlvAddr2ndTxt" title="상세주소 입력" style="width:90%;" value="518호" readonly="readonly">
            </div>
            <div class="row">


            </div>
          </div>
        </td>
      </tr>
      <tr>
        <th scope="row">휴대폰번호</th>
        <td>
          <div class="selectArea" style="width:20%;">

            <button type="button" id="mblNo1" class="selTit" disabled value="010">010</button>
            <!-- INNIFOP-2539 : [ARC] 마이페이지2차(1)_주문내역/개인정보수정/배송지관리 : 배송지 관리에서 넘어온 값 셋팅하기 위해 수정-->
            <ul class="selList" id="mblTp">
              <li><input type="radio" id="010" value="010" name="mblNo1" checked="checked"><label for="010">010</label></li>
              <li><input type="radio" id="011" value="011" name="mblNo1"><label for="011">011</label></li>
              <li><input type="radio" id="016" value="016" name="mblNo1"><label for="016">016</label></li>
              <li><input type="radio" id="017" value="017" name="mblNo1"><label for="017">017</label></li>
              <li><input type="radio" id="018" value="018" name="mblNo1"><label for="018">018</label></li>
              <li><input type="radio" id="019" value="019" name="mblNo1"><label for="019">019</label></li>
            </ul>
          </div>
          <span class="hyphen">-</span>
          <input type="text" name="mblNo2" id="mblNo2" maxlength="4" title="휴대전화번호 두번째" class="inputTxt" style="width:20%;vertical-align:middle;" value="1111" readonly="readonly">
          <span class="hyphen">-</span>
          <input type="text" name="mblNo3" id="mblNo3" maxlength="4" title="휴대전화번호 세번째" class="inputTxt" style="width:20%;vertical-align:middle;" value="2222" readonly="readonly">
        </td>
      </tr>
      <tr>
        <th scope="row">배송 시 요청사항</th>
        <td><input type="text" class="inputTxt" style="width:90%;" name="dlvReqCnt" value="" readonly="readonly"></td>
      </tr>
      </tbody>
    </table>
  </div>
</form>

<div class="btnWrap">
  <a href="#" class="btnType3l" onclick="window.close()">닫기</a>
  <a href="#" class="btnType3l print" onclick="window.close()">인쇄</a>
</div>

</div><!--page-->
</div><!--container-->
</div><!--mypage -->


<script>
  //연락처 세자리 자르기
  let mblNo = '${ordDto.RCPR_MPNO}';

  let mblNo1 = mblNo.substring(0,3);
  let mblNo2 = mblNo.substring(3,7);
  let mblNo3 = mblNo.substring(7,11);
  console.log("m1",mblNo1);
  console.log("m2",mblNo2);
  console.log("m3",mblNo3);
  document.getElementById("mblNo1").removeAttribute("disabled");

  selActive();
  // 휴대전화번호 두번째와 세번째 값 설정하기
  document.querySelector('#mblNo2').value = '3614';
  document.querySelector('#mblNo3').value = '4485';
</script>
</body>

</html>