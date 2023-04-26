<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>받은 쪽지함</title>
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
        	font-size:45px;
        	font-weight:500;
        	text-align:left;
        	padding:10px 0px 10px 30px;
        	border-bottom:2px solid black;
        }
        #content_1_3{
        	font-size:40px;
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
        		<div id="content_1_2">받은 쪽지함</div>
        		<div id="content_1_3"><a href="<%=contextPath%>/sendLetterList.le?writerNo=<%=loginUser.getUserNo()%>">보낸 쪽지함</a></div>
        		<div id="content_1_4"><a href="">쪽지 보내기</a></div>
        	</div>
        	<div id="content_2" align="center">
        		<div id="content_2_1">받은 쪽지함</div>
        	</div>
    	</div> 
    </div>  
    <%@include file="../common/footer.jsp"%>
</body>
</html>