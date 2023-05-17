
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 메인</title>

    <style>
        .mTab.typeNav {
            position: relative;
            height: 60px;
            padding: 0 24px;
            border: 1px solid #e2e5ea;
            border-radius: 4px 4px 0 0;
            background-color: #fff;
        }

        .mTab.typeNav > ul > li {
            position: relative;
            float: left;
            margin: 0 0 0 24px;
            padding: 21px 0 20px;
            font-size: 12px;
            line-height: 20px;
        }

        .gTabMerge.ui-tabs .ui-tabs-panel {
            display: block;
            padding: 24px;
            margin: -1px 0 0;
            border: 1px solid #e2e5ea;
            border-radius: 0 0 4px 4px;
            background-color: #fff;
        }

        html:lang(ko) .mDashboard .mBoard thead th, html:lang(ko) .mDashboard .mBoard tbody th, html:lang(ko) .mDashboard .mBoard tbody td, html:lang(ko) .mDashboard .mallArea .graph {
            font-family: "Nanum Gothic","맑은 고딕","malgun gothic","Apple SD Gothic Neo",sans-serif;
        }

        .mallArea .gFlow {
            width: 440px;
        }

        .dashboardArea .gFlow {
            float: left;
            width: 496px;
        }
        .txtLess {
            font-size: 11px;
            letter-spacing: 0;
        }
        .gSingleSide {
            margin-left: 11px;
        }

        .gDouble {
            display: block;
            margin-top: 10px;
        }
        p.mList, ul.mList {
            margin: 10px 0 0;
        }

        .mallArea .gReverse {
            width: 483px;
        }

        html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
            margin: 0;
            padding: 0;
        }
        table {
            table-layout: fixed;
            width: 100%;
            border: 0;
            border-spacing: 0;
            border-collapse: collapse;
        }

        .mBoard table {
            border-top: 1px solid #e2e5ea;
            line-height: 16px;
            background-color: #fff;
        }

        caption {
            visibility: hidden;
            position: absolute;
            left: -1000px;
            top: -1000px;
            height: 0;
            width: 0;
            display: none;
        }

        colgroup {
            display: table-column-group;
        }

        .mBoard th, .mBoard td {
            padding: 6px 8px;
            vertical-align: middle !important;
            letter-spacing: 0;
            width: 80px !important;
            height: 15px !important;

        }

        .mBoard th {
            border: 1px solid #e2e5ea;
            font-weight: normal;
            background-color: #fafafd;
        }
        .mBoard .right {
            text-align: right;
        }

        .mDashboard {
            position: relative;

        }

        .dashboardArea {
            margin: 0 0 16px;
        }
        .dashboardArea .gReverse {
            float: right;
            width: 520px;
        }

        .txtLess {
            font-size: 11px;
            letter-spacing: 0;
        }

        .gSingleSide {
            margin-left: 11px;
        }

        .gDouble {
            display: block;
            margin-top: 10px;
        }

        .gTabMerge.ui-tabs {
            padding: 0;
        }
        .mallArea:after {
            content: "";
            display: block;
            clear: both;
        }
        .content {
            width: 1140px;
            /*width: 1200px;*/
        }

        .mDashboard .title {
            position: relative;
            margin: 0 0 8px;
            line-height: 1;
        }
        .mDashboard .today {
            position: absolute;
            top: 28px;
            right: 4px;
            font-size: 12px;
            color: #667084;
        }
        html:lang(ko) .mDashboard .today {
            font-size: 13px;
        }
        .mDashboard .title h2 {
            float: left;
            font-size: 16px;
            color: #1b1e26;
            line-height: 24px;
        }

        .mBoard th {
            border: 1px solid #e2e5ea;
            font-weight: normal;
            background-color: #fafafd;
        }

        .mallArea .mBoard tbody th {
            height: 28px;
            text-align: center;
            padding: 6px 8px;
            background-color: #fff;
        }
        html:lang(ko) .mDashboard .mBoard tbody th {
            letter-spacing: -0.5px;
        }
        .mBoard .right {
            text-align: right;
        }

        .mallArea .mBoard tbody td {
            height: 28px;
        }
        .mDashboard .title:after {
            content: "";
            display: block;
            clear: both;
        }

        .ui-state-default.ui-tabs-selected>a {
            color: #00BFFF;
        }

    </style>

