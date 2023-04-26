<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#footer{
            height: 200px;
            background-color: rgb(240, 240, 240);
        }
        
        #footer>div{
            width: 100%;
        }

        #footer_1{
            height: 20%;
        }
        
        #footer_1>a {
        	text-decoration: none;
            color: black;
            font-weight: 600;
            margin: 15px;
            vertical-align: middle; 
        }

        #footer_2{
            height: 80%;
        }
        
        #footer_2>p {
            text-align: center;
        }
</style>
</head>

<body>
	<div id="footer">
    	<div style="height:20px;"></div>
    	<div id="footer_1">
    		<a href="https://github.com/hansuung/SEMI-PROJECT">조원 깃허브페이지</a> |
            <a href="<%=contextPath%>/policy.do">개인정보취급방침</a> | 
            <a>서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F</a>
    	</div>
    	<div id="footer_2">
	    	<p><b>조장</b> 한성</p>
	    	<p><b>조원</b> 권수지, 안채영, 정희재</p>
	    	<p><b>문의</b> dlstmxk12@naver.com</p>
	    	<p>Copyright © 2023 SEMI-PROJECT KH DANGSAN WEB DEVELOPMENT CLASS6 GROUP3 All Right Reserved</p>
    	</div>
    </div>
</body>
</html>