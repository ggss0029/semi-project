<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.udong.board.faq.model.vo.FaqBoard"%>
<%@page import="com.udong.common.model.vo.PageInfo"%>
<%
	ArrayList<FaqBoard> flist = (ArrayList<FaqBoard>)request.getAttribute("flist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
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
    	@font-face {
		    font-family: 'BMJUA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
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
            height: 100%;
            position: relative;
        }

        #content>div{
            height: 100%;
            float: left;
        }

        #content_1{
            width: 25%;
            background-color: #C8EDC9;
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
            font-size: 50px;
/*             font-weight: 700; */
            font-family: 'BMJUA';
        }

        #line_1 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 115px;
            left: 30px;
        }

        #notice{ /*공지사항 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 130px;
            font-family: 'BMJUA';
        }

        #line_2 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 190px;
            left: 30px;
        }

        #faq { /*살림 꿀팁 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 205px;
            font-family: 'BMJUA';
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

        #content_2>#content_2_1{ /*content2 안에 크기 지정*/
            width: 1100px;
            height: 1500px;
            border: 4px solid #C8EDC9;
            border-radius : 20px;
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
            font-family: 'BMJUA';
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
            background-color:#DEF5DE;
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
                <a href="<%=contextPath%>/noticeList.bo?currentPage=1" id="notice">공지 사항</a>
                <div id="line_2"></div>
                <a href="<%=contextPath %>/faqList.bo?currentPage=1" id="faq">자주 묻는 질문</a>
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
                      	<%for(FaqBoard fb : flist) { %>
                          <li>
                            <div class="faq-box__question"><span class="goDetail1">Q. <%=fb.getFaqTitle() %></span></div>
                            <div class="faq-box__answer">
                            	
                              	<div id="boardContent">
									<p style="white-space: pre-line;"><%=fb.getFaqContent() %></p>
                                </div>
                                <%if(loginUser != null && loginUser.getUserId().equals("admin")) { %> 
                                <button onclick="location.href = '<%=contextPath%>/faqUpdate.bo?bno=<%=fb.getFaqNo()%>'" class="btn btn-info">수정하기</button>
                                <button onclick="location.href = '<%=contextPath%>/faqDelete.bo?bno=<%=fb.getFaqNo()%>'" class="btn btn-danger">삭제하기</button>
                                <%} %>
                            </div>
                          </li>
                          <%} %> 
                        </ul>
                      </div>
                    	<%if(loginUser != null && loginUser.getUserId().equals("admin")) { %> 
	                        <div align="right" id="write_btn">
	                            <a href="<%=request.getContextPath() %>/views/board/faq/faqDetailView.jsp" class="btn btn-light">글쓰기</a>
	                        </div>
                        <%} %>
                    	
                        <br><br>
						<div align="center" class="paging-area">
    
                        	<%if(pi.getCurrentPage() != 1) {%>
                            	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath %>/faqList.bo?currentPage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                            <%} %>
                            
                            <%for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                            	<%if(i != pi.getCurrentPage()) {%>
                            	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath %>/faqList.bo?currentPage=<%=i%>';"><%=i %></button>
                            	<%} else {%>
                            		<button class="btn btn-outline-dark"disabled><%=i %></button>
                            	<%} %>
                            <%} %>
                            
                            <%if(pi.getCurrentPage() != pi.getMaxPage()) { %>
	                            <button class="btn btn-outline-dark" onclick="location.href='<%=contextPath %>/faqList.bo?currentPage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                            <%} %>
                        </div>
                        
                </div>
            </div>
        </div>
    </div>
    <%@ include file = "../../common/footer.jsp" %>
    
     <script>
	     $(function(){
	     	//.list-area클래스 자손tbody 자손tr 클릭됐을때
	 	    $(".goDetail1").click(function(){
	 	        
	 	        var bno = $(this).parent().children().first().text();
	//  	        var nno = $(this).siblings().eq(0).text();
	//  	        console.log(nno);
				//if(loginUser != null && loginUser.getUserId().equals("admin")) {
					
<%-- 	 	       		location.href = '<%=contextPath%>/faqDetail.bo?bno='+bno; --%>
				
	 	    });
	     	
	     });
     
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