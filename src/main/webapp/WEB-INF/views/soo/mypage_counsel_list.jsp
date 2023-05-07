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
  <link rel="stylesheet" href="/css/soo/mypage_counsel_list.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <style></style>
</head>

<body>
<jsp:include page="../header.jsp" />

<div class="mypage">
  <div id="mypageTop">
    <jsp:include page="../mypage_header.jsp"/>
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
      <form name="schFrm" id="schFrm" method="post">
        <input type="hidden" id="pageNo" name="pageNo" value="1" />

        <div class="tableTypeSearch">
          <table>
            <caption>조회</caption>
            <colgroup>
              <col style="width: 140px;">
            </colgroup>
            <tbody>
            <tr>
              <th scope="row">기간별 조회</th>
              <td>
                <label class="inputRadio">
                  <input type="radio" name="srch" onclick="setDateRange('D15');" id="inquiry1">
                  <span>15일</span>
                </label>
                <label class="inputRadio">
                  <input type="radio" name="srch" onclick="setDateRange('M1');" id="inquiry2">
                  <span>1개월</span>
                </label>
                <label class="inputRadio">
                  <input type="radio" name="srch" onclick="setDateRange('M2');" id="inquiry3">
                  <span>2개월</span>
                </label>
                <label class="inputRadio">
                  <input type="radio" name="srch" onclick="setDateRange('M3');" id="inquiry4">
                  <span>3개월</span>
                </label>
                <label class="inputRadio">
                  <input type="radio" name="srch" onclick="setDateRange('M6');" id="inquiry5">
                  <span>6개월</span>
                </label>
              </td>
            </tr>
            <tr>
              <th scope="row">일자별 조회</th>
              <td>
                <input type="text" name="stDate" readonly class="datepicker" style="width: 200px;" onclick="cal_open(document.schFrm.stDate);" value="">
                <span class="hyphen">~</span>
                <input type="text" name="endDate" readonly class="datepicker" style="width: 200px;" onclick="cal_open(document.schFrm.endDate);" value="">
                <button type="button" class="btnType" onclick="fnGoSearch();">검색</button>
              </td>
            </tr>

            </tbody>
          </table>
        </div>
      </form>

      <div>
        <p class="tableHeadTxt">
          고객님이 문의하신 내용에 대한 처리 결과입니다.<br>
          <span class="sub-ftColor7">(고객님께서 적어주신 문의글에 개인정보가 포함된 경우, 고객정보보호를 위해 마스킹처리가 될 수 있습니다.)</span>
        </p>
      </div>

      <div class="counselList">
        <table>
          <caption>1:1 상담내역</caption>
          <colgroup>
            <col style="width: 80px;">
            <col style="width: 500px;">
            <col style="width: 200px;">
            <col style="width: 120px;">
          </colgroup>
          <thead>
          <tr>
            <th scope="col">NO</th>
            <th scope="col">제목</th>
            <th scope="col">작성일</th>
            <th scope="col">처리현황</th>
          </tr>
          </thead>
          <tbody>
