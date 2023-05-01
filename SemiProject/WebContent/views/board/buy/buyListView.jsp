<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.udong.board.buy.model.vo.BuyBoard"%>
<%@page import="com.udong.common.model.vo.PageInfo"%>
<%
	ArrayList<BuyBoard> blist = (ArrayList<BuyBoard>) request.getAttribute("blist");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            height: 76.5%;
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

        #buy{ /*동네 소식 글씨, 위치*/
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

        #together { /*살림 꿀팁 글씨, 위치*/
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

        #line_4 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 345px;
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

        #content_2_1>p{ /*contente2 안에 있는 같아사요 글씨 , 위치*/
            position: absolute;
            top: 45px;
            left: 54px;
            font-size: 45px;
            font-weight: 500;
        }

        #line_5 {
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 0px;
            top: 120px;
            left: 45px;
        }

        #box{ /*지역선택, 카테고리 들어가는 박스*/
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 15%;
            top: 135px;
            left: 45px;
            border-radius: 30px;
        }

        #b2{ /*카테고리 글씨, 위치*/
            float: left;
            font-size: 25px;
            font-weight: 600;
            margin: 30px 0 0 50px;
        }

        #category{ /*checkbox들을 감싸고 있는 div*/
            float: left;
            font-size: 18px;
            margin: 34px 0 0 30px;
            vertical-align: super;
            accent-color: darkgray; /*체크박스 색깔 바꾸기*/
        }

        label{
            /* margin-left: 5px; */
            margin-right: 18px;
        }
        
        #category_btn{
            float: none;
        }
        #line_6 {
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 0px;
            top: 375px;
            left: 45px;
        }

        /* 게시글 테이블 */
        .list-area{
            /*border: 1px solid black;*/
            text-align: center;
            margin: 410px 0 0 80px;
            font-size: 17px;
        }
        
        .list-area>tbody>tr:hover {
			background-color: #C8EDC9;
			cursor: pointer;
		}

        /* 글쓰기 버튼 */
        #write_btn{
            margin: 0 70px;
        }


        /* 하단 검색창 */
        #search{
            width: 600px;
            height: 150px;
            position: relative; /*검색창을 가운데로 옮기기 위한 기준잡기*/
        }

        #search_form{
            /* border: 2px solid blue; */
            width: 80%;
            height: 20%;
            position: absolute;
            right: 0px;
            left: 310px;
            top: 10px;
            bottom: 0px;
        }

        #search_select{
            float: left;
            width: 20px;
        }

        #search_text{
            float: left;
            margin-left: 80px;
            width: 100px;
        }

        #search_text>input{
            width: 300px;
            height: 38px;
        }

        #search_btn{
            float: left;
            margin-left: 200px;
        }

        



    </style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
    <div class="wrap">
        <div id="content">
            <div id="content_1">
                <p>함께 해요</p>
                <div id="line_1"></div>
                <a href="<%=contextPath%>/buyList.bo?currentPage=1" id="buy" id="together">같이 사요</a>
                <div id="line_2"></div>
                <a href="">같이 해요</a>
                <div id="line_3"></div>
            </div>

            <div id="content_2">
                <div id="content_2_1">
                    <p>같이 사요</p>
                    <div id="line_5"></div>

                    <div id="box">
                     	<p id="b1">지역선택</p>
                        <form action="<%=contextPath %>/buyList.bo" id="buySearch">
	                            <input type="hidden" name="currentPage" value="<%=pi.getCurrentPage() %>">
	                        <div id="location">
	                                	시/도:
	                                <select name="city" id="city" onchange="change(this.selectedIndex);"  class=input >
	                                    <option value='전체'>전체</option>
	                                    <option value='서울'>서울특별시</option>
	                                    <option value='부산'>부산광역시</option>
	                                    <option value='대구'>대구광역시</option>
	                                    <option value='인천'>인천광역시</option>
	                                    <option value='광주'>광주광역시</option>
	                                    <option value='대전'>대전광역시</option>
	                                    <option value='울산'>울산광역시</option>
	                                    <option value='경기'>경기도</option>
	                                    <option value='강원'>강원도</option>
	                                    <option value='충북'>충청북도</option>
	                                    <option value='충남'>충청남도</option>
	                                    <option value='전북'>전라북도</option>
	                                    <option value='전남'>전라남도</option>
	                                    <option value='경북'>경상북도</option>
	                                    <option value='경남'>경상남도</option>
	                                    <option value='제주'>제주도</option>
	                                </select>                                                  
	                                	구/군:
	                                <select name="county" id="county" class=select>
	                                    <option value=''>전체</option>
	                                </select>
	                            
	                        </div>
	                        <br> <br> <br>
                        <p id="b2">카테고리</p>
                        <div id="category"> 
                            <input type="checkbox" class="check" id="fashion" value="의류/잡화"> <label for="fashion" >의류/잡화</label>
                            <input type="checkbox" class="check" id="beauty" value="뷰티"> <label for="beauty">뷰티</label>
                            <input type="checkbox" class="check" id="delivery"value="출산"> <label for="delivery">출산</label>
                            <input type="checkbox" class="check" id="child" value="아동"> <label for="child">아동</label>
                            <input type="checkbox" class="check" id="kitchen" value="주방용품"> <label for="kitchen" >주방용풍</label>
                            <input type="checkbox" class="check" id="daliy" value="생활용품"> <label for="daliy">생활용품</label>
                            <input type="checkbox" class="check" id="interior" value="인테리어"> <label for="interior">인테리어</label>
                            <br>
                            <input type="checkbox" class="check" id="digital" value="가전/디지털"> <label for="digital">가전/디지털</label>
                            <input type="checkbox" class="check" id="sport" value="스포츠/레저"> <label for="sport">스포츠/레저</label>
                            <input type="checkbox" class="check" id="car" value="자동차 용품"> <label for="clar" >자동차 용품</label>
                            <input type="checkbox" class="check" id="book" value="도서"> <label for="book">도서</label>
                            <input type="checkbox" class="check" id="album" value="음반"> <label for="album">음반</label>
                            <input type="checkbox" class="check" id="dvd" value="DVD"> <label for="dvd">DVD</label>
                            <input type="checkbox" class="check" id="toy" value="완구"> <label for="toy">완구</label>
                            <input type="checkbox" class="check" id="stationery" value="문구"> <label for="stationery">문구</label>
                            <br>
                            <input type="checkbox" class="check" id="animal" value="반려동물 용품"> <label for="animal">반려동물 용품</label>
                            <input type="checkbox" class="check" id="health" value="헬스/건강식품"> <label for="health">헬스/건강식품</label>
                            <input type="checkbox" class="check" id="others" value="기타"> <label for="others">기타</label>    
                        </div>
                        <br><br><br>
                        
                        <div id="category_btn" align="center">
                            <button type="reset" class="btn btn-light">초기화</button>
                            <button type="button" class="btn btn-primary" onclick="buySearch();">검색</button>
                        </div>
                 	  </form>
                    </div>
                    <div id="line_6"></div>

                    <table class="list-area" border="0" align="center">
                        <thead style="height: 50px; border-top:3px solid black; border-bottom:3px solid black;">
                            <tr>
	                            <th width="70">No.</th>
	                            <th width="440">제목</th>
	                            <th width="150">작성자</th>
	                            <th width="150">작성일</th>
	                            <th width="65">조회</th>
	                            <th width="65">좋아요</th>
	                        </tr>
                        </thead>
                        	<%
								if (blist.isEmpty()) {
							%>
							<!-- 만약 리스트가 비어있다면 -->
							<tr>
								<td colspan="6">글이 존재하지 않습니다</td>
							</tr>
							<%
								} else {
							%>
							<!-- 목록이 있으면 (반복문으로 전부 출력해주기) -->
							<%
								for (BuyBoard buyb : blist) {
							%>
							<!-- 순차적으로 전부 접근할 것이기 때문에 향상된 for문 사용 -->
							<tr style="height: 40px; border-bottom: 1px solid black;">
								<td><%=buyb.getBoardNo()%></td>
								<!-- No. -->
								<td class="goDetail1"><%=buyb.getBoardTitle()%></td>
								<!-- 제목 -->
								<td><a data-toggle="modal" data-target="#profile"
									onclick="profile();"><%=buyb.getBoardWriter()%></a></td>
								<!-- 작성자  닉네임 -->
								<td><%=buyb.getCreateDate()%></td>
								<!-- 작성한 날짜 -->
								<td><%=buyb.getCount()%></td>
								<!-- 조회수 -->
								<td><%=buyb.getLikeCount()%></td>
								<!-- 좋아요한 수 -->
							</tr>
							<%
								}
							%>
							<%
								}
							%>
