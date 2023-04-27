<%@page import="com.udong.common.model.vo.PageInfo"%>
<%@page import="com.udong.letter.model.vo.Letter,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Letter> list = (ArrayList<Letter>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보낸 쪽지함</title>
    <style>
    	div{
/*     		border: 1px solid black; */
    	}
        .wrap{ 
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
        }
        #content>div{
        	height: 100%;
        	float:left;
        }
        #content_1{
        	width:25%;
        	background-color:yellow;
        }
        #content_1>div{
        	width:90%;
        }
        #content_1_1{
        	font-size:50px;
        	font-weight:700;
        	text-align:left;
        	padding:50px 0px 15px 30px;
        	border-bottom:2px solid black;
        }
        #content_1_2{
        	font-size:40px;
        	font-weight:500;
        	text-align:left;
        	padding:10px 0px 10px 30px;
        	border-bottom:2px solid black;
        }
        #content_1_3{
        	font-size:45px;
        	font-weight:500;
        	text-align:left;
        	padding:10px 0px 10px 30px;
        	border-bottom:2px solid black;
        }
        #content_1_4{
        	font-size:40px;
        	font-weight:500;
        	text-align:left;
        	padding:10px 0px 10px 30px;
        	border-bottom:2px solid black;
        }
        #content_1>div>a{
        	text-decoration:none;
        	color:black;
        }
        #content_2{
        	width:74%;
        }
        #content_2>div{
        	width:90%;
        }
        #content_2_1{
        	height:10%;
        	font-size:50px;
        	font-weight:400;
        	text-align:left;
        	padding:60px 0px 5px 20px;
        	border-bottom:2px solid black;
        }
    </style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
    <div class="wrap">
        <div id="content">
        	<div id="content_1" style="margin-left:10px;" align="center">
        		<div id="content_1_1">쪽지</div>
        		<div id="content_1_2"><a href="<%=contextPath%>/receiveLetterList.le?writerNo=<%=loginUser.getUserNo()%>&currentPage=1">받은 쪽지함</a></div>
        		<div id="content_1_3">보낸 쪽지함</div>
        		<div id="content_1_4"><a href="<%=contextPath%>/writeLetter.le">쪽지 보내기</a></div>
        	</div>
        	<div id="content_2" align="center">
        		<div id="content_2_1">보낸 쪽지함</div>
        		<br><br>
        		<div id="content_2_2">
        			<table id="sendLetterListTable" border="1" style="text-align:center;">
        				<thead>
        					<tr>
        						<th style="width:150px;">수신자</th>
        						<th style="width:450px;">내용</th>
        						<th style="width:150px;">발신일</th>
        					</tr>
        				</thead>
        				<tbody>
        					<%if(!list.isEmpty()){ %>
        						<%for(Letter le : list){ %>
        						<tr>
	        						<td style="width:150px;"><%=le.getLetterReceiver()%></td>
	        						<td style="width:450px;"><%=le.getLetterContent()%></td>
	        						<td style="width:150px;"><%=le.getWriteDate()%></td>
        						</tr>
        						<%} %>
        					<%}else{ %>
        						<tr>
        						<th colspan="3">보낸 쪽지가 없습니다.</th>
        						</tr>
        					<%} %>
        				</tbody>
        			</table>
        		</div>
        		<br>
        <div align="center" class="paging-area">
			<%if(pi.getCurrentPage()!= 1){ %>
				<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
			<%} %>
			
			<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++ ){ %>
				<!-- 내가 보고있는 페이지 버튼은 비활성화 하기  -->
				<%if(i != pi.getCurrentPage()){ %>
					<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=i%>';"><%=i %></button>
				<%}else{ %> <!-- 내가 보고있는 페이지와 페이징바 버튼의 수가 같다면 i와 currentPage -->
					<button disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<%if(pi.getCurrentPage() != pi.getMaxPage()){ %>
				<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
			<%} %>
		</div>
        	</div>
    	</div> 
    </div>  
    <%@include file="../common/footer.jsp"%>
</body>
</html>