</head>
<link rel="stylesheet" href="/css/hoon/admin.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>




<body>

<div class="admin">
    <jsp:include page="../admin_header.jsp"/>
    <div class="admin-bar">
        <jsp:include page="../admin_left.jsp"/>


        <%--컨텐츠--%>
        <div class="admin-container">
            <div class="admin-location">HOME</div>
            <!-- 오늘의 할일 시작 -->
            <div class="content">
                <div class="dashboardArea">
                    <div class="mDashboard">
                        <div class="title">
                            <h2>오늘의 할 일<div class="cTip" code="MA.20" data-gtm="DATA_today_tip"></div></h2>
                            <p class="today"><strong>05월 18일</strong> 목요일</p>
                        </div>

                        <!-- 오늘의 할일 시작 -->
                        <div class="mBoard">
                            <table border="1" summary="">
                                <caption>오늘의 할 일</caption>
                                <colgroup>
                                    <col span="8" style="width:auto;"><!-- 참고 : 항목 개수에 따라 span 값 변경 -->
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col" rowspan="2">입금전</th>
                                    <th scope="col" rowspan="2">상품준비중
<%--                                        /<br>배송보류중--%>
                                    </th>
                                    <th scope="col" rowspan="2">배송대기</th>
                                    <th scope="col" rowspan="2">배송중</th>
                                    <th scope="col">취소</th>
                                    <th scope="col">교환</th>
                                    <th scope="col">반품</th>
                                    <th scope="col" rowspan="2">환불전</th>
                                    <th scope="col" rowspan="2">게시물 관리</th>
                                </tr>
                                <tr>
                                    <th>신청/처리중</th>
                                    <th>신청/처리중</th>
                                    <th>신청/처리중</th>
                                </tr>
                                </thead>
                                <tbody class="center">
                                <tr class="total">
                                    <td><a href="" target="_top" data-gtm="TODO_before_deposit"><strong><span id="no_pay_cnt">0</span></strong></a></td>
                                    <td>
                                        <a href="/admin/order" target="_top" data-gtm="TODO_preparing_delivery"><strong><span id="is_shipped_f">1</span></strong></a>
