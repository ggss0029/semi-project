<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.wrap {
		position:relative;
		z-index:1;
        height: 1000px;
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
        background-color: yellow;
    }

    #content_2{
    	width: 75%;
/*     	background-color: green; */
    	position: relative;
	}
	
	#content_1>p {
		position: absolute;
		top: 40px;
		left: 52px;
		font-size: 45px;
		font-weight: 700;
	}
	
	#line_1, #line_2, #line_3, #line_4, #line_5, #line_6 {
		position: absolute;
		border: 1px solid black;
		width: 300px;
		height: 0px;
		top: 115px;
		left: 30px;
	}
	
	#buy, #together {
		position: absolute;
		font-size: 35px;
		text-decoration: none;
		color: black;
		left: 52px;
		top: 130px;
	}
	
	#line_2 { top: 190px; }
	#line_3 { top: 265px; }
	#line_4 { top: 345px; }
	#line_5 { top: 425px; }
	#line_6 { top: 505px; }
	
	#together { top: 205px; }
	
	#content_2_1 {
		width: 1100px;
		height: 970px;
		border: 1px solid skyblue;
		position: absolute;
		top: 15px;
		left: 12px;
	}
	
	#pp {
		position: absolute;
		top: 45px;
		left: 54px;
		font-size: 45px;
		font-weight: 500;
	}
	
	#list-area {
		width: 90%;
		margin: 0 auto;
		margin-top: 150px;
		font-size: 17px;
		text-align: center;
	}
	
	#list-area>tbody>tr:hover {
		background-color: #F5F5F5;
        cursor: pointer;
	}
	
	#button-area {
		width: 90%;
		margin: 0 auto;
	}
</style>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	<div class="wrap">
		<div id="content">
			<div id="content_1">
				<p>함께 해요</p>
                <div id="line_1"></div>
                <a href="<%=contextPath%>/buyList.bo?currentPage=1" id="buy">같이 사요</a>
                <div id="line_2"></div>
                <a href="<%=contextPath%>/togetherList.bo?cPage=1" id="together">같이 해요</a>
                <div id="line_3"></div>
			</div>
			<div id="content_2">
				<div id="content_2_1">
					<p>같이 해요</p>
					<div id="line_4"></div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>