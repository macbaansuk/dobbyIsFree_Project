
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            margin:0;
            padding: 0;
        }
        #footer  a{
            text-decoration: none;
            color: #777;
        }
        #footer {
            overflow-x: hidden;
            height: 100%;
            color: #777;
            font: 16px/1.5 'SDNeoL', 'notoR', 'Malgun Gothic', '맑은 고딕', '돋움', sans-serif;
            letter-spacing: -.06em;
            -webkit-text-size-adjust: none;
        }
        #footer {
            padding: 0 0 80px;
            border-top: 1px solid #dbdbdb;
            bottom: 0;
        }

        #footer .menuWrap {border-bottom: 1px solid #dbdbdb;}
        #footer .menuWrap .menu{display: flex; justify-content: space-between; align-items: center; height: 64px; min-width: 1024px;max-width: 1280px;margin: 0 auto;}
        #footer .menuWrap nav {/*padding: 15px 0 15px 0*/margin-left: -2px;}
        #footer .menuWrap nav > a {position: relative;margin-left: 2px;color:#222; font-family: "Malgun Gothic";}
        #footer .menuWrap nav strong{font-family: 'SDNeoM', 'notoM';color: #000;}

        #footer .ftsns{opacity: 0.8;}
        #footer .ftsns [class*="btn"] {display: inline-block;vertical-align: middle;font-size: 0;}
        #footer .ftsns [class*="btn"] + [class*="btn"] {margin-left: 2px;}
        #footer .ftsns [class*="btn"] a {display: block;width: 100%; height: 100%;}
        #footer .ftsns .btnYoutube {
            width: 40px;
            height: 32px;
            background-image: url('./img/main/youtube.png');
            background-size: contain;
            background-position: center;
        }
        #footer .ftsns .btnInstagram {
            width: 36px;
            height: 42px;
            background-image: url("./img/main/insta.png");
            background-size: contain;
            background-position: center;
        }

        #footer .ftsns .btnNaver {
            width: 40px;
            height: 40px;
            background-image: url('./img/main/naver.png');
            background-size: contain;
            background-position: center;
        }


        #ftImg{
            justify-content: space-between;
            padding: 0 0 0 10px;
            width: 250px; height: auto;
            text-align: center;
            opacity: 0.45;
        }
        #footer .ftinfo{display: flex; justify-content: space-between; padding: 0 0 0 54px;margin: 0 auto; min-width: 1024px; max-width: 1280px;}
        #footer .ftinfo .info {overflow: hidden;margin: 25px 0 0;font: 14px/1.7 'SDNeoL', 'notoL';color: #777;}
        /* #footer .ftinfo .info {overflow: hidden;margin: 16px 0 0;font: 14px/1.7 'SDNeoL', 'notoL';} */
        #footer .ftinfo .info .inner {margin-left: -13px;}
        #footer .ftinfo .info span {position: relative;display: inline-block;margin-left: 13px;}
        #footer .ftinfo .info span:after {content: "";position: absolute;top: 7px; left: -8px;width: 1px; height: 10px;background: #ccc;}
        #footer .ftinfo .info .non:after {display: none;}
        #footer .ftinfo .info .lgEscrow {margin: 9px 0 0;font-size: 14px;color: #222;}
        #footer .ftinfo .info .lgEscrow em {margin: 3px 0;color: #777;line-height: 1.3;font-family: 'SDNeoL', 'notoL';}
        #footer .ftinfo .info .lgEscrow button {text-decoration: underline;}
        #footer .ftinfo .info .copyRight{margin-top:10px}
        #footer .ftinfo .info .awards {padding-left:42px;margin-top:12px;line-height:20px;background:url('./img/main/awards_footer.png') no-repeat left top;}
        .csImg {
            width: 380px;height: 212px; padding:31px 31px;
        }
        #footer .ftinfo .info_2 dl dt{color: #555;}
        #footer .ftinfo .info_2 dl dd{font-size: 14px;}
        #footer .ftinfo .info_2 dl dd strong{font:30px/1.6 'roboM'; color: #555; margin-right: 5px;}
        /*#footer .ftinfo .info_2 dl dd a.btn{display: flex; align-items: center; width: 110px; height: 32px; margin-top:11px; color: #222;border:1px solid #222;box-sizing: border-box; padding-left: 18px; background: url('../img/mains/common/arw_link_bs.png') no-repeat right 15px center }*/

    </style>