<%--                                        <a href="" target="_top" data-gtm="TODO_delivery_pending"><strong><span id="product_prepare_dlv_delay">0</span></strong></a>--%>
                                    </td>
                                    <td><a href="" target="_top" data-gtm="TODO_waiting_delivery"><strong><span id="is_shipped_w">0</span></strong></a> </td>
                                    <td><a href="" target="_top" data-gtm="TODO_shipping"><strong><span id="is_shipped_m">0</span></strong></a></td>
                                    <td><a href="" target="_top" data-gtm="TODO_cancellation_processing"><strong><span id="canceling_count">0</span></strong></a></td>
                                    <td><a href="" target="_top" data-gtm="TODO_exchange_processing"><strong><span id="changing_count">0</span></strong></a></td>
                                    <td><a href="" target="_top" data-gtm="TODO_return_processing"><strong><span id="returning_count">0</span></strong></a></td>
                                    <td><a href="" target="_top" data-gtm="TODO_before_refund"><strong><span id="before_refund">0</span></strong></a> </td>
                                    <td><a href="#none" onclick="top.MenuAction.change('', '390', '', 'transformTreeNo');" data-gtm="TODO_post_management"><strong><span id="write_cnt">0</span></strong></a> </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 오늘의 할일 끝 -->

                    <!-- 쇼핑몰 현황 시작 -->
                    <div class="mDashboard gTabMerge eTabs ui-tabs ui-widget ui-widget-content ui-corner-all">
                        <div class="title">
                            <h2>쇼핑몰 현황 </h2>
                        </div>

                        <%-- Ajax로 변경할 부분 시작 --%>
                        <div class="mTab typeNav mallStauts">
                            <ul class="tab-menu ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                                <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#tabMallStatus1" id="tabMallStatus1Button" >일별 매출 현황</a></li>
                                <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus2" >주문처리 현황</a></li>
                                <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus3">회원/적립금 현황</a></li>
                                <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus5" data-gtm="DATA_post_status">게시물 현황</a></li>
                            </ul>
                        </div>


                        <!-- 일별 매출 현황 탭 -->
                        <div id="tabMallStatus1" class="tabMallStatus ui-tabs-panel ui-widget-content ui-corner-bottom">
                            <div class="mallArea">
                                <div class="gFlow graph">
                                    <span class="gSingleSide gDouble txtLess" id="eMainSalesDailyChartUnit">단위/만원</span>


                                    <%--라인 챠트--%>
                                    <div style="width: 460px; height: 278px; overflow-y: hidden;overflow-clip-margin: content-box; ">
                                        <!--차트가 그려질 부분-->
                                        <canvas class="myChartLine"></canvas>
                                    </div>



                                    <div class="gSingleSide">
                                        <ul class="mList">
                                            <li>최종 업데이트일시 : <span id="eMainSalesDailyChartRefleshTime">2023-05-18 14:00</span> (1시간마다 업데이트)</li>
                                            <li>합계/평균에 오늘은 포함되지 않고 어제이전 데이터가 포함됩니다.</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="gReverse">
                                    <div class="mBoard">
                                        <table border="1" summary="">
                                            <caption>일별 매출 현황</caption>
                                            <colgroup>
                                                <col style="width:auto;">
                                                <col style="width:26%;">
                                                <col style="width:26%;">
                                                <col style="width:25%;">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th scope="col">날짜</th>
                                                <th scope="col">주문</th>
                                                <th scope="col">결제</th>
                                                <th scope="col">환불(취소/반품)</th>
                                            </tr>
                                            </thead>
                                            <tbody class="right">
                                            <tr class="">
                                                <th scope="row" id="dailyCountTitle1">05월 15일</th>
                                                <td id="dailyCountOrderPrice1">170,000 원<br>(4건)</td>
                                                <td id="dailyCountPayedPrice1">132,000 원<br>(3건)</td>
                                                <td id="dailyCountRefundPrice1">0 원<br>(0건)</td>
                                            </tr>
                                            <tr class="">
                                                <th scope="row" id="dailyCountTitle2">05월 16일</th>
                                                <td id="dailyCountOrderPrice2">150,000 원<br>(3건)</td>
                                                <td id="dailyCountPayedPrice2">104,000  원<br>(2건)</td>
                                                <td id="dailyCountRefundPrice2">0 원<br>(0건)</td>
                                            </tr>
                                            <tr class="">
                                                <th scope="row" id="dailyCountTitle3">05월 17일</th>
                                                <td id="dailyCountOrderPrice3">50,000 원<br>(1건)</td>
                                                <td id="dailyCountPayedPrice3">20,000 원<br>(1건)</td>
                                                <td id="dailyCountRefundPrice3">0 원<br>(0건)</td>
                                            </tr>
                                            <tr class="em">
                                                <th scope="row" id="dailyCountTitleToday">05월 18일</th>
                                                <td id="dailyCountOrderPriceToday">54,000 원<br>(1건)</td>
                                                <td id="dailyCountPayedPriceToday">54,000 원<br>(1건)</td>
                                                <td id="dailyCountRefundPriceToday">0 원<br>(0건)</td>
                                            </tr>
                                            <tr class="total">
                                                <th scope="row" id="weeklyCountOrderAvgTitle">최근 7일 평균</th>
                                                <td id="weeklyCountOrderPriceAvg">474,000 원<br>(12건)</td>
                                                <td id="weeklyCountPayedPriceAvg">327,000 원<br>(8건)</td>
                                                <td id="weeklyCountRefundPriceAvg">0 원<br>(0건)</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" id="weeklyCountOrderTotalTitle">최근 7일 합계</th>
                                                <td id="weeklyCountOrderPriceTotal">474,000 원<br>(12건)</td>
                                                <td id="weeklyCountPayedPriceTotal">327,000 원<br>(8건)</td>
                                                <td id="weeklyCountRefundPriceTotal">0 원<br>(0건)</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" id="monthlyCountOrderAvgTitle">최근 30일 평균</th>
                                                <td id="monthlyCountOrderPriceAvg">474,000 원<br>(12건)</td>
                                                <td id="monthlyCountPayedPriceAvg">327,000 원<br>(8건)</td>
                                                <td id="monthlyCountRefundPriceAvg">0 원<br>(0건)</td>
                                            </tr>
                                            <tr class="total">
                                                <th scope="row" id="monthlyCountOrderTotalTitle">최근 30일 합계</th>
                                                <td id="monthlyCountOrderPriceTotal">474,000 원<br>(12건)</td>
                                                <td id="monthlyCountPayedPriceTotal">327,000 원<br>(8건)</td>
                                                <td id="monthlyCountRefundPriceTotal">0 원<br>(0건)</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>  <!-- 엠보드 끝-->
                                </div> <!-- gReverse 끝-->
                            </div> <!-- mallArea 끝-->
                        </div> <!-- tabMallStatus1 끝-->
                        <!-- //일별 매출 현황 탭 -->
                        <!-- 주문처리 현황 -->
                        <div id="tabMallStatus2" class="tabMallStatus ui-tabs-panel ui-widget-content ui-corner-bottom ">
                            <div class="mallArea">
                                <div class="mBoard">
                                    <table border="1" summary="">
                                        <caption>주문처리 현황</caption>
                                        <colgroup>
                                            <col style="width:10%;">
                                        </colgroup>

                                        <thead>
                                        <tr>
                                            <th scope="col">날짜</th>
                                            <th scope="col">입금전</th>
                                            <th scope="col">상품준비중</th>
                                            <th scope="col">배송대기중</th>
                                            <th scope="col">배송중</th>
                                            <th scope="col">배송완료</th>
                                            <th scope="col">취소</th>
                                            <th scope="col">교환</th>
                                            <th scope="col">반품</th>
                                            <th scope="col"><strong>주문합계</strong></th>
                                        </tr>
                                        </thead>
                                        <tbody class="right">
                                        <tr class="">
                                            <th scope="row" id="orderCountTitle1">05월 12일</th>
                                            <td id="payWaitOrderCount1">1건</td>
                                            <td id="shipReadyOrderCount1">0건</td>
                                            <td id="shipWaitOrderCount1">1건</td>
                                            <td id="shippingOrderCount1">0건</td>
                                            <td id="shipendOrderCount1">0건</td>
                                            <td id="cancelOrderCount1">0건</td>
                                            <td id="changeOrderCount1">0건</td>
                                            <td id="returnOrderCount1">0건</td>
                                            <td id="totalOrderCount1">0건</td>
                                        </tr>
                                        <tr class="">
                                            <th scope="row" id="orderCountTitle2">05월 13일</th>
                                            <td id="payWaitOrderCount2">1건</td>
                                            <td id="shipReadyOrderCount2">0건</td>
                                            <td id="shipWaitOrderCount2">2건</td>
                                            <td id="shippingOrderCount2">0건</td>
                                            <td id="shipendOrderCount2">0건</td>
                                            <td id="cancelOrderCount2">0건</td>
                                            <td id="changeOrderCount2">0건</td>
                                            <td id="returnOrderCount2">0건</td>
                                            <td id="totalOrderCount2">0건</td>
                                        </tr>
                                        <tr class="">
                                            <th scope="row" id="orderCountTitle3">05월 14일</th>
                                            <td id="payWaitOrderCount3">1건</td>
                                            <td id="shipReadyOrderCount3">0건</td>
                                            <td id="shipWaitOrderCount3">2건</td>
                                            <td id="shippingOrderCount3">0건</td>
                                            <td id="shipendOrderCount3">0건</td>
                                            <td id="cancelOrderCount3">0건</td>
                                            <td id="changeOrderCount3">0건</td>
                                            <td id="returnOrderCount3">0건</td>
                                            <td id="totalOrderCount3">0건</td>
                                        </tr>
                                        <tr class="">
                                            <th scope="row" id="orderCountTitle4">05월 15일</th>
                                            <td id="payWaitOrderCount4">2건</td>
                                            <td id="shipReadyOrderCount4">0건</td>
                                            <td id="shipWaitOrderCount4">2건</td>
                                            <td id="shippingOrderCount4">0건</td>
                                            <td id="shipendOrderCount4">0건</td>
                                            <td id="cancelOrderCount4">0건</td>
                                            <td id="changeOrderCount4">0건</td>
                                            <td id="returnOrderCount4">0건</td>
                                            <td id="totalOrderCount4">0건</td>
                                        </tr>
                                        <tr class="">
                                            <th scope="row" id="orderCountTitle5">05월 16일</th>
                                            <td id="payWaitOrderCount5">1건</td>
                                            <td id="shipReadyOrderCount5">0건</td>
                                            <td id="shipWaitOrderCount5">2건</td>
                                            <td id="shippingOrderCount5">0건</td>
                                            <td id="shipendOrderCount5">0건</td>
                                            <td id="cancelOrderCount5">0건</td>
                                            <td id="changeOrderCount5">0건</td>
                                            <td id="returnOrderCount5">0건</td>
                                            <td id="totalOrderCount5">0건</td>
                                        </tr>
                                        <tr class="">
                                            <th scope="row" id="orderCountTitle6">05월 17일</th>
                                            <td id="payWaitOrderCount6">0건</td>
                                            <td id="shipReadyOrderCount6">0건</td>
                                            <td id="shipWaitOrderCount6">1건</td>
                                            <td id="shippingOrderCount6">0건</td>
                                            <td id="shipendOrderCount6">0건</td>
                                            <td id="cancelOrderCount6">0건</td>
                                            <td id="changeOrderCount6">0건</td>
                                            <td id="returnOrderCount6">0건</td>
                                            <td id="totalOrderCount6">0건</td>
                                        </tr>
                                        <tr class="em">
                                            <th scope="row" id="orderCountTitleToday">05월 18일 (오늘)</th>
                                            <td id="payWaitOrderCountToday">0건</td>
                                            <td id="shipReadyOrderCountToday">1건</td>
                                            <td id="shipWaitOrderCountToday">0건</td>
                                            <td id="shippingOrderCountToday">0건</td>
                                            <td id="shipendOrderCountToday">0건</td>
                                            <td id="cancelOrderCountToday">0건</td>
                                            <td id="changeOrderCountToday">0건</td>
                                            <td id="returnOrderCountToday">0건</td>
                                            <td id="totalOrderCountToday">1건</td>
                                        </tr>
                                        <tr class="total">
                                            <th scope="row" id="orderCountTitleTotal"><strong>합계</strong></th>
                                            <td id="payWaitOrderCountTotal"><strong>6</strong>건</td>
                                            <td id="shipReadyOrderCountTotal"><strong>1</strong>건</td>
                                            <td id="shipWaitOrderCountTotal"><strong>11</strong>건</td>
                                            <td id="shippingOrderCountTotal"><strong>0</strong>건</td>
                                            <td id="shipendOrderCountTotal"><strong>0</strong>건</td>
                                            <td id="cancelOrderCountTotal"><strong>0</strong>건</td>
                                            <td id="changeOrderCountTotal"><strong>0</strong>건</td>
                                            <td id="returnOrderCountTotal"><strong>0</strong>건</td>
                                            <td id="totalOrderCountTotal"><strong>18</strong>건</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- //주문처리 현황 -->


                        <!-- 회원/적립금 현황 -->
                        <div id="tabMallStatus3" class="tabMallStatus ui-tabs-panel ui-widget-content ui-corner-bottom">
                            <div class="mallArea">
                                <div class="gFlow graph">
                                    <span class="gSingleSide gDouble txtLess" id="eMainMemberChartUnit">단위/명</span>
                                    <%-- 라인 챠트--%>
                                    <div style="width: 460px; height: 278px; overflow-y: hidden;overflow-clip-margin: content-box; ">
                                        <!--차트가 그려질 부분-->
                                        <canvas class="myChartLine2"></canvas>
                                    </div>
                                </div>
                                <div class="gReverse">
                                    <div class="mBoard">
                                        <table border="1" summary="" id="viewMemberCountMileage">
                                            <caption>회원/적립금 현황</caption>
                                            <colgroup>
                                                <col style="width:22%;">
                                                <col style="width:39%;">
                                                <col style="width:39%;">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th scope="col">날짜</th>
                                                <th scope="col">신규 회원 가입 현황(누적)</th>
                                                <th scope="col">적립금 적용 현황(누적)</th>
                                            </tr>
                                            </thead>
                                            <tbody class="right">

                                            <tr class=""><td>05월 14일</td>
                                                <td>3 명</td>
                                                <td>0 원</td>
                                            </tr>
                                            <tr class=""><td>05월 15일 (오늘)</td>
                                                <td>4 명</td>
                                                <td>0 원</td>
                                            </tr>
                                            <tr class=""><td>05월 16일</td>
                                                <td>2 명</td>
                                                <td>0 원</td>
                                            </tr>
                                            <tr class=""><td>05월 17일</td>
                                                <td>3 명</td>
                                                <td>0 원</td>
                                            </tr>
                                            <tr class=""><td>05월 18일</td>
                                                <td>1 명</td>
                                                <td>0 원</td>
                                            </tr>
                                            <tr class=""><td>05월 19일</td>
                                                <td>0 명</td>
                                                <td>0 원</td>
                                            </tr>
                                            <tr class="em"><td>05월 20일</td>
                                                <td>0 명</td>
                                                <td>0 원</td>
                                            </tr>
                                            <tr class="total">
                                                <td><strong>합계</strong></td>
                                                <td><strong>13</strong> 명</td>
                                                <td><strong>0</strong> 원</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //회원/적립금 현황 -->




                        <!-- 게시물 현황 -->
                        <div id="tabMallStatus5" class="tabMallStatus ui-tabs-panel ui-widget-content ui-corner-bottom">
                            <div class="mallArea">
                                <div class="mBoard">
                                    <table border="1" summary="">
                                        <caption>게시물 현황</caption>
                                        <colgroup>
                                            <col span="4" style="width:auto;"><!-- 참고 : 항목 개수에 따라 span 값 변경 -->
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th scope="col">날짜</th>
                                            <th scope="col">공지사항</th>
                                            <th scope="col">FAQ</th>
                                            <th scope="col">1:1상담</th>
                                        </tr>
                                        </thead>

                                        <tbody class="right">
                                        <tr class="">
                                            <th scope="row">05월 14일</th>
                                            <td>3 건</td>
                                            <td>4 건</td>
                                            <td>1 건</td>


                                        </tr>
                                        <tr class="">
                                            <th scope="row">05월 15일(오늘)</th>
                                            <td>2 건</td>
                                            <td>1 건</td>
                                            <td>1건</td>


                                        </tr>
                                        <tr class="">
                                            <th scope="row">05월 16일</th>
                                            <td>1 건</td>
                                            <td>2 건</td>
                                            <td>3 건</td>


                                        </tr>
                                        <tr class="">
                                            <th scope="row">05월 17일</th>
                                            <td>1 건</td>
                                            <td>1 건</td>
                                            <td>1 건</td>


                                        </tr>
                                        <tr class="">
                                            <th scope="row">05월 18일</th>
                                            <td>2 건</td>
                                            <td>1 건</td>
                                            <td>1 건</td>

                                        </tr>
                                        <tr class="">
                                            <th scope="row">05월 19일</th>
                                            <td>0 건</td>
                                            <td>0 건</td>
                                            <td>0 건</td>


                                        </tr>
                                        <tr class="">
                                            <th scope="row">05월 20일</th>
                                            <td>0 건</td>
                                            <td>0 건</td>
                                            <td>0 건</td>


                                        </tr>

                                        <tr class="total">
                                            <th scope="row"><strong>합계</strong></th>
                                            <td><strong>8</strong> 건</td>
                                            <td><strong>9</strong> 건</td>
                                            <td><strong>7</strong> 건</td>

                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- //게시물 현황 -->
                    </div>
                </div>



                <!-- //일별 매출 현황 탭 -->







            </div> <!-- content 끝 -->
        </div>

        <%--컨텐츠 끝--%>
    </div>
