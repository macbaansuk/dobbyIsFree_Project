
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
    <title>관리자 메인</title>

    <style>

    </style>

</head>
<link rel="stylesheet" href="/css/hoon/admin.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%--<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>--%>
<%--<link rel="stylesheet" href="http://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">--%>
<%--<link rel="stylesheet" href="/css/hoon/jquery/jquery-ui.css">--%>
<%--<script src="/css/hoon/jquery/jquery-ui.min.js"></script>--%>



<body>

<div class="admin">
    <jsp:include page="../admin_header.jsp"/>
    <div class="admin-bar">
        <jsp:include page="../admin_left.jsp"/>


<%--컨텐츠--%>
        <div class="admin-container">
            <div class="admin-location">HOME</div>
            <!-- 오늘의 할일 시작 -->
            <div class="mDashboard">
                <div class="title">
                    <h2>오늘의 할 일<div class="cTip" code="MA.20" data-gtm="DATA_today_tip"></div></h2>
                    <p class="today"><strong>05월 09일</strong> 화요일</p>
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
                            <th scope="col" rowspan="2">배송준비중/<br>배송보류중</th>
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
                                <a href="" target="_top" data-gtm="TODO_preparing_delivery"><strong><span id="is_shipped_f">0/</span></strong></a>
                                <a href="" target="_top" data-gtm="TODO_delivery_pending"><strong><span id="product_prepare_dlv_delay">0</span></strong></a>
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
                <div class="mTab typeNav mallStauts">
                    <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                        <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#tabMallStatus1" id="tabMallStatus1Button" >일별 매출 현황</a></li>
                        <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus2" >주문처리 현황</a></li>
                        <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus3">회원/적립금 현황</a></li>
                        <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus4" data-gtm="DATA_deposit_status">예치금 현황</a></li>
                        <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus5" data-gtm="DATA_post_status">게시물 현황</a></li>
                    </ul>
                </div>
                <!-- 일별 매출 현황 탭 -->
                <div id="tabMallStatus1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
                    <div class="mallArea">
                        <div class="gFlow graph">
                            <span class="gSingleSide gDouble txtLess" id="eMainSalesDailyChartUnit">단위/만원</span>

<%--                            <iframe name="iChartForm" id="eMainSalesDailyChartIframe" src="" frameborder="0" width="100%" height="278px" style="overflow-y:hidden;" scrolling="no" title="세로 바 그래프"></iframe>--%>
                            <iframe name="iChartForm" id="eMainSalesDailyChartIframe" src="/disp/admin/report/chartpie?mode=main_dashboard&amp;what_call=ADMIN_MAIN_CHART.aChartLayerList[0].data" frameborder="0" width="100%" height="278px" style="overflow-y:hidden;" scrolling="no" title="세로 바 그래프"></iframe>

                            <div class="gSingleSide">
                                <ul class="mList">
                                    <li>최종 업데이트일시 : <span id="eMainSalesDailyChartRefleshTime">2023-05-09 17:00</span> (1시간마다 업데이트)</li>
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
                                        <th scope="row" id="dailyCountTitle1">05월 06일</th>
                                        <td id="dailyCountOrderPrice1">0 원<br>(0건)</td>
                                        <td id="dailyCountPayedPrice1">0 원<br>(0건)</td>
                                        <td id="dailyCountRefundPrice1">0 원<br>(0건)</td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" id="dailyCountTitle2">05월 07일</th>
                                        <td id="dailyCountOrderPrice2">0 원<br>(0건)</td>
                                        <td id="dailyCountPayedPrice2">0 원<br>(0건)</td>
                                        <td id="dailyCountRefundPrice2">0 원<br>(0건)</td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" id="dailyCountTitle3">05월 08일</th>
                                        <td id="dailyCountOrderPrice3">0 원<br>(0건)</td>
                                        <td id="dailyCountPayedPrice3">0 원<br>(0건)</td>
                                        <td id="dailyCountRefundPrice3">0 원<br>(0건)</td>
                                    </tr>
                                    <tr class="em">
                                        <th scope="row" id="dailyCountTitleToday">05월 09일 (오늘)</th>
                                        <td id="dailyCountOrderPriceToday">0 원<br>(0건)</td>
                                        <td id="dailyCountPayedPriceToday">0 원<br>(0건)</td>
                                        <td id="dailyCountRefundPriceToday">0 원<br>(0건)</td>
                                    </tr>
                                    <tr class="total">
                                        <th scope="row" id="weeklyCountOrderAvgTitle">최근 7일 평균</th>
                                        <td id="weeklyCountOrderPriceAvg">0 원<br>(0건)</td>
                                        <td id="weeklyCountPayedPriceAvg">0 원<br>(0건)</td>
                                        <td id="weeklyCountRefundPriceAvg">0 원<br>(0건)</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" id="weeklyCountOrderTotalTitle">최근 7일 합계</th>
                                        <td id="weeklyCountOrderPriceTotal">0 원<br>(0건)</td>
                                        <td id="weeklyCountPayedPriceTotal">0 원<br>(0건)</td>
                                        <td id="weeklyCountRefundPriceTotal">0 원<br>(0건)</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" id="monthlyCountOrderAvgTitle">최근 30일 평균</th>
                                        <td id="monthlyCountOrderPriceAvg">0 원<br>(0건)</td>
                                        <td id="monthlyCountPayedPriceAvg">0 원<br>(0건)</td>
                                        <td id="monthlyCountRefundPriceAvg">0 원<br>(0건)</td>
                                    </tr>
                                    <tr class="total">
                                        <th scope="row" id="monthlyCountOrderTotalTitle">최근 30일 합계</th>
                                        <td id="monthlyCountOrderPriceTotal">0 원<br>(0건)</td>
                                        <td id="monthlyCountPayedPriceTotal">0 원<br>(0건)</td>
                                        <td id="monthlyCountRefundPriceTotal">0 원<br>(0건)</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //일별 매출 현황 탭 -->
            </div>


