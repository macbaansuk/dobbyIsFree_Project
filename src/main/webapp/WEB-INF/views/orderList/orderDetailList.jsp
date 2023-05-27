<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="../mypage-header.jsp"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
      integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
      crossorigin="anonymous" />
<link rel="stylesheet" href="/css/orderList/orderDetail.css"/><!-- css -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax -->



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
            <th>주문번호</th><td colspan="3">${ordDto.ORD_ID}</td>
          </tr>
          <tr>
            <th scope="col">주문자(아이디) / 회원등급</th>
            <!-- 옴니플랫폼 cstmid -> custWebId로 변경 by ljm -->
            <td>${ordDto.ORDR}(${ordDto.MBR_ID}) / WELCOME</td>
            <th scope="col">이메일</th>
            <td>${ordDto.ORDR_EMAIL}</td>
          </tr>
          <tr>
            <th scope="col">주문일</th>
            <td>
              ${ordDto.ORD_DTM}
            </td>
            <th scope="col">결제완료일</th>
            <td>
            </td>
          </tr>
          <tr>

            <th scope="col">결제방법</th>
            <td>
              카드결제
            </td>
            <th scope="col"></th>
            <td></td>

          </tr>
          <tr>
            <th scope="col">주문상태</th>
            <td class="state">
              ${ordDto.ORD_STUS_CD}
            </td>
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




      <h3 class="subTitle2">내 주문상품정보</h3>
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


          <c:forEach items="${opiDto}" var="opiDto">
          <tr>
            <td>
              <a href="/kr/ko/ProductView.do?prdSeq=34497">
                <img src="${opiDto.REP_IMG}"  alt="" width="100px">
              </a>
            </td>
            <td class="pdtCont">
              <a href="/kr/ko/ProductView.do?prdSeq=34497" target="_blank">
                                    <span class="name">
                                      ${opiDto.PROD_NM}
                                    </span>
<%--                <span class="opt">제품코드: 34497</span>--%>
              </a>
            </td>
            <td>${opiDto.PROD_INDV_QTY}</td>
            <c:choose>
              <c:when test="${opiDto.DC_YN eq 'Y'}">
                <c:set var="prod_fee" value="${opiDto.PROD_AMT * 0.9}"/>
              </c:when>
              <c:otherwise>
                <c:set var="prod_fee" value="${opiDto.PROD_AMT}"/>
              </c:otherwise>
            </c:choose>
            <td>
              <fmt:formatNumber pattern="###,###,###" value="${prod_fee}"/>원</td>
            </td>

            <td>
              <fmt:formatNumber pattern="###,###,###" value="${prod_fee * 0.01  * opiDto.PROD_INDV_QTY}"/>P</td>
            <td>
              ${opiDto.ORD_STUS_CD}
            </td>
            <td></td>

          </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>


      <div class="myOrderPrice">
        <div class="orderPrice">
          <dl>
            <dt>총 주문 금액</dt>
            <dd><span class="num"><fmt:formatNumber pattern="###,###,###" value="${ordDto.ORD_TAMT}"/></span>원</dd>
          </dl>
          <dl>
            <dt>할인 및 차감금액
            </dt>
            <dd><span class="num">- ${ordDto.DC_AMT}</span>원</dd> <!-- 20210506 할인 및 차감금액에서 뷰포 삭제 -->
          </dl>


          <dl>
            <dt>배송비</dt>
            <dd>${ordDto.DEXP}원</dd>
          </dl>


          <dl>
            <dt>적립금</dt>
            <dd>
              <span class="num">+${ordDto.POINT_AMT}</span>P
            </dd>
          </dl>
          <div class="totalPrice">
            <dl>
              <dt>최종 결제 금액</dt>
              <dd class="total"><span class="num"><fmt:formatNumber pattern="###,###,###" value="${ordDto.SETL_AMT}"/></span>원</dd>
            </dl>
          </div>
        </div>
      </div>
      <div class="helpWrap">
        <ul class="bulListType">
          <li>
            적립금은 배송완료(또는 수취확인) 후 15일째 되는 날 적립됩니다.
          </li>
          <li>
            주문접수 상태의 주문은 주문일에서 3일간 보관되며, 이후 자동 취소처리 됩니다.
          </li>
          <li>
            결제완료 후 배송지 변경은 어렵습니다. 취소 후 변경 주소로 재 주문하여 주세요.
          </li>
          <li>
            상태에 따른 주문 취소 방법<br>
            [결제완료]: 마이페이지에서 취소신청이 가능합니다.<br>
            [상품준비중]: 고객상담실을 통해 문의 시, 출고 확정 전인 경우만 취소가 가능합니다.
          </li>
          <li>
            샘플마켓 제품은 고객센터(02-737-8945)문의를 통해 교환/반품이 가능합니다.
          </li>
        </ul>
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
            <td colspan="3"><fmt:formatNumber pattern="###,###,###" value="${ordDto.SETL_AMT}"/>원</td>
          </tr>
          <tr>
            <th scope="row">환불 받을 은행</th>
            <td>${ordDto.BANK}</td>
            <th scope="row">환불 계좌번호</th>
            <td>${ordDto.ACC_NO}</td>
          </tr>
          <tr>
            <th scope="row">예금주</th>
            <td>${ordDto.DPOSR}</td>
            <th scope="row"></th>
            <td></td>
          </tr>
