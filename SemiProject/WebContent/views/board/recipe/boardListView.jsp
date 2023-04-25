<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.udong.board.recipe.model.vo.Board
    , com.udong.common.model.vo.PageInfo" %>
    
 <%
 
 	String contextPath = request.getContextPath();
	//담은 리스트 꺼내주기
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
 	PageInfo pi = (PageInfo)request.getAttribute("pi");
 
 %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	   <!--jQuery 라이브러리-->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <style>
        .wrap{
            width: 1500px;
            height: 1730px;
            border: 1px solid black;
            margin: auto;
        }

        .wrap>div{
            height: 100%;
            width: 100%;
        }

        #header{
            height: 13.5%;
        }

        #header>div{
            width: 100%;
        }

        .header_1{
            background-color: red;
            height: 180px;
        }

        .header_2{ /*메뉴바*/
            background-color: orange;
            height: 90px;
        }

        #content {
            width: 100%;
            height: 76.5%;
        }

        #content>div {
            float: left;
            height: 100%;
        }

        .content_1 {
            background-color: yellow;
            width: 25%;
        }

        .content_2 {
            background-color: green;
            width: 75%;
            position: relative;/*놓침*/
        }

           /****************추가 스타일영역*****************/

        .content-wrapper {
            height: 200px;
            border: 1px solid black;
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            align-items: flex-start;
            flex-wrap: wrap;
        }

        .content-wrapper .box {
            width: 200px;
            height: 50px;
            border: 1px solid black;
        }

        .filter-wrapper {
            background-color: #eeeeee;
            border-radius: 20px;
            padding: 20px 0;
        }
        
        .filter-wrapper .select-box {
            display: flex;
        }

        .filter-wrapper .select-box .select-label {
            /* border: 1px solid blue; */
            height: 50px;
            width: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .filter-wrapper .select-box .select-label h4 {
            margin: 0;
            font-size: 34px;
        }

        .filter-wrapper .select-box .select-list{
            /* border: 1px solid red; */
            height: 50px;
            width: calc(100% - 200px);
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
        }

        .filter-wrapper .select-box .select-list .input-row {
            margin-right: 8px;
        }

        .filter-wrapper .button-wrapper {
            display: flex;
            /* direction 방향 정렬 */
            justify-content: center;
            /* direction의 수직축 정렬 */
            align-items: center; 
            /* padding: 20px 0; */
            padding-top: 20px;
        }

        .filter-wrapper .button-wrapper button {
            border: 0;
            padding: 8px 20px;
            border-radius: 4px;
        }

        .filter-wrapper .button-wrapper button.clear {
            background-color: skyblue;
            color: #fff;
            margin-right: 8px;
        }

        .filter-wrapper .button-wrapper button.search {
            background-color: black;
            color: #fff;
        }

        
     
        #page-area{
            border: 1px solid black;
            background-color: white;
            width: 1100px;
            height: 1500px;
            margin:auto;
            margin-top: 12.5px;
          
        }



        /*<table 요소>*/
        .list-area{
            border: 1px solid black;
            text-align: center;

            /*table태그 마진 넣는 방법*/
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        .list-area>tbody>tr:hover{
            background-color:lightgreen;
            cursor: pointer;
        }

        .list-area>thead>tr{
            font-size: 15pt;
        }

        .list-area>tbody>tr{
            font-size: 15pt;
        }

        #catLabel{
            display:inline-block;
            width:160px;
             line-height:50px; 
        }

        .button-area{
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            margin-right: 40px;


        }

        .button-area button{
            border: 0;
            padding: 8px 20px;
            border-radius: 4px;
        }

        .keywordSearch{
            position: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            text-align: center;
            padding-top: 20px;
          
        }

   
        .keywordSearch input {
        width: 300px;
        border: 1px solid #bbb;
        border-radius: 8px;
        padding: 12px 12px;
        font-size: 14px;
        }

        .keywordSearch img {
        width: 17px;
        top: 10px;
        right: 12px;
        margin: 0;
        }
        
        .writePost{
          cursor: pointer;
        }


        /********************************/

        #footer {
            background-color: purple;
            width: 100%;
            height: 10%;
        }

        #p1 {
            font-size: 45px;
            font-weight: 550;
        }

        a {
            text-decoration: none;
            color: black;
            font-size: 30px;
        }

        .category {
            margin: 30px;
        }
    </style>




