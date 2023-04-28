<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 게시판</title>
</head>
<body>
    <table  style="padding-top:50px" align = center width=700 border=0 cellpadding=2 >
            <tr>
            <td height=30px align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
            </tr>
            <tr>
            <td bgcolor=white>
            <table class ="table2">
                    <tr>
                    <td>작성자</td>
                    <td><input type = text name = name size=70> </td>
                    </tr>

                    <tr>
                    <td>제목</td>
                    <td><input type = text name = title size=80></td>
                    </tr>

                    <tr>
                    <td>내용</td>
                    <td><textarea name = content cols=100 rows=30></textarea></td>
                    </tr>

                   
                    </table>

                    <center>
                    <input type = "submit" value="작성">
                    </center>
            </td>
            </tr>
    </table>
    </form>
</html>