<%--          <tr>--%>
<%--            <th scope="row">입금기한</th>--%>
<%--            <td colspan="3"> 20230510</td>--%>
<%--          </tr>--%>


          </tbody>
        </table>
      </div>


      <form name="updateFrm" id="updateFrm" method="post">

        <h3 class="subTitle2">내 배송지 정보</h3>


        <div class="subRight"><button type="button" class="btnType7s" id="dlvAddMngBtn">배송지 변경</button></div>


        <div class="tableType noLine">
          <table id="rcvTable">
            <caption>내 배송지 정보</caption>
            <colgroup>
              <col style="width:175px;">
              <col>
            </colgroup>
            <tbody>
            <tr>
              <th scope="row">받으실 분</th>
              <td>
                <input type="text" id="userName" class="inputTxt" name="rcvNm" value="${ordDto.RCPR_NM}" readonly="readonly">
              </td>
            </tr>
            <tr>
              <th scope="row">주소</th>
              <td class="deliveryWriteWrap">
                <div class="deliveryInput">
                  <div class="row">
                    <input title="우편번호" type="text" readonly="" class="inputTxt ordzipTxt" style="width:13%;" value="${ordDto.RCPR_ZPCD}">


                  </div>
                  <div class="row">
                    <input type="text" name="dlvAddr1st" class="inputTxt dlvAddr1stTxt" readonly="readonly" title="주소 입력" style="width:90%;" value="${ordDto.RCPR_BASIC_ADDR}">
                  </div>
                  <div class="row">
                    <input type="text" name="dlvAddr2nd" class="inputTxt dlvAddr2ndTxt" title="상세주소 입력" style="width:90%;" value="${ordDto.RCPR_DTL_ADDR}" readonly="readonly">
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

                  <button type="button" id="mblNo1" class="selTit" onclick="selActive();" disabled=""  value=""></button>
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
                <input type="text" name="mblNo2" id="mblNo2" maxlength="4" title="휴대전화번호 두번째" class="inputTxt" style="width:20%;vertical-align:middle;" value="" readonly="readonly">
                <span class="hyphen">-</span>
                <input type="text" name="mblNo3" id="mblNo3" maxlength="4" title="휴대전화번호 세번째" class="inputTxt" style="width:20%;vertical-align:middle;" value="" readonly="readonly">
              </td>
            </tr>
            <tr>
              <th scope="row">배송 시 요청사항</th>
              <td><input type="text" class="inputTxt" style="width:90%;" name="dlvReqCnt" value="${ordDto.DLVPN_REQ}" readonly="readonly"></td>
            </tr>
            </tbody>
          </table>
        </div>
      </form>

      <div class="btnWrap">
        <a href="/order/list" class="btnType3l">목록</a>
      </div>

    </div><!--page-->
  </div><!--container-->
</div><!--mypage -->

<jsp:include page="../footer.jsp" />
<script>
  //연락처 세자리 자르기
  let mblNo = '${ordDto.RCPR_MPNO}';

  let mblNo1 = mblNo.substring(0,3);
  let mblNo2 = mblNo.substring(3,7);
  let mblNo3 = mblNo.substring(7,11);
  ////console.log("m1",mblNo1);
  ////console.log("m2",mblNo2);
  ////console.log("m3",mblNo3);


  document.getElementById("mblNo1").textContent  = mblNo1;
  document.getElementById("mblNo2").value = mblNo2;
  document.getElementById("mblNo3").value = mblNo3;

</script>
</body>

</html>