<%--          <c:forEach var="Counsel" items="${a}">--%>
          <c:forEach>
          <tr class="question">

            <!-- 1:1 상담 번호(rownum) -->
            <td class="no">2</td>
            <!-- 문의제목 -->
            <td class="title">그린티 씨드 세럼 제품명 변경에 대해 문의합니다.</td>
            <!-- 작성일, yy-MM-dd hh:mm:ss -->
            <td class="date">2023-04-29 14:40:17</td>
            <!-- 문의 처리현황, 처리중 -> 처리완료 -->
            <td class="stus" value="처리완료">
              처리완료
              <!-- 처리중일때만 보이는 버튼 -->
              <button type="button" class="delBtn">삭제</button>
            </td>
          </tr>
          <tr class="questionCont">
            <td></td>
            <td colspan="3">
              <!-- 제품명 추가 -->
              <div class="prod">[제품정보] 그린티 씨드 히알루론산 세럼</div>
              <!-- 문의내용 -->
              <div class="questionC">
                안녕하세요? 그린티 씨드 세럼을 이용중이었는데, 제품명에 히알루론산이 추가 되었더라구요. 패키지만 변경된건가요?
                아니면 성분도 리뉴얼된건지 궁금합니다.
              </div>
              <div class="answer">
                      <span class="reTitle">
                        <span class="reBtn">답변</span>
                        <!-- RE: + 상담 제목이 한번 더 -->
                        RE: 그린티 씨드 세럼 제품명 변경에 대해 문의합니다.
                      </span>
                <!-- answer 내용 -->
                <span class="answerCont">
                    안녕하세요, 고객님. 이니스프리입니다. 먼저, 저희 이니스프리에 관심을 가져주시고 이용해 주시는 고객님께 진심으로
                    감사의 마음을 전합니다. 문의주신 [그린티 씨드 히알루론산 세럼]제품은 기존 그린티 씨드 크림 제품이 리뉴얼 되어 재출시된
                    제품이며, 성분/처방/가격 변경등으로 사용감, 제형 등 개인차에 따라 다르게 느낄 수 있는 점 이용에 참고 부탁드립니다.
                    *자세한 제품 설명은 해당페이지 상세정보 확인 바랍니다. 혹여, 민감피부이신 경우라면 제품상세페이지 >유의사항 클릭시
                    해당제품의 전성분 확인이 가능하오니 혹여 맞지 않은 성분이 포함되어 있지 않은지 구매 전 꼭 확인 부탁드립니다.
                    소중한 시간 내어 문의 주신 점 감사 드립니다. 행복한 하루 보내세요.
                    </span>
              </div>
              <div class="answerDate">
                2023-04-29
                <!-- answer 날짜 -->
              </div>
            </td>
          </tr>
          </tbody>
          </c:forEach>
        </table>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../footer.jsp" />

</body>
<script>
  $(document).ready(function() {
    // 일단, 답변 감추기
    $(".questionCont").hide();

    // 제목을 클릭
    $("td.title").click(function() {
      // 클릭한 제목의 부모 tr을 찾는다
      var parentTr = $(this).closest("tr");

      // 클릭한 제목 아래에 있는 답변을 찾아 보여주기
      var questionCont = parentTr.next(".questionCont");
      if (questionCont.is(":visible")) {
        // 이미 보이는 경우에는 닫기
        questionCont.hide();
      } else {
        // 보이지 않는 경우에는 열어주기
        $(".questionCont").hide();  // 다른 답변은 닫아줍니다.
        questionCont.show();
      }
    });
  });


  const stusList = document.querySelectorAll('.stus');

  stusList.forEach((stus) => {
    if (stus.getAttribute('value') === '처리중') {
      const delBtn = stus.querySelector('.delBtn');
      delBtn.style.display = 'inline-block';
    } else {
      const delBtn = stus.querySelector('.delBtn');
      delBtn.style.display = 'none';
    }
  });


  function setDateRange(period) {
    const stDate = document.getElementsByName('stDate')[0];
    const endDate = document.getElementsByName('endDate')[0];
    const now = new Date();
    const year = now.getFullYear();
    const month = (now.getMonth() + 1).toString();
    const date = now.getDate().toString();
    const end = `${year}-${month.padStart(2, '0')}-${date.padStart(2, '0')}`;

    let start;

    if (period === 'D15') {
      start = new Date(now.getTime() - (15 * 24 * 60 * 60 * 1000));
    } else if (period === 'M1') {
      start = new Date(now.getFullYear(), now.getMonth() - 1, now.getDate());
    } else if (period === 'M2') {
      start = new Date(now.getFullYear(), now.getMonth() - 2, now.getDate());
    } else if (period === 'M3') {
      start = new Date(now.getFullYear(), now.getMonth() - 3, now.getDate());
    } else if (period === 'M6') {
      start = new Date(now.getFullYear(), now.getMonth() - 6, now.getDate());
    }

    start = start.toISOString().slice(0, 10); // "yyyy-mm-dd" 형식으로 변환

    stDate.value = start;
    endDate.value = end;
  }


</script>
</html>