<%--            <div class="mTab typeNav mallStauts">--%>
<%--                <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">--%>
<%--                    <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#tabMallStatus1" id="tabMallStatus1Button" >일별 매출 현황</a></li>--%>
<%--                    <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus2" >주문처리 현황</a></li>--%>
<%--                    <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus3">회원/적립금 현황</a></li>--%>
<%--                    <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus4" data-gtm="DATA_deposit_status">예치금 현황</a></li>--%>
<%--                    <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus5" data-gtm="DATA_post_status">게시물 현황</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
            <!-- 일별 매출 현황 탭 -->
<%--            <div id="tabMallStatus1" class="ui-tabs-panel ui-widget-content ui-corner-bottom">--%>
<%--                <div class="mallArea">--%>
<%--                    <div class="gFlow graph">--%>
<%--                        <span class="gSingleSide gDouble txtLess" id="eMainSalesDailyChartUnit">단위/만원</span>--%>

<%--                        <iframe name="iChartForm" id="eMainSalesDailyChartIframe" src="" frameborder="0" width="100%" height="278px" style="overflow-y:hidden;" scrolling="no" title="세로 바 그래프"></iframe>--%>


<%--                        <div class="gSingleSide">--%>
<%--                            <ul class="mList">--%>
<%--                                <li>최종 업데이트일시 : <span id="eMainSalesDailyChartRefleshTime">2023-05-09 17:00</span> (1시간마다 업데이트)</li>--%>
<%--                                <li>합계/평균에 오늘은 포함되지 않고 어제이전 데이터가 포함됩니다.</li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="gReverse">--%>
<%--                        <div class="mBoard">--%>
<%--                            <table border="1" summary="">--%>
<%--                                <caption>일별 매출 현황</caption>--%>
<%--                                <colgroup>--%>
<%--                                    <col style="width:auto;">--%>
<%--                                    <col style="width:26%;">--%>
<%--                                    <col style="width:26%;">--%>
<%--                                    <col style="width:25%;">--%>
<%--                                </colgroup>--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th scope="col">날짜</th>--%>
<%--                                    <th scope="col">주문</th>--%>
<%--                                    <th scope="col">결제</th>--%>
<%--                                    <th scope="col">환불(취소/반품)</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody class="right">--%>
<%--                                <tr class="">--%>
<%--                                    <th scope="row" id="dailyCountTitle1">05월 06일</th>--%>
<%--                                    <td id="dailyCountOrderPrice1">0 원<br>(0건)</td>--%>
<%--                                    <td id="dailyCountPayedPrice1">0 원<br>(0건)</td>--%>
<%--                                    <td id="dailyCountRefundPrice1">0 원<br>(0건)</td>--%>
<%--                                </tr>--%>
<%--                                <tr class="">--%>
<%--                                    <th scope="row" id="dailyCountTitle2">05월 07일</th>--%>
<%--                                    <td id="dailyCountOrderPrice2">0 원<br>(0건)</td>--%>
<%--                                    <td id="dailyCountPayedPrice2">0 원<br>(0건)</td>--%>
<%--                                    <td id="dailyCountRefundPrice2">0 원<br>(0건)</td>--%>
<%--                                </tr>--%>
<%--                                <tr class="">--%>
<%--                                    <th scope="row" id="dailyCountTitle3">05월 08일</th>--%>
<%--                                    <td id="dailyCountOrderPrice3">0 원<br>(0건)</td>--%>
<%--                                    <td id="dailyCountPayedPrice3">0 원<br>(0건)</td>--%>
<%--                                    <td id="dailyCountRefundPrice3">0 원<br>(0건)</td>--%>
<%--                                </tr>--%>
<%--                                <tr class="em">--%>
<%--                                    <th scope="row" id="dailyCountTitleToday">05월 09일 (오늘)</th>--%>
<%--                                    <td id="dailyCountOrderPriceToday">0 원<br>(0건)</td>--%>
<%--                                    <td id="dailyCountPayedPriceToday">0 원<br>(0건)</td>--%>
<%--                                    <td id="dailyCountRefundPriceToday">0 원<br>(0건)</td>--%>
<%--                                </tr>--%>
<%--                                <tr class="total">--%>
<%--                                    <th scope="row" id="weeklyCountOrderAvgTitle">최근 7일 평균</th>--%>
<%--                                    <td id="weeklyCountOrderPriceAvg">0 원<br>(0건)</td>--%>
<%--                                    <td id="weeklyCountPayedPriceAvg">0 원<br>(0건)</td>--%>
<%--                                    <td id="weeklyCountRefundPriceAvg">0 원<br>(0건)</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <th scope="row" id="weeklyCountOrderTotalTitle">최근 7일 합계</th>--%>
<%--                                    <td id="weeklyCountOrderPriceTotal">0 원<br>(0건)</td>--%>
<%--                                    <td id="weeklyCountPayedPriceTotal">0 원<br>(0건)</td>--%>
<%--                                    <td id="weeklyCountRefundPriceTotal">0 원<br>(0건)</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <th scope="row" id="monthlyCountOrderAvgTitle">최근 30일 평균</th>--%>
<%--                                    <td id="monthlyCountOrderPriceAvg">0 원<br>(0건)</td>--%>
<%--                                    <td id="monthlyCountPayedPriceAvg">0 원<br>(0건)</td>--%>
<%--                                    <td id="monthlyCountRefundPriceAvg">0 원<br>(0건)</td>--%>
<%--                                </tr>--%>
<%--                                <tr class="total">--%>
<%--                                    <th scope="row" id="monthlyCountOrderTotalTitle">최근 30일 합계</th>--%>
<%--                                    <td id="monthlyCountOrderPriceTotal">0 원<br>(0건)</td>--%>
<%--                                    <td id="monthlyCountPayedPriceTotal">0 원<br>(0건)</td>--%>
<%--                                    <td id="monthlyCountRefundPriceTotal">0 원<br>(0건)</td>--%>
<%--                                </tr>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <!-- //일별 매출 현황 탭 -->


            <!-- 주문처리 현황 -->
            <div id="tabMallStatus2" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
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
                                <th scope="col">배송준비중</th>
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
                                <th scope="row" id="orderCountTitle1">05월 03일</th>
                                <td id="payWaitOrderCount1">0건</td>
                                <td id="shipReadyOrderCount1">0건</td>
                                <td id="shipWaitOrderCount1">0건</td>
                                <td id="shippingOrderCount1">0건</td>
                                <td id="shipendOrderCount1">0건</td>
                                <td id="cancelOrderCount1">0건</td>
                                <td id="changeOrderCount1">0건</td>
                                <td id="returnOrderCount1">0건</td>
                                <td id="totalOrderCount1">0건</td>
                            </tr>
                            <tr class="">
                                <th scope="row" id="orderCountTitle2">05월 04일</th>
                                <td id="payWaitOrderCount2">0건</td>
                                <td id="shipReadyOrderCount2">0건</td>
                                <td id="shipWaitOrderCount2">0건</td>
                                <td id="shippingOrderCount2">0건</td>
                                <td id="shipendOrderCount2">0건</td>
                                <td id="cancelOrderCount2">0건</td>
                                <td id="changeOrderCount2">0건</td>
                                <td id="returnOrderCount2">0건</td>
                                <td id="totalOrderCount2">0건</td>
                            </tr>
                            <tr class="">
                                <th scope="row" id="orderCountTitle3">05월 05일</th>
                                <td id="payWaitOrderCount3">0건</td>
                                <td id="shipReadyOrderCount3">0건</td>
                                <td id="shipWaitOrderCount3">0건</td>
                                <td id="shippingOrderCount3">0건</td>
                                <td id="shipendOrderCount3">0건</td>
                                <td id="cancelOrderCount3">0건</td>
                                <td id="changeOrderCount3">0건</td>
                                <td id="returnOrderCount3">0건</td>
                                <td id="totalOrderCount3">0건</td>
                            </tr>
                            <tr class="">
                                <th scope="row" id="orderCountTitle4">05월 06일</th>
                                <td id="payWaitOrderCount4">0건</td>
                                <td id="shipReadyOrderCount4">0건</td>
                                <td id="shipWaitOrderCount4">0건</td>
                                <td id="shippingOrderCount4">0건</td>
                                <td id="shipendOrderCount4">0건</td>
                                <td id="cancelOrderCount4">0건</td>
                                <td id="changeOrderCount4">0건</td>
                                <td id="returnOrderCount4">0건</td>
                                <td id="totalOrderCount4">0건</td>
                            </tr>
                            <tr class="">
                                <th scope="row" id="orderCountTitle5">05월 07일</th>
                                <td id="payWaitOrderCount5">0건</td>
                                <td id="shipReadyOrderCount5">0건</td>
                                <td id="shipWaitOrderCount5">0건</td>
                                <td id="shippingOrderCount5">0건</td>
                                <td id="shipendOrderCount5">0건</td>
                                <td id="cancelOrderCount5">0건</td>
                                <td id="changeOrderCount5">0건</td>
                                <td id="returnOrderCount5">0건</td>
                                <td id="totalOrderCount5">0건</td>
                            </tr>
                            <tr class="">
                                <th scope="row" id="orderCountTitle6">05월 08일</th>
                                <td id="payWaitOrderCount6">0건</td>
                                <td id="shipReadyOrderCount6">0건</td>
                                <td id="shipWaitOrderCount6">0건</td>
                                <td id="shippingOrderCount6">0건</td>
                                <td id="shipendOrderCount6">0건</td>
                                <td id="cancelOrderCount6">0건</td>
                                <td id="changeOrderCount6">0건</td>
                                <td id="returnOrderCount6">0건</td>
                                <td id="totalOrderCount6">0건</td>
                            </tr>
                            <tr class="em">
                                <th scope="row" id="orderCountTitleToday">05월 09일 (금일)</th>
                                <td id="payWaitOrderCountToday">0건</td>
                                <td id="shipReadyOrderCountToday">0건</td>
                                <td id="shipWaitOrderCountToday">0건</td>
                                <td id="shippingOrderCountToday">0건</td>
                                <td id="shipendOrderCountToday">0건</td>
                                <td id="cancelOrderCountToday">0건</td>
                                <td id="changeOrderCountToday">0건</td>
                                <td id="returnOrderCountToday">0건</td>
                                <td id="totalOrderCountToday">0건</td>
                            </tr>
                            <tr class="total">
                                <th scope="row" id="orderCountTitleTotal"><strong>합계</strong></th>
                                <td id="payWaitOrderCountTotal"><strong>0</strong>건</td>
                                <td id="shipReadyOrderCountTotal"><strong>0</strong>건</td>
                                <td id="shipWaitOrderCountTotal"><strong>0</strong>건</td>
                                <td id="shippingOrderCountTotal"><strong>0</strong>건</td>
                                <td id="shipendOrderCountTotal"><strong>0</strong>건</td>
                                <td id="cancelOrderCountTotal"><strong>0</strong>건</td>
                                <td id="changeOrderCountTotal"><strong>0</strong>건</td>
                                <td id="returnOrderCountTotal"><strong>0</strong>건</td>
                                <td id="totalOrderCountTotal"><strong>0</strong>건</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- //주문처리 현황 -->


            <!-- 회원/적립금 현황 -->
            <div id="tabMallStatus3" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <div class="mallArea">
                    <div class="gFlow graph">
                        <span class="gSingleSide gDouble txtLess" id="eMainMemberChartUnit">단위/명</span>
                        <iframe name="iChartForm" id="eMainMemberChartIframe" src="" frameborder="0" width="100%" height="300px" style="overflow-y:hidden;" scrolling="no" title="세로 바 그래프"></iframe>
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

                                <tr class=""><td>05월 03일</td>
                                    <td>0 명</td>
                                    <td>0 원</td>
                                </tr>
                                <tr class=""><td>05월 04일</td>
                                    <td>0 명</td>
                                    <td>0 원</td>
                                </tr>
                                <tr class=""><td>05월 05일</td>
                                    <td>0 명</td>
                                    <td>0 원</td>
                                </tr>
                                <tr class=""><td>05월 06일</td>
                                    <td>0 명</td>
                                    <td>0 원</td>
                                </tr>
                                <tr class=""><td>05월 07일</td>
                                    <td>0 명</td>
                                    <td>0 원</td>
                                </tr>
                                <tr class=""><td>05월 08일</td>
                                    <td>0 명</td>
                                    <td>0 원</td>
                                </tr>
                                <tr class="em"><td>05월 09일 (금일)</td>
                                    <td>0 명</td>
                                    <td>0 원</td>
                                </tr>
                                <tr class="total">
                                    <td><strong>합계</strong></td>
                                    <td><strong>0</strong> 명</td>
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
            <div id="tabMallStatus5" class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
                <div class="mallArea">
                    <div class="mBoard">
                        <table border="1" summary="">
                            <caption>게시물 현황</caption>
                            <colgroup>
                                <col span="9" style="width:auto;"><!-- 참고 : 항목 개수에 따라 span 값 변경 -->
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">날짜</th>
                                <th scope="col">공지사항</th>
                                <th scope="col">뉴스/이벤트</th>
                                <th scope="col">이용안내 FAQ</th>
                                <th scope="col">상품 사용후기</th>
                                <th scope="col">자유게시판</th>
                                <th scope="col">상품 Q&amp;A</th>
                                <th scope="col">자료실</th>
                                <th scope="col">갤러리</th>
                            </tr>
                            </thead>

                            <tbody class="right">
                            <tr class="">
                                <th scope="row">05월 03일</th>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                            </tr>
                            <tr class="">
                                <th scope="row">05월 04일</th>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                            </tr>
                            <tr class="">
                                <th scope="row">05월 05일</th>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                            </tr>
                            <tr class="">
                                <th scope="row">05월 06일</th>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                            </tr>
                            <tr class="">
                                <th scope="row">05월 07일</th>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                            </tr>
                            <tr class="">
                                <th scope="row">05월 08일</th>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                            </tr>
                            <tr class="">
                                <th scope="row">05월 09일</th>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                                <td>0 건</td>
                            </tr>

                            <tr class="total">
                                <th scope="row"><strong>합계</strong></th>
                                <td><strong>0</strong> 건</td>
                                <td><strong>0</strong> 건</td>
                                <td><strong>0</strong> 건</td>
                                <td><strong>0</strong> 건</td>
                                <td><strong>0</strong> 건</td>
                                <td><strong>0</strong> 건</td>
                                <td><strong>0</strong> 건</td>
                                <td><strong>0</strong> 건</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- //일별 매출 현황 탭 -->

            </div>
            <!-- //게시물 현황 -->

            <div class="title">
                <h2>쇼핑몰 현황</h2>
            </div>
            <div class="mTab typeNav mallStauts">
                <ul class="shopping-status">
                    <li class=""> <a href="#" id="tabMallStatus1Button1" data-gtm="DATA_daily_sales_status">일별 매출 현황</a></li>
                    <li class=""><a href="#" data-gtm="DATA_order_processing_status">주문처리 현황</a></li>
                    <li class=""><a href="#" data-gtm="DATA_membership_point_status">회원/적립금 현황</a></li>
                    <li class=""><a href="#" data-gtm="DATA_deposit_status">예치금 현황</a></li>
                    <li class=""><a href="#" data-gtm="DATA_post_status">게시물 현황</a></li>
                </ul>
            </div>
            <!-- 쇼핑몰 현황 끝 -->
        </div>

