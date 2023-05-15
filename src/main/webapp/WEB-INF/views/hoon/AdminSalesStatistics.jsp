
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
            <div class="content">
                <div class="dashboardArea">
                    <div class="mDashboard">



                        <!-- 쇼핑몰 현황 시작 -->
                        <div class="mDashboard gTabMerge eTabs ui-tabs ui-widget ui-widget-content ui-corner-all">
                            <div class="title">
                                <h2>매출통계 분석 </h2>
                            </div>

                            <%-- Ajax로 변경할 부분 시작 --%>
                            <div class="mTab typeNav mallStauts">
                                <ul class="tab-menu ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                                    <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#tabMallStatus1" id="tabMallStatus1Button" >주간 매출 현황</a></li>
                                    <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus2" >요일별 평균 매출 현황</a></li>
                                    <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus3" >이번달 매출 현황</a></li>
                                    <li class="ui-state-default ui-corner-top"><a href="#tabMallStatus4" >연간 월별 매출 현황</a></li>
                                </ul>
                            </div>


                            <!-- 주간 매출 현황-->
                            <div id="tabMallStatus1" class="tabMallStatus ui-tabs-panel ui-widget-content ui-corner-bottom">
                                <div class="mallArea">
                                    <div class="gFlow graph">
                                        <span class="gSingleSide gDouble txtLess" id="eMainSalesDailyChartUnit">단위/만원</span>


                                        <%--라인 챠트--%>
                                        <div style="width: 460px; height: 260px; overflow-y: hidden;overflow-clip-margin: content-box; ">
                                            <!--차트가 그려질 부분-->
                                            <canvas class="myChartLine"></canvas>
                                        </div>

                                        <div class="gSingleSide">
                                            <ul class="mList">
                                                <li>최종 업데이트일시 : <span id="eMainSalesDailyChartRefleshTime">2023-05-15 14:00</span> (1시간마다 업데이트)</li>
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
                                                    <th scope="row" id="dailyCountTitle1">05월 12일</th>
                                                    <td id="dailyCountOrderPrice1">0 원<br>(0건)</td>
                                                    <td id="dailyCountPayedPrice1">0 원<br>(0건)</td>
                                                    <td id="dailyCountRefundPrice1">0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="">
                                                    <th scope="row" id="dailyCountTitle2">05월 13일</th>
                                                    <td id="dailyCountOrderPrice2">0 원<br>(0건)</td>
                                                    <td id="dailyCountPayedPrice2">0 원<br>(0건)</td>
                                                    <td id="dailyCountRefundPrice2">0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="">
                                                    <th scope="row" id="dailyCountTitle3">05월 14일</th>
                                                    <td id="dailyCountOrderPrice3">0 원<br>(0건)</td>
                                                    <td id="dailyCountPayedPrice3">0 원<br>(0건)</td>
                                                    <td id="dailyCountRefundPrice3">0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="em">
                                                    <th scope="row" id="dailyCountTitleToday">05월 15일 (오늘)</th>
                                                    <td id="dailyCountOrderPriceToday">54,000 원<br>(1건)</td>
                                                    <td id="dailyCountPayedPriceToday">54,000 원<br>(1건)</td>
                                                    <td id="dailyCountRefundPriceToday">0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="total">
                                                    <th scope="row" id="weeklyCountOrderAvgTitle">최근 7일 평균</th>
                                                    <td id="weeklyCountOrderPriceAvg">54,000 원<br>(1건)</td>
                                                    <td id="weeklyCountPayedPriceAvg">54,000 원<br>(1건)</td>
                                                    <td id="weeklyCountRefundPriceAvg">0 원<br>(0건)</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" id="weeklyCountOrderTotalTitle">최근 7일 합계</th>
                                                    <td id="weeklyCountOrderPriceTotal">54,000 원<br>(1건)</td>
                                                    <td id="weeklyCountPayedPriceTotal">54,000 원<br>(건)</td>
                                                    <td id="weeklyCountRefundPriceTotal">0 원<br>(0건)</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" id="monthlyCountOrderAvgTitle">최근 30일 평균</th>
                                                    <td id="monthlyCountOrderPriceAvg">54,000 원<br>(1건)</td>
                                                    <td id="monthlyCountPayedPriceAvg">54,000 원<br>(1건)</td>
                                                    <td id="monthlyCountRefundPriceAvg">0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="total">
                                                    <th scope="row" id="monthlyCountOrderTotalTitle">최근 30일 합계</th>
                                                    <td id="monthlyCountOrderPriceTotal">54,000 원<br>(1건)</td>
                                                    <td id="monthlyCountPayedPriceTotal">54,000 원<br>(1건)</td>
                                                    <td id="monthlyCountRefundPriceTotal">0 원<br>(0건)</td>
                                                </tr>
                                                </tbody>
                                            </table>


                                        </div>  <!-- -->
                                    </div> <!-- mDashboard 끝-->
                                </div> <!-- dashboardArea 끝-->
                                <!-- //주간 매출 현황 -->
                            </div>

                            <!-- 요일별 평균 매출 현황 -->
                            <div id="tabMallStatus2" class="tabMallStatus ui-tabs-panel ui-widget-content ui-corner-bottom">
                                <div class="mallArea">
                                    <div class="gFlow graph">
                                        <span class="gSingleSide gDouble txtLess" id="eMainMemberChartUnit">단위/만원</span>
                                        <%-- 라인 챠트--%>
                                        <div style="width: 460px; height: 278px; overflow-y: hidden;overflow-clip-margin: content-box; ">
                                            <!--차트가 그려질 부분-->
                                            <canvas class="myChartBar"></canvas>
                                        </div>
                                    </div>
                                    <div class="gReverse">
                                        <div class="mBoard">
                                            <table border="1" summary="" id="viewMemberCountMileage">
                                                <caption>요일별 평균 매출 현황</caption>
                                                <colgroup>
                                                    <col style="width:22%;">
                                                    <col style="width:39%;">
                                                    <col style="width:39%;">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="col">날짜</th>
                                                    <th scope="col">주문</th>
                                                    <th scope="col">결제</th>
                                                </tr>
                                                </thead>
                                                <tbody class="right">

                                                <tr class=""><td>05월 14일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>05월 15일 (오늘)</td>
                                                    <td>54,000 원<br>(1건)</td>
                                                    <td>54,000 원<br>(1건)</td>
                                                </tr>
                                                <tr class=""><td>05월 16일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>05월 17일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>05월 18일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>05월 19일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="em"><td>05월 20일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="total">
                                                    <td><strong>합계</strong></td>
                                                    <td><strong>54,000</strong> 원 <br><strong>(1)</strong> 건</td>
                                                    <td><strong>54,000</strong> 원 <br><strong>(1)</strong> 건</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 요일별 평균 매출 현황-->

                            <!-- 이번달 매출 현황 -->
                            <div id="tabMallStatus3" class="tabMallStatus ui-tabs-panel ui-widget-content ui-corner-bottom">
                                <div class="mallArea">
                                    <div class="gFlow graph">
                                        <span class="gSingleSide gDouble txtLess" id="eMainMemberChartUnit">단위/만원</span>
                                        <%-- 라인 챠트--%>
                                        <div style="width: 460px; height: 278px; overflow-y: hidden;overflow-clip-margin: content-box; ">
                                            <!--차트가 그려질 부분-->
                                            <canvas class="myChartBar2"></canvas>
                                        </div>
                                    </div>
                                    <div class="gReverse">
                                        <div class="mBoard">
                                            <table border="1" summary="" id="viewMemberCountMileage3">
                                                <caption>이번달 매출 현황</caption>
                                                <colgroup>
                                                    <col style="width:22%;">
                                                    <col style="width:39%;">
                                                    <col style="width:39%;">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="col">날짜</th>
                                                    <th scope="col">주문</th>
                                                    <th scope="col">결제</th>
                                                </tr>
                                                </thead>
                                                <tbody class="right">

                                                <tr class=""><td>05월 14일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>05월 15일 (오늘)</td>
                                                    <td>54,000 원<br>(1건)</td>
                                                    <td>54,000 원<br>(1건)</td>
                                                </tr>
                                                <tr class=""><td>05월 16일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>05월 17일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>05월 18일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>05월 19일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="em"><td>05월 20일</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="total">
                                                    <td><strong>합계</strong></td>
                                                    <td><strong>54,000</strong> 원 <br><strong>(1)</strong> 건</td>
                                                    <td><strong>54,000</strong> 원 <br><strong>(1)</strong> 건</td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 이번달 매출 현황-->

                            <!-- 1년 월별 매출 현황 -->
                            <div id="tabMallStatus4" class="tabMallStatus ui-tabs-panel ui-widget-content ui-corner-bottom">
                                <div class="mallArea">
                                    <div class="gFlow graph">
                                        <span class="gSingleSide gDouble txtLess" id="eMainMemberChartUnit">단위/만원</span>
                                        <%-- 라인 챠트--%>
                                        <div style="width: 460px; height: 278px; overflow-y: hidden;overflow-clip-margin: content-box; ">
                                            <!--차트가 그려질 부분-->
                                            <canvas class="myChartBar3"></canvas>
                                        </div>
                                    </div>
                                    <div class="gReverse">
                                        <div class="mBoard">
                                            <table border="1" summary="" id="viewMemberCountMileage4">
                                                <caption>연간 월별 매출 현황</caption>
                                                <colgroup>
                                                    <col style="width:22%;">
                                                    <col style="width:39%;">
                                                    <col style="width:39%;">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="col">날짜</th>
                                                    <th scope="col">주문</th>
                                                    <th scope="col">결제</th>
                                                </tr>
                                                </thead>
                                                <tbody class="right">

                                                <tr class=""><td>1월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>2월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>3월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>4월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>5월<br>(이번달)</td>
                                                    <td>54,000원<br>(1건)</td>
                                                    <td>54,000원<br>(1건)</td>
                                                </tr>
                                                <tr class=""><td>6월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>7월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>8월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>9월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>10월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class=""><td>11월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>

                                                <tr class="em"><td>12월</td>
                                                    <td>0 원<br>(0건)</td>
                                                    <td>0 원<br>(0건)</td>
                                                </tr>
                                                <tr class="total">
                                                    <td><strong>합계</strong></td>
                                                    <td><strong>54,000</strong> 원 <br><strong>(1)</strong> 건</td>
                                                    <td><strong>54,000</strong> 원 <br><strong>(1)</strong> 건</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 1년 월별 매출 현황-->

                        </div>
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
                .querySelector('.myChartBar')
                .getContext('2d');

            let context3 = document
                .querySelector('.myChartBar2')
                .getContext('2d');

            let context4 = document
                .querySelector('.myChartBar3')
                .getContext('2d');


            let myChartLine = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '14','15', '16','17','18','19','20'
                    ],
                    datasets: [
                        { //데이터
                            label: '주간 매출', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                0,5.4,0,0,0,0,0 //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor:
                                //색상
                                'rgba(255, 99, 132, 0.2)',


                            borderColor:
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',

                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true,

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
                        '일','월','화','수','목','금','토'
                    ],
                    datasets: [
                        { //데이터
                            label: '요일별 평균 매출 현황', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                0,5.4,0,0,0,0,0 //x축 label에 대응되는 데이터 값
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


            let myChartLine3 = new Chart(context3, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '1일', '2일', '3일', '4일', '5일', '6일', '7일',
                        '8일', '9일', '10일', '11일', '12일', '13일', '14일',
                        '15일', '16일', '17일', '18일', '19일', '20일', '21일',
                        '22일', '23일', '24일', '25일', '26일', '27일', '28일',
                        '29일', '30일', '31일'
                    ],
                    datasets: [
                        { //데이터
                            label: '이번달 매출 현황', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                0,0,0,0,0,0,0, //x축 label에 대응되는 데이터 값
                                0,0,0,0,0,0,0,
                                5.4,0,0,0,0,0,0,
                                0,0,0,0,0,0,0,
                                0,0,0,
                            ],
                            backgroundColor:
                            //색상
                                'rgba(255, 99, 132, 0.2)',


                            borderColor:
                            //경계선 색상
                                'rgba(255, 99, 132, 1)',

                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                    scales: {
                        xAxes: [{
                            ticks: {
                                callback: function(value) {
                                    return '';
                                }
                            }
                        }],
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true,

                                }
                            }
                        ]
                    }
                }
            });

            let myChartBar3 = new Chart(context4, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                        '8월', '9월', '10월', '11월', '12월',
                    ],
                    datasets: [
                        { //데이터
                            label: '연간 월별 매출 현황', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                0,0,0,0,5.4,0,0,0,0,0,0,
                                0,0,0,0,0,0,0,//x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
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
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
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

        </script>

        <jsp:include page="../admin_footer.jsp"/>


        <script >
            let msg = "${msg}";
            if (msg=="login_ERR") alert("관리자 아이디로 로그인 해주세요.")
        </script>

</body>
</html>