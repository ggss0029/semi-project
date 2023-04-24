<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String totalSearch = (String)request.getSession().getAttribute("totalSearch");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=totalSearch %></h2>
	<p>검색하신게 맞나요////////</p>
</body>
</html>