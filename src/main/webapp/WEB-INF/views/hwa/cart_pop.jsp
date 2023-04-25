<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<div id="pdtPreviewPop" class="layerPop" style="display: block;">
  <section class="layerWrap" style="width:480px;">

    <h3 class="layerTitle">장바구니</h3>


    <input type="hidden" id="isPromotionApplyGrade" value="Y">
    <input type="hidden" id="promStdPrc" value="3500.0">

    <input type="hidden" id="inmPromTpCd" value="2">
    <div class="layerContents" sapprdcd="131173837" prdnm="리얼 컬러 네일 (LTD)">
      <div class="pdtInfoWrap">
        <form name="orderForm" id="orderForm" method="post"
              action="https://www.innisfree.com/kr/ko/OrderPageRenewal.do"></form>
        <input type="hidden" id="multiPurType" value="">
        <input type="hidden" id="singlePrdYn" value="N">
        <input type="hidden" id="addPrdListLength" value="0">
        <input type="hidden" id="memberOnlyFl" value="N">
        <input type="hidden" id="isSnsLogin" value="">
        <input type="hidden" id="gradeCd" value="CA03">

        <span class="pdtImg"><img
                src="https://images.innisfree.co.kr/upload/product/33196_l_S_210.jpg?T202304191237"
                onerror="this.src='/kr/ko/resources/error/img/300x300.png'" alt="리얼 컬러 네일 (LTD)"></span>
        <span class="pdtCont">
                        <span class="name">리얼 컬러 네일 (LTD) 6mL</span>
                        <span class="price">

                            <span class="num">3,500</span>원
                        </span>

                    </span>
      </div>
      <div class="pdtOptWrap" id="pdtPreviewPop">
        <div class="optBox" id="pdtOptBox">
          <div class="inputChkSoldout">
            <label class="inputChk"><input type="checkbox" data-soldout=""
                                           onclick="notSoldOut();"><span>품절상품 제외</span></label>
          </div>


          <div class="selectArea optBox">
            <button type="button" class="selTit open" id="selTitOpt" maxqty="20">옵션을 선택하세요.</button>
            <ul class="selList" style="display: block;">


              <li>
                <input type="radio" name="optionSelector" id="pdtOpt131173837"
                       kindnm="245호 사각사각 피치 프라페" salprc="3,500" salefl="N" stk="-10" stkstat="2"
                       disabled="">
                <label for="pdtOpt131173837" style="display: block;">
                  <span class="optTxt">245호 사각사각 피치 프라페</span>
                  <span class="pdtQty">
                                            일시품절
                                        </span>
                </label>
              </li>


              <li>
                <input type="radio" name="optionSelector" id="pdtOpt131173838"
                       kindnm="246호 시원한 자몽 스무디" salprc="3,500" salefl="N" stk="-10" stkstat="2"
                       disabled="">
                <label for="pdtOpt131173838" style="display: block;">
                  <span class="optTxt">246호 시원한 자몽 스무디</span>
                  <span class="pdtQty">
                                            일시품절
                                        </span>
                </label>
              </li>

              <li>
                <input type="radio" name="optionSelector" id="pdtOpt131173839"
                       kindnm="247호 달콤한 망고 빙수" salprc="3,500" salefl="N" stk="-10" stkstat="2"
                       disabled="">
                <label for="pdtOpt131173839" style="display: block;">
                  <span class="optTxt">247호 달콤한 망고 빙수</span>
                  <span class="pdtQty">
                                            일시품절
                                        </span>
                </label>
              </li>


              <li>
                <input type="radio" name="optionSelector" id="pdtOpt131173840"
                       kindnm="248호 새콤달콤 레모네이드" salprc="3,500" salefl="Y" stk="7" stkstat="2">
                <label for="pdtOpt131173840" onclick="selectOption('131173840', 'opt');">
                  <span class="optTxt">248호 새콤달콤 레모네이드</span>
                  <span class="pdtQty">
                                        </span>
                </label>
              </li>


              <li>
                <input type="radio" name="optionSelector" id="pdtOpt131173841"
                       kindnm="249호 아이스 애플 민트" salprc="3,500" salefl="N" stk="-10" stkstat="2"
                       disabled="">
                <label for="pdtOpt131173841" style="display: block;">
                  <span class="optTxt">249호 아이스 애플 민트</span>
                  <span class="pdtQty">
                                            일시품절
                                        </span>
                </label>
              </li>

              <li>
                <input type="radio" name="optionSelector" id="pdtOpt131173842"
                       kindnm="250호 상큼한 오렌지 에이드" salprc="3,500" salefl="N" stk="-10" stkstat="2"
                       disabled="">
                <label for="pdtOpt131173842" style="display: block;">
                  <span class="optTxt">250호 상큼한 오렌지 에이드</span>
                  <span class="pdtQty">
                                            일시품절
                                        </span>
                </label>
              </li>

              <li>
                <input type="radio" name="optionSelector" id="pdtOpt131173843"
                       kindnm="251호 얼음 송송 포도 쉐이크" salprc="3,500" salefl="N" stk="-10" stkstat="2"
                       disabled="">
                <label for="pdtOpt131173843" style="display: block;">
                  <span class="optTxt">251호 얼음 송송 포도 쉐이크</span>
                  <span class="pdtQty">
                                            일시품절
                                        </span>
                </label>
              </li>
            </ul>
          </div>





        </div>

        <ul class="optList" id="optList">
          <li class="opt" id="optList131173840">
            <span class="name">248호 새콤달콤 레모네이드</span>
            <div class="countArea">
              <button class="btnMinus" type="button">수량 빼기</button>
              <input id="optCnt131173840" class="pdtQty" type="text">
              <button class="btnPlus" type="button">수량 더하기</button>
              <input type="hidden" name="pdtPrice" id="pdtPrice" value="3,500">
            </div><button class="btnDel" type="button"></button>
          </li>
        </ul>

        <script>
          pdtOptFunc();
        </script>

        <div class="total" id="totalSum">
          <span class="tit">합계</span>
          <span class="price"><span class="num" id="totSum">3,500</span>원</span>
        </div>

      </div>



      <div class="btnWrap" id="basketBtnArea" data-prdseq="33196">
                    <span><button type="button" class="btnType3"
                                  onclick="fnCartAdd('POPCART', '33196');">장바구니</button></span>
        <span><button type="button" class="btnType4"
                      onclick="fnCartAdd('ORDER', '33196');">바로구매</button></span>
      </div>

    </div>
    <button type="button" class="btnLayerClose" onclick="layerClose();">레이어 팝업 닫기</button>
  </section>
</div>
</body>
</html>
