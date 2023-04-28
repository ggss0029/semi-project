<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.udong.member.model.vo.Member"%>
 <%
	
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("MemberList");
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
<title>회원 관리</title>
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
        #header{
            height: 13.5%;
        }
        #content{
            width: 100%;
            height: 76.5%;
            position: relative;
            
        }
        #footer{
            width: 100%;
            height: 10%;
        }
        #header>div{
            width: 100%;
        }
        #header_1{
            height: 67%;
            background-color: red;
        }
        #menubar{
            height: 33%;
        }
        #content>div{
            height: 100%;
            float: left;
        }
        
        #content_1{
            width: 25%;
        }
        #content_2{
            width: 75%;
            background-color: white;
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
        }
        #adminchk{
            font-size: 50px;
            padding-left: 20px;
            padding-top: 20px;;
        }
        #userListbtn{
            margin: 10px;
            padding: 20px 20px;
            
        }
        
       
        .userchk{ width: 160px; height: 50px; position: absolute; left: 50%; margin-left: -200px; 
        }
        .search.do {
            position: absolute; 
        }
        .search_content {
        width: 500px;
        height: 50px;
        border: 1px solid gray;
        position: absolute;
        left: 64%;
        transform: translate(-50%, 0%);
        }
        .search_btn{
            float: right;
        }
        #userlist{
            text-align: center;
            border: 1px solid black;
        }
       
        </style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
    <div class="wrap">
        <div id="content">
            <div id="content_1">
                <p id="adminchk"><b>관리</b></p>
                <hr style="border: solid 1px gray;">
                <a href="" id="userchk">회원 관리</a>
                <hr style="border: solid 1px gray;">
                <a href="/udong/BlackList.me" id="blacklist1">블랙 리스트</a>
                <hr style="border: solid 1px gray;">

            </div>
            <div id="content_2">
                
                <p id="content_title">회원관리</p>
                <hr style="border: solid 1px gray;">
                <table id="userlist" border="1" text-align="center">
                    <select id="search_type" name="search_type" class="userchk" >
                        <option id="userId" value="userId">아이디</option>
                        <option id="email" value="email">이메일</option>
                        <label>
                            <input type="search" id="search_content" class="search_content">
                            <button type="button"  id="search_btn" class="btn btn-secondary" 
                            class="btn btn-secondary" 
                            class="btn btn-secondary" 
                            style="right: 11%;
                            width: 83px;
                            height: 50px;
                            top: 13%;
                            position: absolute;
                            transform: translate(-50%, 0%);">검색</button> 
                        </label>
	                </select>
                   </table>
                <table id="userlist" border="1" align="center">
                    <br><br><br>
                    <thead>
                        <tr>
                            <th width="145px;" height="80px;">아이디</th>
                            <th width="145px;" height="80px;">이름</th>
                            <th width="145px;" height="80px;">생년월일</th>
                            <th width="145px;" height="80px;">이메일</th>
                            <th width="145px;" height="80px;">주소</th>
                            <th width="145px;" height="80px;">가입일</th>
                            <th width="145px;" height="80px;">강제추방</th>
                        </tr>
                    </thead>
           <%for(Member member : list){ %>
             <tr>
                <td><%= member.getUserId()%></td>
                <td><%= member.getUserName()%></td>
                <td><%= member.getBirthday() %></td>
                <td><%= member.getEmail() %></td>
                <td><%= member.getAddress() %></td>
                <td><%= member.getEnrollDate() %></td>
                <form action="MemberListDelete.me" method="post">
                	<td><button type="submit" id="userListbtn" class="btn btn-secondary">강제추방</button>
					<input type="hidden" id="userNo" name="userNo" value="<%=member.getUserNo()%>"></td>
				</form>
           <%} %>
       	 </table>
       	 <div align="center" class="paging-area">
	         	<%if(currentPage>10) {%> <!-- 이전 버튼  10번 페이지 이전에는 뒤로갈게 없어서 나오지않는 비노출-->
	         		<button>&lt;</button>
	         	<%} %>
	         	<%for(int i=minPage; i<=maxPage; i++) {%>
		         	<%if (currentPage == i){ %>
		         		<button style="cursor:default"><%=i %></button>
		         	<%}else{ %>
		      			<button onclick='location.href="<%= request.getContextPath()%>/MemberList.me?page=<%=i%>"'><%=i %></button>
		         	<%} %>
	         	<%} %>
	         	<%if(totalPage!=maxPage){ %>
	         	<button>&gt;</button>
	         	<%} %>
         	</div>
            </div>
        </div>
    </div>
    <%@ include file = "../common/footer.jsp" %>
</body>

<script>
	$(function(){
		var contextPath = "<%= request.getContextPath()%>";
		$("#search_btn").click(function(){
			var searchType = $("#search_type").val();
			var content = $("#search_content").val();
			if(searchType == "userId"){
				location.href = contextPath +  "/MemberList.me?userId=" + content;
			}else if(searchType == "email"){
				location.href = contextPath + "/MemberList.me?email=" + content;				
			}
		});
	
			 
	});
	
	
	

</script>
</html>