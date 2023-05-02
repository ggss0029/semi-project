
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="com.udong.common.model.vo.PageInfo"%>
<%
	ArrayList<BoardCommon> list = (ArrayList<BoardCommon>)request.getAttribute("list");
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
            font-size: 45px;
            font-weight: 700;
        }

        #line_1 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 115px;
            left: 30px;
        }

        #my{ /*동네 소식 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 130px;
        }

        #line_2 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 190px;
            left: 30px;
        }

        #update { /*살림 꿀팁 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 205px;
        }

        #line_3 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 265px;
            left: 30px;
        }

        #write_board{ /*자취 레시피 글씨, 위치*/
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

        #like_board{ /*자취 레시피 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 360px;
        }

        #line_5 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 425px;
            left: 30px;
        }

        #out{ /*자취 레시피 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 440px;
        }

        #line_6 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 505px;
            left: 30px;
        }

        #content_2>div{ /*content2 안에 크기 지정*/
            width: 1100px;
            height: 1500px;
            border: 1px solid skyblue;
            position: absolute;
            top: 15px;
            left: 12px;
            
        }

        #pp{ /*contente2 안에 있는 동네소식 글씨 , 위치*/
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

        #p1{
            position: absolute;
            top: 150px;
            left: 70px;
            font-size:35px;
            font-weight: 600; 
        }

        /* 게시글 테이블 */
        .list-area{
            border: 1px solid black;
            text-align: center;
            margin: 170px 0 0 80px;
            font-size: 17px;
        }
    </style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
    <div class="wrap">
        <div id="content">
            <div id="content_1">
                <p>마이페이지</p>
                <div id="line_1"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myInfo.jsp" id="my">나의 정보</a>
                <div id="line_2"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myInfoUpdate.jsp" id="update">개인정보수정</a>
                <div id="line_3"></div>

                <a href="<%=contextPath %>/myPost.me?cPage=1" id="write_board">작성한 게시글</a>
                <div id="line_4"></div>

                <a href="<%=contextPath %>/likeList.me?currentPage=1" id="like_board">좋아요한 게시글</a>
                <div id="line_5"></div>

                <a href="" id="out">회원 탈퇴</a>
                <div id="line_6"></div>
            </div>
            <div id="content_2">
                <div id="content_2_1">
                    <p id="pp">좋아요한 게시글</p>
                    <div id="line_7"></div>
                    
                    <input type="hidden" name="currentPage" value="<%=pi.getCurrentPage() %>">
                    <table class="list-area" border="1" align="center">
                        <thead style="height: 50px;">
                        	<tr>
                            <th width="50"><input type="checkbox" id="checkAll" onclick="checkall();"> </th>
                            <th width="70">No.</th>
                            <th width="150">게시판</th>
                            <th width="450">제목</th>
                            <th width="150">작성일</th>
                            <th width="65">조회</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<%if(list.isEmpty()) {%>
                        		<tr>
                        			<td colspan="6">좋아요한 게시글이 존재하지 않습니다.</td>
                        		</tr>
                        	<%} else { %>
                        		<%for(BoardCommon ml : list) { %>
		                            <tr style="height: 40px;">
		                                <td><input type="checkbox" class="check" name="bno" value="<%=ml.getBoardNo() %>"> </td>
		                                <td><%=ml.getBoardNo() %></td>
		                                <td><%=ml.getBoardName() %></td>
		                                <td class="goDetail1"><%=ml.getBoardTitle() %></td>
		                                <td><%=ml.getCreateDate() %></td>
		                                <td><%=ml.getCount() %></td>
		                            </tr>
		                        <%} %>
		                    <%} %>

                        </tbody>
                        </table>
                        <%if (loginUser != null) {%>
                        	<div align="right" id="write_btn">
	                            <button class="btn btn-dark">좋아요 취소</button>
	                        </div>
	                    <%} %>
                        <br><br><br>
                        <div align="center" class="paging-area">
    
                        	<%if(pi.getCurrentPage() != 1) {%>
                            	<button onclick="location.href='<%=contextPath %>/likeList.me?currentPage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                            <%} %>
                            
                            <%for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                            	<%if(i != pi.getCurrentPage()) {%>
                            	<button onclick="location.href='<%=contextPath %>/likeList.me?currentPage=<%=i%>';"><%=i %></button>
                            	<%} else {%>
                            		<button disabled><%=i %></button>
                            	<%} %>
                            <%} %>
                            
                            <%if(pi.getCurrentPage() != pi.getMaxPage()) { %>
	                            <button onclick="location.href='<%=contextPath %>/likeList.me?currentPage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
                            <%} %>
                        </div>

<!--                         <div id="search"> -->
<!--                             <form action="search.do" id="search_form"> -->
<!--                                 <div id="search_select"> -->
<!--                                     <select name="" id="" style="height: 38px;"> -->
<!--                                         <option value="">제목+내용</option> -->
<!--                                     </select> -->

<!--                                 </div> -->
<!--                                 <div id="search_text"> -->
<!--                                     <input type="search" name="keyword"> -->
<!--                                 </div> -->
                    
<!--                                 <div id="search_btn"> -->
<!--                                     <input type="button" value="검색" class="btn btn-secondary"> -->
<!--                                 </div> -->
<!--                             </form> -->
                    
<!--                         </div> -->
                </div>
            </div>
        </div>
    </div>

    <script>
    $(function(){
	    $(".goDetail1").click(function(){
	        var bno = $(this).parent().children().eq(0).text();
	       	location.href = '<%=contextPath %>/likeList.me?bno='+bno;
	    });
    });
    
    function checkall() {
		if($("#checkAll").prop("checked")) {
			$("input[class=check]").prop("checked", true);
		}
		else {
			$("input[type=checkbox]").prop("checked", false);
		}
	}
    </script>
    <%@ include file = "../../common/footer.jsp" %>
</body>
</html>