<%--컨텐츠 끝--%>
    </div>
</div>

<%--라인 챠트--%>
<div style="width: 900px; height: 900px;">
    <!--차트가 그려질 부분-->
    <canvas id="myChartLine"></canvas>
</div>
<div style="width: 900px; height: 900px;">
    <!--차트가 그려질 부분-->
    <canvas id="myChartBar"></canvas>
</div>

<div style="width: 900px; height: 900px;">
    <!--차트가 그려질 부분-->
    <canvas id="myChartPie"></canvas>
</div>

<script >
    let context = document
        .getElementById('myChartLine')
        .getContext('2d');

    let context2 = document
        .getElementById('myChartBar')
        .getContext('2d');

    let context3 = document
        .getElementById('myChartPie')
        .getContext('2d');

    let myChartLine = new Chart(context, {
        type: 'line', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
                '1','2','3','4','5','6','7'
            ],
            datasets: [
                { //데이터
                    label: 'test1', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor: [
                        //색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        //경계선 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //경계선 굵기
                }/* ,
                {
                    label: 'test2',
                    fill: false,
                    data: [
                        8, 34, 12, 24
                    ],
                    backgroundColor: 'rgb(157, 109, 12)',
                    borderColor: 'rgb(157, 109, 12)'
                } */
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




    let myChartBar = new Chart(context2, {
        type: 'bar', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
                '1','2','3','4','5','6','7'
            ],
            datasets: [
                { //데이터
                    label: 'test1', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor: [
                        //색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        //경계선 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1 //경계선 굵기
                }/* ,
                {
                    label: 'test2',
                    fill: false,
                    data: [
                        8, 34, 12, 24
                    ],
                    backgroundColor: 'rgb(157, 109, 12)',
                    borderColor: 'rgb(157, 109, 12)'
                } */
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


        let myChart3 = new Chart(context3, {
            type: 'pie', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '1','2','3','4','5','6','7'
                ],
                datasets: [
                    { //데이터
                        label: 'test1', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            //경계선 색상
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1 //경계선 굵기
                    }/* ,
                    {
                        label: 'test2',
                        fill: false,
                        data: [
                            8, 34, 12, 24
                        ],
                        backgroundColor: 'rgb(157, 109, 12)',
                        borderColor: 'rgb(157, 109, 12)'
                    } */
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

</script>

<%--&lt;%&ndash;바 챠트&ndash;%&gt;--%>
<%--<div style="width: 900px; height: 900px;">--%>
<%--    <!--차트가 그려질 부분-->--%>
<%--    <canvas id="myChartBar"></canvas>--%>
<%--</div>--%>

<%--<script type="text/javascript">--%>
<%--    let context_2 = document--%>
<%--        .getElementById('myChartBar')--%>
<%--        .getContext('2d');--%>

<%--    let myChart2 = new Chart(context, {--%>
<%--        type: 'bar', // 차트의 형태--%>
<%--        data: { // 차트에 들어갈 데이터--%>
<%--            labels: [--%>
<%--                //x 축--%>
<%--                '1','2','3','4','5','6','7'--%>
<%--            ],--%>
<%--            datasets: [--%>
<%--                { //데이터--%>
<%--                    label: 'test1', //차트 제목--%>
<%--                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지--%>
<%--                    data: [--%>
<%--                        21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값--%>
<%--                    ],--%>
<%--                    backgroundColor: [--%>
<%--                        //색상--%>
<%--                        'rgba(255, 99, 132, 0.2)',--%>
<%--                        'rgba(54, 162, 235, 0.2)',--%>
<%--                        'rgba(255, 206, 86, 0.2)',--%>
<%--                        'rgba(75, 192, 192, 0.2)',--%>
<%--                        'rgba(153, 102, 255, 0.2)',--%>
<%--                        'rgba(255, 159, 64, 0.2)'--%>
<%--                    ],--%>
<%--                    borderColor: [--%>
<%--                        //경계선 색상--%>
<%--                        'rgba(255, 99, 132, 1)',--%>
<%--                        'rgba(54, 162, 235, 1)',--%>
<%--                        'rgba(255, 206, 86, 1)',--%>
<%--                        'rgba(75, 192, 192, 1)',--%>
<%--                        'rgba(153, 102, 255, 1)',--%>
<%--                        'rgba(255, 159, 64, 1)'--%>
<%--                    ],--%>
<%--                    borderWidth: 1 //경계선 굵기--%>
<%--                }/* ,--%>
<%--                {--%>
<%--                    label: 'test2',--%>
<%--                    fill: false,--%>
<%--                    data: [--%>
<%--                        8, 34, 12, 24--%>
<%--                    ],--%>
<%--                    backgroundColor: 'rgb(157, 109, 12)',--%>
<%--                    borderColor: 'rgb(157, 109, 12)'--%>
<%--                } */--%>
<%--            ]--%>
<%--        },--%>
<%--        options: {--%>
<%--            scales: {--%>
<%--                yAxes: [--%>
<%--                    {--%>
<%--                        ticks: {--%>
<%--                            beginAtZero: true--%>
<%--                        }--%>
<%--                    }--%>
<%--                ]--%>
<%--            }--%>
<%--        }--%>
<%--    });--%>

<%--</script>--%>

<%--<div style="width: 900px; height: 900px;">--%>
<%--    <!--차트가 그려질 부분-->--%>
<%--    <canvas id="myChartPie"></canvas>--%>
<%--</div>--%>

<%--<script type="text/javascript">--%>
<%--    let context_3 = document--%>
<%--        .getElementById('myChartPie')--%>
<%--        .getContext('2d');--%>

<%--    let myChart = new Chart(context, {--%>
<%--        type: 'pie', // 차트의 형태--%>
<%--        data: { // 차트에 들어갈 데이터--%>
<%--            labels: [--%>
<%--                //x 축--%>
<%--                '1','2','3','4','5','6','7'--%>
<%--            ],--%>
<%--            datasets: [--%>
<%--                { //데이터--%>
<%--                    label: 'test1', //차트 제목--%>
<%--                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지--%>
<%--                    data: [--%>
<%--                        21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값--%>
<%--                    ],--%>
<%--                    backgroundColor: [--%>
<%--                        //색상--%>
<%--                        'rgba(255, 99, 132, 0.2)',--%>
<%--                        'rgba(54, 162, 235, 0.2)',--%>
<%--                        'rgba(255, 206, 86, 0.2)',--%>
<%--                        'rgba(75, 192, 192, 0.2)',--%>
<%--                        'rgba(153, 102, 255, 0.2)',--%>
<%--                        'rgba(255, 159, 64, 0.2)'--%>
<%--                    ],--%>
<%--                    borderColor: [--%>
<%--                        //경계선 색상--%>
<%--                        'rgba(255, 99, 132, 1)',--%>
<%--                        'rgba(54, 162, 235, 1)',--%>
<%--                        'rgba(255, 206, 86, 1)',--%>
<%--                        'rgba(75, 192, 192, 1)',--%>
<%--                        'rgba(153, 102, 255, 1)',--%>
<%--                        'rgba(255, 159, 64, 1)'--%>
<%--                    ],--%>
<%--                    borderWidth: 1 //경계선 굵기--%>
<%--                }/* ,--%>
<%--                {--%>
<%--                    label: 'test2',--%>
<%--                    fill: false,--%>
<%--                    data: [--%>
<%--                        8, 34, 12, 24--%>
<%--                    ],--%>
<%--                    backgroundColor: 'rgb(157, 109, 12)',--%>
<%--                    borderColor: 'rgb(157, 109, 12)'--%>
<%--                } */--%>
<%--            ]--%>
<%--        },--%>
<%--        options: {--%>
<%--            scales: {--%>
<%--                yAxes: [--%>
<%--                    {--%>
<%--                        ticks: {--%>
<%--                            beginAtZero: true--%>
<%--                        }--%>
<%--                    }--%>
<%--                ]--%>
<%--            }--%>
<%--        }--%>
<%--    });--%>

<%--</script>--%>
        <jsp:include page="../admin_footer.jsp"/>


<script >
 let msg = "${msg}";
if (msg=="login_ERR") alert("관리자 아이디로 로그인 해주세요.")
</script>

</body>
</html>