</head>
<body >
<footer id="footer">
    <div class="menuWrap">
        <div class="menu">
            <div><img id="ftImg" src='./img/main/logo_black.png'></div>
            <nav role="navigation" aria-label="Customer service">
                <a href="#" onclick="termsOpen('이용약관', 'termsService'); return false;">서비스 이용약관</a>
                <!-- <a href="#" onclick="termsOpen('개인정보처리방침', 'terms17'); return false;"><strong>개인정보처리방침</strong></a> -->
                <a href="#"><strong>개인정보처리방침</strong></a>
                <!-- <a href="#" onclick="termsOpen('영상정보처리기기 운영/관리 방침', 'terms20'); return false;">영상정보처리기기 운영/관리 방침</a> -->
                <a href="#">공지사항</a>
            </nav>

            <div class="ftsns">
                <span class="btnYoutube"><a href="https://www.youtube.com/@MasterNKS" target="_blank" rel="noopener noreferrer" title="새창">유튜브</a></span>
                <span class="btnInstagram"><a href="https://www.instagram.com/jungsukcoding/" target="_blank" title="새창"  rel="noopener noreferrer">인스타그램</a></span>
                <span class="btnNaver"><a href="https://cafe.naver.com/javachobostudy" target="_blank" title="새창"  rel="noopener noreferrer">네이버</a></span>
            </div>
        </div>
    </div>


    <div class="ftinfo">
        <div class="info">
            <p class="inner">
                <span>(주)도비스프리 서울특별시 종로 69  5층 정석코딩</span>
                <span class="non">대표이사 도비</span><br>
                <!-- <span>사업자 등록번호 106-86-68127</span> -->
                <span>제품 문의 : 02-737-8945</span>
                <span class="non">FAX 02-737-8945</span><br><span>이메일 주소 <a href="mailTo:dobbyisfree@dobbyisfree.com">dobbyisfree@dobbyisfree.com</a></span>
                <span>비즈니스제휴/입점문의 <a href="mailTo:partner.biz@dobbyisfree.com">dobbyisfree.biz@dobbyisfree.com</a></span>
                <br/>
                <span><a href="#" onclick="layerOpen('emailRefusal');return false;">이메일 주소 무단 수집 거부</a></span>
                <span>개인정보 보호책임자 </span>
                <span>호스팅 서비스 제공자 ㈜도비스프리</span><br>
            </p>
            <!-- <div class="lgEscrow">
                <strong class="tit">㈜토스페이먼츠의 에스크로 서비스 가입</strong>
                <em>저희 쇼핑몰은 고객님의 안전한 거래를 위해 무통장입금 거래에 대해 구매안전서비스를 적용하고 있습니다.</em>
                <p>
                    <button type="button" onclick="window.open('https://pgweb.uplus.co.kr/pg/wmp/mertadmin/jsp/mertservice/s_escrowYn.jsp?mertid=innisfree', 'LGU', 'width=336, height=259');">토스페이먼츠 구매안전 서비스 가입확인</button>
                </p>
            </div> -->
            <p class="copyRight">Copyright &copy; 2023  Dobbyisfree. All Rights Reserved.</p>
            <p class="awards">정석어워드 2022 <br> 브랜드부문 통합대상</p>
        </div>
        <div class="info_2">
            <img class ="csImg" src="./img/main/customer.jpg">
        </div>
    </div>
</footer>
</body>
</html>