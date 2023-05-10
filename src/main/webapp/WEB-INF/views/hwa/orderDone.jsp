<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/hwa/orderDone.css"/><!-- css -->

</head>
<body>
<div id="wrap">
    <header id="orderHeader">
        <div class="orderHead">
            <h1 class="logo"><a href="/"><img  id ="logoImg" src="/img/main/logo.png" alt="dobbyisfree"></a></h1>
            <p class="helpArea">
                <strong style="font-weight: bold">도움이 필요하세요?</strong>
                <span class="helpBtn">
                    <a href="/cs/notice/list" target="_blank" class="btnType1s"><span>FAQ</span></a> <!-- 고객센터, FAQ URL 추가 -->
                    <a href="" target="_blank" class="btnType1s"><span>1:1</span> 고객상담</a>
                </span>
            </p>
        </div>
    </header>

    <div id="container">
        <div class="orderWrap orderComWrap" id="orderComplete">
            <div class="orderComTop">
                <p class="txt1">주문이 완료되었습니다.</p>
                <p class="txt2">${orderer} 님의 주문번호는 <strong class="num">${orderId}</strong> 입니다.</p>
                <p class="txt4">이 주문 상품은 결제완료 시점에서 2일에서 3영업일 이내 배송이 되며 도서산간 및 행사 시 지연될 수 있습니다.</p>
            </div>


        <div class="btnWrap">
            <span><a href="/" class="btnType6l">홈으로</a></span>
            <span ><a href="/mypage/counsel/list" class="btnType3l" style="color: white">마이페이지</a></span>
        </div>
        <div class="orderComHelper">
            <p>
                결제 및 배송에 관한 확인은 마이페이지 &gt; 주문내역에서 확인 하실 수 있습니다.<br>
                기타 주문제품의 교환, 반품, 환불에 관한 문의는 1:1 고객문의나 주문관리에서 신청 또는 상담이 가능합니다.
            </p>
        </div>
    </div>
    </div>
</div>
</body>
</html>
