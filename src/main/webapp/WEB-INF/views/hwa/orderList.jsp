<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../mypage-header.jsp"/>

  <title>주문내역</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
        crossorigin="anonymous" />
  <link rel="stylesheet" href="/css/hwa/orderList.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- ajax -->

      <div class="sub-content mypage-content" ><!--*style="min-height: 1094px;"*-->
        <!-- 멤버십 카드 관리 -->
        <!-- 마이페이지 타이틀 -->
        <div class="section-title-wrap bottom-line">
          <div class="section-title">
            <h4 class="title">주문/배송 조회</h4>
          </div>
        </div>
        <!-- 달력 조회 -->
        <div class="date-setting-content double">
          <form name="orderForm" id="orderForm">
            <div class="date-setting-control">
              <div class="control-panel date">
                <div class="type">조회기간</div>
                <div class="date-set">
                  <div class="btn-area">
                    <a href="javascript:void(0);" data-value="1M" class="btn small slightly datePick on">1개월</a>
                    <a href="javascript:void(0);" data-value="3M" class="btn small slightly datePick">3개월</a>
                    <a href="javascript:void(0);" data-value="6M" class="btn small slightly datePick">6개월</a>
                  </div>
                  <div class="direct-select">
                    <div class="date-item">
                      <input type="text" title="시작 날짜" class="start-date" name="startDt" id="startDt" readonly="">
                      <button type="button" class="date-toggle start">시작 날짜 달력보기</button>
                    </div>
                    <div class="hyphen"></div>
                    <div class="date-item">
                      <input type="text" title="종료 날짜" class="end-date" name="endDt" id="endDt" readonly="">
                      <button type="button" class="date-toggle end">종료 날짜 달력보기</button>
                    </div>
                  </div>
                </div>
                <input type="hidden" name="searchMonth" value="1">
                <input type="hidden" name="lastOrdClmStatCd" value="">
              </div>
              <div class="control-panel state">
                <div class="type">배송상태</div>
                <div class="date-set">
                  <div class="btn-area stat-btn">
                    <a href="javascript:void(0);" data-stat-cd="" class="btn small slightly on ">전체</a>
                    <a href="javascript:void(0);" data-stat-cd="OD005010" class="btn small slightly  ">입금대기</a>
                    <a href="javascript:void(0);" data-stat-cd="OD005020" class="btn small slightly  ">결제완료</a>
                    <a href="javascript:void(0);" data-stat-cd="OD005030" class="btn small slightly  ">상품준비중</a>
                    <a href="javascript:void(0);" data-stat-cd="OD005040" class="btn small slightly  ">배송중</a>
                    <a href="javascript:void(0);" data-stat-cd="OD005050" class="btn small slightly  ">배송완료</a>
                    <a href="javascript:void(0);" data-stat-cd="OD005060" class="btn small slightly  ">구매확정</a>
                  </div>
                </div>
              </div>
            </div>
          </form>
          <a href="javascript:void(0);" class="btn small normal btn-search" id="searchBtn">조회하기</a>
        </div>
      </div><!-- 달력 끝 -->


      <div id="listArea">





        <p class="tableListLength">총 <strong class="ftColor1">1</strong> 건</p>
        <div class="tableType">
          <table>
            <caption>전체주문체결내역</caption>
            <colgroup>
              <col style="width:120px;">
              <col style="width:160px;">
              <col>
              <col style="width:110px;">
              <col style="width:110px;">
              <col style="width:110px;">
              <col style="width:110px;">
            </colgroup>
            <thead>
            <tr>
              <th scope="col">주문일자</th>
              <th scope="col">주문번호</th>
              <th scope="col">대표제품 명</th>
              <th scope="col">결제금액</th>
              <th scope="col">처리현황</th>
              <th scope="col">배송조회</th>
              <th scope="col">주문취소</th>
            </tr>
            </thead>

            <tbody>
              <c:forEach items="${ordDto}" var="orderList">
            <tr>

              <td class="ordDtm" data-ord-dtm="${orderList.ORD_DTM}">
              </td>

              <td>
                <a href="javascript:void(0)">
                  ${orderList.ORD_ID}
                </a>
              </td>

              <td class="left">
                <c:forEach items="${ordProdDto}" var="ordProdDto">
                  <c:choose>
                    <c:when test="${ordProdDto.ORD_ID eq orderList.ORD_ID}">
                  <a href="/orderDetail?orderId=${ordProdDto.ORD_ID}">
                ${ordProdDto.PROD_NM}
                      <c:forEach items="${pcDto}" var="pcDto">
                        <c:if test="${pcDto.ORD_ID eq orderList.ORD_ID}">
                          <c:set var="pdCnt" value="${pcDto.prod_Cnt}" />
                          <fmt:parseNumber var="fmtCnt" type="number" value="${pdCnt}" />
                          <c:if test="${fmtCnt != 1 && fmtCnt gt 0}">
                            외 ${fmtCnt}건
                          </c:if>
                        </c:if>
                      </c:forEach>
                  </a>
                    </c:when>
                  </c:choose>
                </c:forEach>
              </td>

              <td><fmt:formatNumber pattern="###,###,###" value="${orderList.SETL_AMT}"/>원</td>
              <td>
                주문접수
              </td>
              <td class="btn1">
              </td>
              <td class="btn1">
              </td>
            </tr>
              </c:forEach>



            </tbody>
          </table>
        </div>
        <!-- paging -->

