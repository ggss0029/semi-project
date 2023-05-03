<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 Udong</title>
<style>
	.wrap {
		margin: 0 auto;
		margin-top: 300px;
		width: 700px;
		height: 300px;
	}
	
	.wrap>div {
		width: 700px;
		margin: 0 auto;
	}
	
	p {
		margin-top: 0;
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<div class="wrap" align="center">
			<p id="p1" style="font-size: 40px; font-weight: 600;">잘못된 접근입니다.</p>
			<p id="p2" style="font-size: 20px; margin-bottom: 40px;">
				해당 페이지에 접근할 수 없습니다. <br>
				다시 확인하시고 이용해 주시기 바랍니다. <br>
				이용에 불편을 드려 대단히 죄송합니다.
			</p>
			<div class="btn" align="center">
				<button onclick="main();" style="background-color: #C8EDC9; border: none; width:200px; height:50px; font-size: 20px; border-radius: 20px;">메인 페이지로 이동</button>
			</div>
	</div>
	
	<script>
		function main() {
			location.href = "<%=request.getContextPath()%>";
		}
	</script>
</body>
</html>