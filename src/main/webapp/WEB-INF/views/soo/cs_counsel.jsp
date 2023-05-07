<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/soo/counselMain.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <title>고객센터 - 1:1 상담</title>

  <style>

  </style>

</head>
<body>
<jsp:include page="../header.jsp" />
<div id="container">
  <!-- location -->
  <div class="location">
    홈 > 고객센터 > 1:1 상담
  </div>
  <section id="contents">
    <div>
      <h2 class="page_title">고객센터</h2>
    </div>

    <div class="wrap">
      <!-- 게시판카테고리 -->
      <nav class="bbsList">
        <ul class="cate1">
          <li id="F">
            <a href="/cs/faq/list"><span>FAQ</span></a>
          </li>
          <li id="N">
            <a href="/cs/notice/list"><span>공지사항</span></a>
          </li>
          <li id="C">
            <a href="/cs/counsel/main"><span>1:1 상담</span></a>
          </li>
        </ul>
      </nav>


      <section class="content">
        <h3 class="subTitle">
          궁금한 점이 있으세요?
          <br>
          고객님의 문의사항 해결을 위해 최선을 다하겠습니다
        </h3>
        <div class="counselBox">
          <img src="/img/soo/bubble.png"/>
          <p class="qnaLink">
            자주 찾는 Q&A를
            <br>
            먼저 확인 해보시겠어요?
            <br>
            <a href="/cs/faq/list" class="link">전체보기 ></a>
          </p>
          <section class="qnaRecom">
            <h3 class="subTitle2">추천 FAQ</h3>
            <ul class="list">
              <li><a href="#"><span>Q .</span> 주문건에 대해 결제 금액 영수증을 출력하고 싶어요.</a></li>
              <li><a href="#"><span>Q .</span> 오프라인 매장 구매 내용을 확인하고 싶어요.</a></li>
              <li><a href="#"><span>Q .</span> 교환은 어떻게 하나요?</a></li>
            </ul>
          </section>
        </div>
        <div class="help">
          <h4 class="subTitle3">1:1 상담 전에 꼭 확인해주세요.</h4>
          <ul class="helpList">
            <li>질문하신 질문의 답변은 개인 메일이나 마이페이지>1:1상담내역에서 답변내용을 확인 하실 수 있습니다.</li>
            <li>1:1 고객문의 처리시간은 09:00 ~18:00 입니다. (문의는 24시간 언제나 가능합니다.)</li>
            <li>최단시간 내에 접수사항을 조치하여 해결해 드리도록 하겠습니다.</li>
            <li>피해 발생시에는 공정거래위원회 소비자분쟁해결기준에 의거해서 처리됩니다.</li>
          </ul>
        </div>
        <div class="btnWrap">
          <a href="/mypage/counsel/write" class="counBtn">1:1 상담작성</a>
        </div>
      </section>
</div>



<jsp:include page="../footer.jsp" />
</body>

<script>
  const faqBtn = document.querySelector('#F');
  const noticeBtn = document.querySelector('#N');
  const counselBtn = document.querySelector('#C');

  faqBtn.addEventListener('click', function() {
    window.location.href = '/cs/faq/list'; // 링크 주소 입력
  });

  noticeBtn.addEventListener('click', function() {
    window.location.href = '/cs/notice/list'; // 링크 주소 입력
  });

  counselBtn.addEventListener('click', function() {
    window.location.href = '/cs/counsel/main'; // 링크 주소 입력
  });
</script>

</html>