</head>
<body>

	 <div class="wrap">
        <div id="header">
            <div class="header_1"></div>
            <div class="header_2"></div>
        </div>
        <div id="content">
            <div class="content_1">
                <div class="category">
                    <p id="p1">
             		           마이 페이지
                    </p>
                    <hr>
                    <a href="">나의 정보</a> <br>
                    <hr>
                    <a href="">개인정보 수정</a> <br>
                    <hr>
                    <a href="">작성한 게시글</a> <br>
                    <hr>
                    <a href="">좋아요한 게시글</a> <br>
                    <hr>
                    <a href="">회원 탈퇴</a> <br>
                </div>
            </div>
            <div class="content_2">
               
                <!--page-area-->
                <div id="page-area">

                    <h1 align="left"> 자취레시피</h1>

                    <div class="filter-wrapper">
                        <div class="select-box">
                            <div class="select-label">
                                <h4>카테고리</h4>
                            </div>
                            <div class="select-list">
                                <div class="input-row">
                                    <input type="checkbox">
                                    <label for="">만원의 행복</label>
                                </div>
                                <div class="input-row">
                                    <input type="checkbox">
                                    <label for="">편스토랑</label>
                                </div>
                                <div class="input-row">
                                    <input type="checkbox">
                                    <label for="">원팬요리</label>
                                </div>
                                <div class="input-row">
                                    <input type="checkbox">
                                    <label for="">냉장고를 부탁해</label>
                                </div>
                                <div class="input-row">
                                    <input type="checkbox">
                                    <label for="">기타</label>
                                </div>
                               
                            </div>
                        </div>
                        <div class="button-wrapper">
                            <button class="clear">초기화</button>
                            <button class="search">검색</button>
                        </div>
                    </div>

               

                    <table class="list-area" align="center">
                        <thead>
                            <tr>
                                <th width="100">글번호</th>
                                <th width="500">제목</th>
                                <th width="200">작성자</th>
                                <th width="200">작성일</th>
                                <th width="100">조회</th>
                                <th width="200">좋아요</th>
                            </tr>

                        </thead>
                        <tbody>
                        
                            <%if(list.isEmpty()){%>
                        
                        	<tr>
                        		<td>표시할 게시글이 없습니다. </td>
                        	</tr>
                        	<%} else{ %>
                        
                        
                            	<%for(Board b: list) {%>
                          	<tr>
                                <td><%=b.getBoardNo() %></td>
                                <td><%=b.getBoardTitle() %></td>
                                <td><%=b.getNickName() %></td>
                                <td><%=b.getCreateDate() %></td>
                                <td><%=b.getCount() %></td>
                                <td><%=b.getBoardLikeNo() %></td>
                            </tr>
                            	<%} %>
                            <%} %>
                            

                        </tbody>
                        
                    </table>


                    <div align="center" class="button-area">
                        <button class="writePost" type="button" onclick="location.href='<%=contextPath %>/insert.bo';">글쓰기</button>
                    </div>



                        <!--페이지 버튼 부분 -->
                    <div align="center" class="paging-area">
                    
                	<%if(pi.getCurrentPage()!= 1){ %>
					<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
					<%} %>
					
					<%for(int i = pi.getStartPage(); i<=pi.getEndPage(); i++){ %>
					
						<% if(i != pi.getCurrentPage()){ %>
                       	<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=i%>';"><%=i %></button>
                        <%} else{ %>
                        <button disabled><%=i %></button>
                        <%} %>
                        
                    <%} %>
                    
                   <%if(pi.getCurrentPage() != pi.getMaxPage()){ %>
					<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
					<%} %>
                    </div>
                    
                    
                    
                    

                       <!--검색창 부분 -->
                    <div class="keywordSearch">
                        <div class="keywordSearch-button">
                            <form method="post" action="searchPosting.bo">
                                    <input name="keyword" type="text" placeholder="검색어를 입력하세요">
                                     <input type="hidden" name="currentPage" value="1">
                                    <button type="submit"><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"></button>
                            </form>
                        </div>    
                     </div>

                </div>

             
                
            </div>
        </div>
        <div id="footer"></div>
    </div>

    <script>

        /*is() 메소드 선택된 요소가 지정된 선택자(selector)와 일치하는지 여부 확인*/

        function checkAll() {
        if($("#cboxAll").is(':checked')) {
            $("input[name=cbox]").prop("checked", true);
        } else {
            $("input[name=cbox]").prop("checked", false);
        }
    }

    </script>






</body>
</html>