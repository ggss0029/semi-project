<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.udong.member.model.vo.Member"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("BlackList");
	int totalPage = (int)request.getAttribute("totalPage");
	int currentPage = (int)request.getAttribute("currentPage");
	int minPage = (int)request.getAttribute("minPage");
	int maxPage = (int)request.getAttribute("maxPage");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Document</title>
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
            background-color: white;
        }
        #content_1>p{ /*마이페이지 글씨, 위치*/
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

        #my{ /*나의 정보 글씨, 위치*/
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

        #update { /*개인 정보 수정 글씨, 위치*/
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

        #write_board{ /*작성한 게시글 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 280px;
            font-family: 'BMJUA';
        }

        #line_4 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 345px;
            left: 30px;
        }

        #like_board{ /*좋아요한 게시글 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 360px;
            font-family: 'BMJUA';
        }

        #line_5 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 425px;
            left: 30px;
        }

        #out{ /*회원탈퇴 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 360px;
            font-family: 'BMJUA';
        }
        
        
        #line_6 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 505px;
            left: 30px;
        }
        
        #BlackList{ /*블랙리스트 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 440px;
            font-family: 'BMJUA';
        }
        
        #line_10 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 585px;
            left: 30px;
        }
        
        #UserOut{ /*회원관리 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 360px;
            font-family: 'BMJUA';
        }
        
        
        #line_11 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 505px;
            left: 30px;
        }
        #p{ /*contente2 안에 있는 나의 정보 글씨 , 위치*/
            position: absolute;
            top: 45px;
            left: 54px;
            font-size: 45px;
            font-weight: 500;
        }

        #line_7 {
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 0px;
            top: 120px;
            left: 45px;
        }
        #content a{
            font-size: 25px;
            color: black;
            padding-left: 20px;
            
        }
        #content_title{
            font-size: 45px;
            padding-left: 30px;
            padding-top : 50px;
            font-family: 'BMJUA';
        }
        #adminchk{
            font-size: 50px;
            padding-left: 20px;
            padding-top: 20px;;
        }
        #blacklist{
            text-align: center;
            border: 1px solid black;
        }
        #blackListbtn{
            margin: 5px;
            padding: 5px 40px;
            
        }
        
        
    </style>
</head>
<%@ include file = "../common/menubar.jsp" %>
<body>
    <div class="wrap">
        <div id="content">
            <div id="content_1">
                <p>관리</p>
                <div id="line_1"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myInfo.jsp" id="my">나의 정보</a>
                <div id="line_2"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myInfoUpdate.jsp" id="update">개인정보수정</a>
                <div id="line_3"></div>

                <a href="<%=contextPath %>/myPost.me?cPage=1" id="write_board">작성한 게시글</a>
                <div id="line_4"></div>

<%--                 <a href="<%=contextPath %>/likeList.me?currentPage=1" id="like_board">좋아요한 게시글</a> --%>
                <div id="line_5"></div>
                <%if(loginUser.getUserId().contains("admin")){%>
                <a href="<%=contextPath %>/MemberList.me?" id="UserOut">회원 관리</a>
                <div id="line_5"></div>
                <a href="<%=contextPath %>/BlackList.me?" id="BlackList">블랙리스트</a>
                <div id="line_6"></div>
                <%}else{ %>
                
                <a href="<%=contextPath %>/UserDelete.me?userNo=" id="out">회원 탈퇴</a>
                <div id="line_5"></div>
                <%} %>

            </div>
            <div id="content_2">
                <p id="content_title">블랙리스트</p>
                <hr style="border: solid 1px gray;">
                
                <table id="blacklist" border="1" align="center">
                    
                    <thead>
                        <tr>
                            <th width="300px;" height="120px;">NO.</th>
                            <th width="300px;" height="120px;">이메일</th>
                            <th width="300px;" height="120px;">관리</th>
                        </tr>
                    </thead>
                    <%for(Member member : list){ %>
            <tr>
                <td><%= member.getUserNo() %></td>
                <td><%= member.getEmail() %></td>
                <form action="BlackUpdate.me" method="post">
                	<td><button type="submit" id="blackListbtn" class="btn btn-secondary">해제</button>
					<input type="hidden" name="userNo" value="<%=member.getUserNo()%>"></td>
				</form>
            </tr>
            <%} %>
            

        </table>
        <br>
        <div align="center" class="paging-area">
	         	<%if(currentPage>10) {%> <!-- 이전 버튼  10번 페이지 이전에는 뒤로갈게 없어서 나오지않는 비노출-->
	         		<button onclick='location.href="<%= request.getContextPath()%>/BlackList.me?page=<%=currentPage-10%>";'>&lt;</button>
	         	<%} %>
	         	<%for(int i=minPage; i<=maxPage; i++) {%>
		         	<%if (currentPage == i){ %>
		         		<button style="cursor:default"><%=i %></button>
		         	<%}else{ %>
		      			<button onclick='location.href="<%= request.getContextPath()%>/BlackList.me?page=<%=i%>";'><%= i%></button>
		         	<%} %>
	         	<%} %>
	         	<%if(totalPage!=maxPage){ %>
	         	<button onclick='location.href="<%= request.getContextPath()%>/BlackList.me?page=<%=maxPage+1%>";'>&gt;</button>
	         	<%} %>
         	</div>

            </div>
        </div>
    </div>
        <%@ include file = "../common/footer.jsp" %>
</body>
</html>