</div>


<script >

    $(document).ready(function() {
        // 초기화 // 이거 복습하고 다시 만들어보기
        $('.tabMallStatus').hide(); // 모든 탭 내용을 숨김
        $('.tabMallStatus:first').show(); // 첫 번째 탭 내용을 보임
        $('.tab-menu li:first').addClass('active'); // 첫 번째 탭 메뉴에 active 클래스 추가

        // 탭 메뉴 클릭 이벤트 처리
        $('.tab-menu li').click(function() {
            $('.tab-menu li').removeClass('active'); // 모든 탭 메뉴에서 active 클래스 제거
            $(this).addClass('active'); // 클릭한 탭 메뉴에 active 클래스 추가
            $('.tabMallStatus').hide(); // 모든 탭 내용을 숨김
            var activeTab = $(this).find('a').attr('href'); // 클릭한 탭 메뉴의 href 속성 값을 가져옴
            $(activeTab).fadeIn(); // 해당 탭 내용을 보임
            return false;
        });
    });


    let  showList = function() {
        //서버에 전달할 검색어와 옵션을 변수에 담는다.


        $('.test').empty(); // 쇼핑몰 현황을 비운다.

        $.ajax({
            type: 'PATCH',
            url: "/admin/main/status",
            contentType : 'application/json',

            data: JSON.stringify({

                // JSON으로 보낼 값을 넣는다.
                // page : page,
                // pageSize: pageSize,


            }),
            // traditional: true, // 배열 형태의 데이터를 전송할 때 필요한 옵션
            success: function (data) {
                console.log(data);
                processListData(data);// 화면에 출력하는 함수

            },
            error: function () {
                // 에러 시 처리할 코드
            }
        });
    }

    function processListData(data) {

        $('.center').html(toHtml(data.list)); // 서버에서 전달받은 무언가를 보여준다.

    }

    <%--  그래프 불러오기  --%>
    let context = document
        .querySelector('.myChartLine')
        .getContext('2d');

    let context2 = document
        .querySelector('.myChartLine2')
        .getContext('2d');
    //     let context = document
    //         .getElementById('myChartLine')
    //         .getContext('2d');

    // let context2 = document
    //     .getElementById('myChartBar')
    //     .getContext('2d');
    //
    // let context3 = document
    //     .getElementById('myChartPie')
    //     .getContext('2d');

    let myChartLine = new Chart(context, {
        type: 'line', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
                '14','15','16','17','18','19','20'
            ],
            datasets: [
                { //데이터
                    label: '일별 결제 현황', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        3.7, //일  14
                        13.2, // 월 15
                        10.4, // 화 16
                        2, // 수 17
                        5.4, // 목 18
                        0, // 금 19
                        0 // 토 20
                         //x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor:
                        //색상
                        'rgba(255, 99, 132, 0.2)',
                        // 'rgba(54, 162, 235, 0.2)',
                        // 'rgba(255, 206, 86, 0.2)',
                        // 'rgba(75, 192, 192, 0.2)',
                        // 'rgba(153, 102, 255, 0.2)',
                        // 'rgba(255, 159, 64, 0.2)'

                    borderColor:
                        //경계선 색상
                        'rgba(255, 99, 132, 1)',
                        // 'rgba(54, 162, 235, 1)',
                        // 'rgba(255, 206, 86, 1)',
                        // 'rgba(75, 192, 192, 1)',
                        // 'rgba(153, 102, 255, 1)',
                        // 'rgba(255, 159, 64, 1)'

                    borderWidth: 1, //경계선 굵기
                    lineTension: 0 // 선을 직선으로 표시
                }
                 ,
                { //데이터
                    label: '일별 주문 현황', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        5, //일  14
                        17, // 월 15
                        15, // 화 16
                        5, // 수 17
                        5.4, // 목 18
                        0, // 금 19
                        0 // 토 20
                        //x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor:
                    //색상
                    //     'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    // 'rgba(255, 206, 86, 0.2)',
                    // 'rgba(75, 192, 192, 0.2)',
                    // 'rgba(153, 102, 255, 0.2)',
                    // 'rgba(255, 159, 64, 0.2)'

                    borderColor:
                    //경계선 색상
                    //     'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    // 'rgba(255, 206, 86, 1)',
                    // 'rgba(75, 192, 192, 1)',
                    // 'rgba(153, 102, 255, 1)',
                    // 'rgba(255, 159, 64, 1)'

                    borderWidth: 1, //경계선 굵기
                    lineTension: 0 // 선을 직선으로 표시
                }
            ]
        },
        options: {
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            }
        }
    });


    let myChartLine2 = new Chart(context2, {
        type: 'line', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
                '14','15','16','17','18','19','20'
            ],
            datasets: [
                { //데이터
                    label: '주간 신규회원', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        3,4,2,3,1,0,0 //x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor:
                        //색상
                        'rgba(255, 99, 132, 0.2)'
                        // 'rgba(255, 99, 132, 0.2)',
                        // 'rgba(54, 162, 235, 0.2)',
                        // 'rgba(255, 206, 86, 0.2)',
                        // 'rgba(75, 192, 192, 0.2)',
                        // 'rgba(153, 102, 255, 0.2)',
                        // 'rgba(255, 159, 64, 0.2)'
                    ,
                    borderColor:
                        //경계선 색상
                        'rgba(255, 99, 132, 1)'
                        // 'rgba(255, 99, 132, 1)',
                        // 'rgba(54, 162, 235, 1)',
                        // 'rgba(255, 206, 86, 1)',
                        // 'rgba(75, 192, 192, 1)',
                        // 'rgba(153, 102, 255, 1)',
                        // 'rgba(255, 159, 64, 1)'
                    ,
                    borderWidth: 1, //경계선 굵기
                    lineTension: 0 // 선을 직선으로 표시
                },
                // {
                //     label: '주간 적립금 적용',
                //     fill: false,
                //     data: [
                //         0, 0, 0, 0,0,0,0
                //     ],
                //     backgroundColor: 'rgba(54, 162, 235, 0.2)',
                //     borderColor: 'rgba(54, 162, 235, 1)',
                //     borderWidth: 1 //경계선 굵기
                // }
            ]
        },
        options: {
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true,
                            stepSize: 5
                        }
                    }
                ]
            }
        }
    });



</script>

<jsp:include page="../admin_footer.jsp"/>


<script >
    let msg = "${msg}";
    if (msg=="login_ERR") alert("관리자 아이디로 로그인 해주세요.")
</script>

</body>
</html>