<%--        <div class="paging"><span class="num on"><a href="javascript:void(0);">1</a></span></div>--%>

        <!-- //paging -->
        <div class="helpWrap">
          <ul class="bulListType">
            <li>주문번호와 제품명을 클릭 하시면 주문 상세 내역을 보실 수 있습니다.</li>
            <li>배송정보는 처리현황이 배송 중, 배송완료 상태에서 조회가 가능합니다.</li>
            <li>이상없이 제품을 받으셨다면 수취확인을 해주세요. 확인하지 않으실 경우 배송시작일 부터 7일이후에 자동으로 배송완료상태로 변경됩니다.</li>
            <li>온라인에서 구매내역 표기시 제품의 정상가로 표기 됩니다. (단, 등급 반영시 실제 결제가 기준으로 반영됩니다.)</li>
            <li>등급 반영시 반품내역, 포인트 구매내역은 제외 됩니다.</li>
          </ul>
        </div>


      </div>
    </div><!--page-->
  </div><!--container-->
</div><!--mypage -->

<jsp:include page="../footer.jsp" />


<script>
  $(document).ready(function() {

  <%--  $(".ordDtm").each(function (index, element) {--%>

  <%--  let date = new Date('${ordDto.ORD_DTM}');// Mon May 08 2023 00:58:34 GMT+0900 (한국 표준시)--%>
  <%--  // let date6 =  date.toDateString();  //Mon May 08 2023--%>
  <%--  // let date7 =  date.toISOString();   //2023-05-07T15:58:34.000Z--%>
  <%--  let date8 =  date.toLocaleDateString(); // 2023. 5. 8.--%>
  <%--  // let date9 = date.toLocaleDateString().padStart(2,'0'); //2023. 5. 8.--%>
  <%--  let date10 = date.toString(); //2023. 5. 8.--%>


  <%--  console.log('date8',date8);--%>
  <%--  console.log('date0',date10);--%>
  <%--  document.getElementById('ordDtm').textContent = date8;--%>
  <%--});--%>


    $(".ordDtm").each(function (index, element) {
      let ordDtm = new Date(element.getAttribute('data-ord-dtm'));
      console.log('ordDtm',ordDtm);
      let ordDtmFormat = ordDtm.toLocaleDateString();
      console.log('데이트변환',ordDtmFormat);
      let ordDtmString = ordDtmFormat.toString();
      let ord = ordDtmFormat.split('.');
      let ord1 = ord[0];
      let ord2 = ord[1];
      let ord3 = ord[2];
      console.log('ord1',ord1); //확인해보니 공백이있음 ㅡㅡ;
      console.log('ord2',ord2);
      console.log('ord3',ord3);
      let ord11 = ord1.toString().trim();
      let ord22 = ord2.toString().trim().padStart(2,'0'); //trim() 추가
      let ord33 = ord3.toString().trim().padStart(2,'0');
      console.log('ord11',ord11);
      console.log('ord22',ord22);
      console.log('ord33',ord33)
      console.log('스트링',ordDtmString);
      let ordTot = ord11  +'.' + ord22 +'.'+ ord33;
      console.log('ordTot',ordTot);
      element.innerText = ordTot;
    });
  });
</script>
</body>

</html>