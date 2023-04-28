<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <style>
         div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }

        .wrap{
        	position:relative;
			z-index:1;
            height: 1530px;
            width: 1500px;
            margin: auto;
        }

        .wrap>div{
            width: 100%;
        }

        #content{
            width: 100%;
            height: 76.5%;
            position: relative;
        }

        #content>div{
            height: 100%;
            float: left;
        }

        #content_1{
            width: 25%;
            background-color: yellow;
        }

        #content_2{
            width: 75%;
            /* background-color: green; */
            position: relative;
        }

        #content_1>p{ /*정보공유 글씨, 위치*/
            position: absolute;
            top: 40px;
            left: 52px;
            font-size: 45px;
            font-weight: 700;
        }

        #line_1 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 115px;
            left: 30px;
        }

        #news{ /*동네 소식 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 130px;
        }

        #line_2 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 190px;
            left: 30px;
        }

        #clean { /*살림 꿀팁 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 205px;
        }

        #line_3 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 265px;
            left: 30px;
        }

        #recipe{ /*자취 레시피 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 280px;
        }

        #line_4 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 345px;
            left: 30px;
        }

        #content_2>div{ /*content2 안에 크기 지정*/
            width: 1100px;
            height: 1500px;
            border: 1px solid skyblue;
            position: absolute;
            top: 15px;
            left: 12px;
            
        }

        #content_2_1>p{ /*contente2 안에 있는 동네소식 글씨 , 위치*/
            position: absolute;
            top: 45px;
            left: 54px;
            font-size: 45px;
            font-weight: 500;
        }

        #line_5 {
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 0px;
            top: 120px;
            left: 45px;
        }

        .faq-box {
            /* border:2px solid black; */
            /* background-color:skyblue; */
            color:inherit;
            padding:10px;
            margin: 130px 0 0 30px;
            width: 1040px;
        }

        .faq-box__question {
            cursor:pointer;
            font-size: 23px;
            font-weight: bold;
            margin-top: 10px;
        }

        .faq-box__question::after {
            content:"▼";
            float:right;
        }

        .faq-box > ul > li {
            padding:10px;
        }

        .faq-box > ul > li.hover > .faq-box__question::after {
            content:"▲";
        }

        .faq-box__answer {
            display:none;
            background-color:#C8EDC9;
            border-radius:10px;
            margin: 10px 0 0 0;
            padding:15px;
            font-size: 20px;
        }

    </style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
    <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="menubar"></div>
        </div>
        <div id="content">
            <div id="content_1">
                <p>소식</p>
                <div id="line_1"></div>
                <a href="<%=contextPath %>/newsList.bo?currentPage=1" id="news">공지 사항</a>
                <div id="line_2"></div>
                <a href="" id="clean">자주 묻는 질문</a>
                <div id="line_3"></div>
            </div>
            <div id="content_2">
                <div id="content_2_1">
                    <p>자주 묻는 질문</p>
                    <div id="line_5"></div>

					<div class="faq-box">
                        <!--
                        ul>li*10>div.faq-box__question>span{질문 $}^div.faq-box__answer>lorem*10
                      -->
                        <ul>
                          <li>
                            <div class="faq-box__question"><span>Q. 방금 등록한 게시글이 검색되지 않아요</span></div>
                            <div class="faq-box__answer">
                              <div>
                                게시글 등록 후 검색되기까지 최대 3분의 시간이 필요합니다.
                                </div>
                              <div>
                                조금만 기다렸다가 다시 검색해주시길 바랍니다 ^_^
                              </div>
                            </div>
                          </li>
                          <li>
                            <div class="faq-box__question"><span>Q. 게시글 신고는 어떻게 하나요?</span></div>
                            <div class="faq-box__answer">
                              <div>
                                부적절한 게시글을 상세보기 하시면 상단에 신고하기 버튼이 있습니다.
                              </div>
                              <div>
                                악의적인 신고를 방지하기 위해 관리자의 검열을 통해서 게시글 삭제 및 회원 이용 정지를 조치할 예정입니다.
                              </div>
                            </div>
                          </li>
                          <li>
                            <div class="faq-box__question"><span>Q. 회원 이용 정지 기준이 어떻게 되나요?</span></div>
                            <div class="faq-box__answer">
                              <div>
                                부절한 게시글(음란물, 광고성 게시글 등)을 작성하시거나 
                              </div>
                              <div>
                                욕설, 비하, 성희롱 등 언쟁이 될 만한 요소를 작성하시게 되면 비매너 사유로 경고 5번 부여 후 초과 시 이용 정지가 됩니다.
                            </div>
                          </li>
                          <li>
                            <div class="faq-box__question"><span>Q. </span></div>
                            <div class="faq-box__answer">
                             <div>
                               - 수령일 기준 7일 이내에 교환/반품에 대한 청약철회 의사를 밝혀주시면 처리가 가능합니다.
                             </div>
                              <div>
                                - 교환/반품 절차 : 마이페이지 → 주문내역 → 교환/반품 신청 → 수거기사님 방문예정
                              </div>
                              <div>
                                - 구매하신 쇼핑몰에서 신청해주시거나, 고객센터(1544-9180)으로 신청 부탁드립니다.
                              </div>
                              <div>
                                - 구매하신 제품의 AS를 원하는 경우에도 고객센터(1544-9180)으로 연락 부탁드립니다.
                              </div>
                            </div>
                          </li>
                          <li>
                            <div class="faq-box__question"><span>Q. </span></div>
                            <div class="faq-box__answer">
                              <div>
                                - 단순 변심으로 인한 교환/환불 시 왕복 배송비 발생 됩니다.
                              </div>
                              <div>
                                - 제품 불량으로 인한 교환/환불 시 배송비는 발생되지 않습니다.
                              </div>
                              <div>
                                - 교환으로 인한 차액 발생시 구매하신 쇼핑몰 또는 카카오 상담톡으로 문의주시면 도와드리겠습니다.
                              </div>
                            </div>
                          </li>
                          <li>
                            <div class="faq-box__question"><span>Q. </span></div>
                            <div class="faq-box__answer">
                             <div>
                               - 무통장입금 건은 입금 후 영업시간이내 1~2시간 이후에 확인이 가능하며,
                             </div>
                              <div>
                                주문 후 7일 이내로 입금 확인이 안될 경우 주문이 자동으로 취소 처리됩니다.
                              </div>
                              <br>
                              <div style="font-weight:bold;">
                                ▼자동 입금이 되지 않는 4가지 경우▼
                              </div>
                              <div>
                                 1. 입금자명이 다를 경우 - 주문 시 기재한 입금자명과 실제 입금자명이 다를 경우 연락 부탁드립니다.
                              </div>
                              <div>
                                2. 결제 금액과 입금 금액이 불일치할 경우 - 결제 금액과 입금 금액이 일치하지 않을 경우 연락 부탁드리며, 초과 입금해주신 금액은 환불 처리 가능합니다.
                              </div>
                              <div>
                                 3. 같은 주문서가 중복으로 존재할 경우 동일한 결제 정보의 주문서가 두 개 이상일 경우 자동 입금 연결이 되지 않습니다.
                              </div>
                              <div>
                                4. 구매의사가 없는 주문서의 경우 마이페이지 주문내역에서 취소하시고, 입금해주신 금액은 환불 처리 가능합니다.
                              </div>
                            </div>
                          </li>
                          <li>
                            <div class="faq-box__question"><span>Q. </span></div>
                            <div class="faq-box__answer">
                            <div>
                              - 회원가입 없이 [비회원 구매] 버튼을 선택하여 주문이 가능합니다.
                            </div>
                              <div>
                                - 비회원으로 주문시 주문 내용을 확인을 위해 '주문번호'와 '비밀번호'를 꼭 메모 부탁드립니다.
                              </div>
                              <div>
                                - 주문번호를 잊으신 경우에는 고객센터(1544-9180)으로 연락 부탁드립니다.
                              </div>
                            </div>
                          </li>
                          <li>
                            <div class="faq-box__question"><span>Q. </span></div>
                            <div class="faq-box__answer">
                             <div>
                               - 비회원 주문의 경우 직접 취소 및 주문서 변경 처리가 어렵습니다.
                             </div>
                              <div>
                                - 비회원 or 네이버 로그인으로 주문 후 취소/변경 및 교환/반품을 원하실 경우,
                              </div>
                              <div>
                                고객센터(1544-9180)로 주문자이름 , 휴대폰번호, 요청 내용과 함께 문의주시면 도와드리겠습니다.
                              </div>
                              <div>
                                - 단, 이미 제품이 발송된 경우에는 주문 취소가 불가합니다.
                              </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                    
                        <br><br>

                        
                </div>
            </div>
        </div>
    </div>
    <%@ include file = "../../common/footer.jsp" %>
    
     <script>
        function FaqBox_init() {
      $('.faq-box > ul > li').click(function() {
        var $this = $(this);
        
        $this.siblings('.hover').find(' > .faq-box__answer').stop().slideUp(300); 
        $this.siblings('.hover').removeClass('hover');
        
        if ( $this.hasClass('hover') ) {
          $this.find(' > .faq-box__answer').stop().slideUp(300); 
          $this.removeClass('hover');
        }
        else {
          $this.find(' > .faq-box__answer').stop().slideDown(300); 
          $this.addClass('hover');
        }
      });
      
      $('.faq-box__answer').click(function() {
        return false;
      });
    }
    
    FaqBox_init();
    </script>
    
</body>
</html>