<!--                         <tbody> -->
<!--                             <tr style="height: 40px; border-bottom:1px solid black;"> -->
<!--                                 <td>1</td> -->
<!--                                 <td>첫 게시물</td> -->
<!--                                 <td>수지</td> -->
<!--                                 <td>2023-04-14</td> -->
<!--                                 <td>100</td> -->
<!--                                 <td>1004</td> -->
<!--                             </tr> -->
                           
                        </tbody>
                        </table>
                        <br>
                        <%if (loginUser != null) {%>
                        <div align="right" id="write_btn">
                            <a href="<%=request.getContextPath()%>/views/board/writeBoard.jsp" class="btn btn-light">글쓰기</a>
                        </div>
                        <%} %>
                        <br><br>

						<div align="center" class="paging-area">
    
                        	<%if(pi.getCurrentPage() != 1) {%>
                            	<button onclick="location.href='<%=contextPath %>/buyList.bo?currentPage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
                            <%} %>
                            
                            <%for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                            	<%if(i != pi.getCurrentPage()) {%>
                            	<button onclick="location.href='<%=contextPath %>/buyList.bo?currentPage=<%=i%>';"><%=i %></button>
                            	<%} else {%>
                            		<button disabled><%=i %></button>
                            	<%} %>
                            <%} %>
                            
                            <%if(pi.getCurrentPage() != pi.getMaxPage()) { %>
	                            <button onclick="location.href='<%=contextPath %>/buyList.bo?currentPage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
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
                    
                        </div>
                </div>
            </div>
        </div>
        <script>
    
		    $(function(){
		    	//.list-area클래스 자손tbody 자손tr 클릭됐을때
			    $(".goDetail1").click(function(){
			        
			        var bno = $(this).parent().children().first().text();
			        
			       	location.href = '<%=contextPath %>/buyDetail.bo?bno='+bno;
			    });
		    	
		    });
		    
		    function buySearch() {
		    	var city = $("#city").val();
		    	var county = $("#county").val();
		    	
		    	var str = ""
		    	$("input[class=check]:checked").each(function() {
		    		str += "BC=" + $(this).val() + "&";
		    	});
		    		str += "city=" + city + "&county=" + county
		    		
		    		$.ajax({
		    			url : "buyCategoryList.bo?"+str,
		    			data : {
		    				city : city,
		    				county : county
		    			}
		    			type : "post",
		    			success : function(blist) {
		    				$(".list-area").children("tbody").children().remove();
		    				$(".paging-area").children().remove();
		    				
		    				if(blist[0] == null){
		    					alert("검색된 게시물이 없습니다.");
		    				}else {
		    					var str = "";
		    					var str2 = "";
		    					var str3 = "";
		    					if(blist.length > 9) {
		    						for(var i = 0; i < blist.length; i++) {
		    							if(i < 10) {
		    								str += "<tr style='height: 40px; border-bottom:1px solid black;'>"
		    									+ "<td>"+ nlist[i].boardNo +"</td>"
		    									+ "<td class='goDetail1'>"+ nlist[i].boardTitle +"</td>"
		    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ nlist[i].boardWriter +"</a></td>"
		    									+ "<td>"+ nlist[i].createDate +"</td>"
		    									+ "<td>"+ nlist[i].count +"</td>"
		    									+ "<td>"+ nlist[i].likeCount +"</td>"
		    									+ "<tr>"
		    							}
		    							if(i>9 && i< 19) {
		    								str2 += "<tr style='height: 40px; border-bottom:1px solid black;'>"
		    									+ "<td>"+ nlist[i].boardNo +"</td>"
		    									+ "<td class='goDetail1'>"+ nlist[i].boardTitle +"</td>"
		    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ nlist[i].boardWriter +"</a></td>"
		    									+ "<td>"+ nlist[i].createDate +"</td>"
		    									+ "<td>"+ nlist[i].count +"</td>"
		    									+ "<td>"+ nlist[i].likeCount +"</td>"
		    									+ "<tr>"
		    							}
		    							if(i>18) {
		    								str3 += "<tr style='height: 40px; border-bottom:1px solid black;'>"
		    									+ "<td>"+ nlist[i].boardNo +"</td>"
		    									+ "<td class='goDetail1'>"+ nlist[i].boardTitle +"</td>"
		    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ nlist[i].boardWriter +"</a></td>"
		    									+ "<td>"+ nlist[i].createDate +"</td>"
		    									+ "<td>"+ nlist[i].count +"</td>"
		    									+ "<td>"+ nlist[i].likeCount +"</td>"
		    									+ "<tr>"
		    							}
		    						}
		    						
		    						
		    					}else {
		    						for(var i in nlist) {
		    							str += "<tr style='height: 40px; border-bottom:1px solid black;'>"
											+ "<td>"+ nlist[i].boardNo +"</td>"
											+ "<td class='goDetail1'>"+ nlist[i].boardTitle +"</td>"
											+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ nlist[i].boardWriter +"</a></td>"
											+ "<td>"+ nlist[i].createDate +"</td>"
											+ "<td>"+ nlist[i].count +"</td>"
											+ "<td>"+ nlist[i].likeCount +"</td>"
											+ "<tr>"
		    						}
		    						$(".list-area").append(str);
		    					}
		    				}
		    			},
		    			error : function() {
		    				alert("카테고리 조회 실패");
		    			}
		    			
		    		});
		    }
		    
		    window.onpageshow = function(event) {
			    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
			        // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
			        location.reload();
			    }
			}
			    
		        var cnt = new Array();
		        cnt[0] = new Array('전체');
		        cnt[1] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
		        cnt[2] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
		        cnt[3] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
		        cnt[4] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
		        cnt[5] = new Array('전체','광산구','남구','동구','북구','서구');
		        cnt[6] = new Array('전체','대덕구','동구','서구','유성구','중구');
		        cnt[7] = new Array('전체','남구','동구','북구','중구','울주군');
		        cnt[8] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
		        cnt[9] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
		        cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
		        cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
		        cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
		        cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
		        cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
		        cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
		        cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
		        function change(add) {
//		         sel=document.getElementById("location")>county
//		           /* 옵션메뉴삭제 */
//		           for (i=sel.length-1; i>=0; i--){
//		             sel.options[i] = null
//		             }
//		           /* 옵션박스추가 */
//		           for (i=0; i < cnt[add].length;i++){                     
//		                             sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
//		             }        
				for (i=$("#county").children().length-1; i>=0; i--){
					$("#county").children().remove();
				}
				for (i=0; i < cnt[add].length;i++){
					$("#county").append("<option>"+cnt[add][i]+"</option>");
				}
		        }
        
   
   </script>
    <%@ include file = "../../common/footer.jsp" %>
</body>
</html>