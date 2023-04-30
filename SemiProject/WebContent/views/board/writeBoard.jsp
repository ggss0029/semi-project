<%@page import="com.udong.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }

        .wrap{
            height: 2000px;
            width: 1500px;
            margin: auto;
        }

        .wrap>div{
            width: 100%;
        }

        #header{
            height: 13.5%;
            border: 1px solid black;
        }

        #content{
            width: 100%;
            height: 76.5%;
            position: relative;
            border: 1px solid black;
            /* background-color: red; */
        }

        #footer{
            width: 100%;
            height: 10%;
            background-color: darkblue;
        }

        #header>div{
            width: 100%;
        }

        #header_1{
            height: 67%;
            /* background-color: red; */
        }

        #menubar{
            height: 33%;
            /* background-color: orange; */
            border: 1px solid black;
        }
        #content_1{
            /* margin-top: 76.5px;  */
            margin-top: 50px;
            height: 90%;
            width: 90%;
            /* background-color: yellow; */
        }
        #boardContent{
        	width:100%;
        }
        #doWrite{
            border-bottom: 1px solid black;
            font-size: 60px;
            text-align: left;
            padding: 15px 0px 20px 10px;
        }
        #categoryBar>div{
            float: left;
            margin-top:5px;
        }
        #btns>button{
            width: 100px;
            height: 50px;
            font-size: 17px;
            font-weight: 500;
            margin: 0px 10px;
        }
        #mapDiv{
            width: 1350px;
            height: 550px;
        }
		#imgDiv>div{
			float:left;
			font-size:20px;
		}
		#restaurantDiv{
			margin-top : 10px;
		}
		#imgListDiv>div{
			 float:left;
			 margin: 5px;
		}
    </style>
</head>
<body>
	<%@include file="./../common/menubar.jsp"%>
<script>
	$(function() {
		<%if(request.getSession().getAttribute("goBefore") != null) {%>
			<%System.out.println(request.getSession().getAttribute("goBefore"));%>
// 			location.href="mainPage.jsp";
			history.back();
			<%request.getSession().removeAttribute("goBefore");%>
			<%System.out.println(request.getSession().getAttribute("goBefore"));%>
		<%}%>
	})
</script>
    <div class="wrap">
        <div id="content" align="center">
            <div id="content_1">
                <div id="doWrite">게시글 등록</div> <br>
        <form name="form" action="<%=request.getContextPath()%>/insert.bo" method="post" enctype="multipart/form-data" onsubmit="checkFileLength();">
        	<input type="hidden" name="userNickname" value="<%=loginUser.getNickname()%>">
                <div id="categoryBar" align="left">
                    <select name="boardCategory" onchange="change1(this.selectedIndex);" id="boardCategory" style="width: 870px; height: 46px; font-size: 18px;">
                        <option value="카테고리">카테고리</option>
                        <option value="동네 소식">동네 소식</option>
                        <option value="살림 꿀팁">살림 꿀팁</option>
                        <option value="자취 레시피">자취 레시피</option>
                        <option value="동네 맛집">동네 맛집</option>
                        <option value="나눔 할게요">나눔 할게요</option>
                        <option value="이거 필요해요">이거 필요해요</option>
                        <option value="같이 사요">같이 사요</option>
                        <option value="같이 해요">같이 해요</option>
                        <option value="자유 게시판">자유 게시판</option>
                    </select>
                    <select name="detailCategory" class=input  id="" style="width: 472px; height: 46px; font-size: 18px;">
                        <option value="">세부 카테고리</option>
                    </select>
                    <script>
                        var ctgr = new Array();
                        ctgr[0] = new Array('세부 카테고리');
                        ctgr[1] = new Array('전체','실시간 우동','행사','축제','신장 개업','사건/사고','분실','실종','기타');
                        ctgr[2] = new Array('전체','청소','요리','내돈내산','핫딜 공유','기타');
                        ctgr[3] = new Array('전체','만원의 행복','편스토랑','원팬 요리','냉장고를 부탁해','기타');
                        ctgr[4] = new Array('전체','1인분','족발/보쌈','돈까스','회','일식','고기','구이','피자','치킨','찜','탕','찌개','양식','중식','아시안','버거','백반','죽','국수','분식','카페','디저트','기타');
                        ctgr[5] = new Array('전체','의류/잡화','뷰티','출산','아동','주방용품','생활용품','인테리어','가전/디지털','스포츠/레저','자동차 용품','도서','음반','DVD','완구','문구','반려동물 용품','헬스/건강식품','기타');
                        ctgr[6] = new Array('전체','의류/잡화','뷰티','출산','아동','주방용품','생활용품','인테리어','가전/디지털','스포츠/레저','자동차 용품','도서','음반','DVD','완구','문구','반려동물 용품','헬스/건강식품','기타');
                        ctgr[7] = new Array('전체','의류/잡화','뷰티','출산','아동','식품','주방용품','생활용품','인테리어','가전/디지털','스포츠/레저','자동차 용품','도서','음반','DVD','완구','문구','반려동물 용품','헬스/건강식품','기타');
                        ctgr[8] = new Array('전체','밥','커피','술','게임','운동','산책','공예','요리','낚시','레저','노래','영화','봉사','기타');
                        ctgr[9] = new Array('자유 게시판');
                        function change1(add) {
                        sel1=document.form.detailCategory
                          /* 옵션메뉴삭제 */
                          for (i=sel1.length-1; i>=0; i--){
                            sel1.options[i] = null
                            }
                          /* 옵션박스추가 */
                          for (i=0; i < ctgr[add].length;i++){                     
                            sel1.options[i] = new Option(ctgr[add][i], ctgr[add][i]);
                            }
                          if(add==4){
                        	  $("#restaurantDiv").css("display","block");
                        	  $("#cityCategory").css("display","none");
                        	  $("#imgDiv").css("display","block");
                        	  $("#titleImg").attr("required",true);
                        	  $("#file0").attr("required",true);
                          }else if(add==1 || add==7 || add==8){
                        	  $("#cityCategory").css("display","block");
                        	  $("#restaurantDiv").css("display","none");
                          }else if(add == 5){
                        	  console.log(5);
                        	  $("#cityCategory").css("display","block");
                        	  $("#restaurantDiv").css("display","none");
                        	  $("#imgDiv").css("display","block");
                        	  $("#titleImg").attr("required",true);
                        	  $("#file0").attr("required",true);
                          }else{
                        	  $("#restaurantDiv").css("display","none");
                        	  $("#cityCategory").css("display","none");
                        	  $("#imgDiv").css("display","none");
                          }
                        }
                        </script>
                </div>
                    <br>
                    <div id="cityCategory" style="display:none;">
                        <select name='city' onchange="change(this.selectedIndex);"  class=input style="width: 250px; height: 46px; font-size: 18px;">
                            <option value="">시/도</option>
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
                        <select name='country'  class=select style="width: 250px; height: 46px; font-size: 18px;">
                            <option value=''>구/군</option>
                        </select>
                        <script language='javascript'>
                            var cnt = new Array();
                            cnt[0] = new Array('구/군')
                            cnt[1] = new Array('전체');
                            cnt[2] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
                            cnt[3] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
                            cnt[4] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
                            cnt[5] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
                            cnt[6] = new Array('전체','광산구','남구','동구','북구','서구');
                            cnt[7] = new Array('전체','대덕구','동구','서구','유성구','중구');
                            cnt[8] = new Array('전체','남구','동구','북구','중구','울주군');
                            cnt[9] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
                            cnt[10] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
                            cnt[11] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
                            cnt[12] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
                            cnt[13] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
                            cnt[14] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
                            cnt[15] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
                            cnt[16] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
                            cnt[17] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
                            function change(add) {
                            sel=document.form.country
                              /* 옵션메뉴삭제 */
                              for (i=sel.length-1; i>=0; i--){
                                sel.options[i] = null
                                }
                              /* 옵션박스추가 */
                              for (i=0; i < cnt[add].length;i++){                     
                                                sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
                                }         
                            }
                       
                       </script>
                    </div>
                    
                <br>
                    <div id="writeTitle">
                        <input type="text" name="title" placeholder="제목을 입력하세요." style="width: 1348px; height: 60px; font-size: 18px;" required>
                    </div>
                     <div id="restaurantDiv" style="display:none; float:left;">
                    	<input type="text" name="restaurantName" class="restaurantName" style="width: 445px; height: 46px; font-size: 18px;" placeholder="맛집 이름">
                    	<input type="text" name="restaurantAddress" class="restaurantAddress" style="width: 800px; height: 46px; font-size: 18px;" placeholder="맛집 주소" readonly> 
                    	<button type="button" onclick="openMap();" id="openMapBtn" class="btn btn-warning" style="font-size:15px; height:46px; width:86px; margin-bottom:10px; padding: 0px;">지도 보기</button>
                    <br>
                    </div>
	                    <div id="imgDiv" style="display:none; height:100%;">
	                    	<div id="imgListDiv" style="width:90%;">
		                    	<div>
		                    		&lt;대표 이미지&gt; <br>
		                    		<img width="250" height="170" id="titleImg">
		                    	</div>
		                    	<div>
		                    		&lt;이미지 1&gt; <br>
		                    		<img id="contentImg1" width="200" height="150">
		                    	</div>
	                    	</div>
	                    	<div id="imgBtns" style="width:10%;">
		                    	<button type="button" class="btn btn-info" id="addBtn" onclick="addImg();" style="width:120px; height:50px; font-size:15px;">이미지 추가</button><br>
	    	                	<button type="button" class="btn btn-danger" id="delBtn" onclick="delImg();" style="width:120px; height:50px; font-size:15px;">이미지 삭제</button>
	                    	</div>
	                    </div>
                    
                    
                    <div id="contentArea">
                        <textarea name="content" id="boardContent" cols="30" rows="25" style="resize: none; font-size: 20px;" placeholder="내용을 입력해주세요."></textarea>
                    </div><br>
                    <div id="file-area" align="center" align="left">
						<input type="file" id="file0" name="file0" onchange="loadImg(this,0);">
						<input type="file" id="file1" name="file1" onchange="loadImg(this,1);">
					</div>
                    
                    <br>
                    <input type="hidden" name="fileLength" id="fileLength">
                    <div id="btns" align="center">
                        <button type="submit" id="submitBtn" class="btn btn-outline-secondary">등록</button>
                        <button onclick="goMain();" class="btn btn-outline-secondary">취소</button>
                    </div>
         </form>
         
         <script>
         	function checkFileLength(){
         		$("#fileLength").val($("#file-area").children().length);
         	}
         	
                    		var count = 2;
                    	function addImg(){
                    		$("#imgListDiv").append("<div>&lt;이미지 "+count+"&gt;<br> <img onclick='putImg();' id='contentImg"+count+"' width='200' height='150'><div>");
                    		$("#file-area").append("<input type='file' id='file"+count+"' name='file"+count+"' onchange='loadImg(this,"+count+");'>");
                    		count++;
							if($("#imgListDiv").children().length !=1){
                    			$("#delBtn").attr("disabled",false);
                    		}
							if($("#imgListDiv").children().length == 9){
								$("#addBtn").attr("disabled",true);								
							}
							if($("#imgListDiv").children().length>5){
								$("#boardContent").css("height","600px");
							}
                    	};
                    	function delImg(){
                    		$("#imgListDiv").children("div").last().remove();
                    		$("#file-area").children("input").last().remove();
                    		count--;
                    		if($("#imgListDiv").children().length ==1){
                    			$("#delBtn").attr("disabled",true);
                    		}
                    		if($("#imgListDiv").children().length != 9){
								$("#addBtn").attr("disabled",false);								
							}
                    	};
                    	
        				$(function(){
        					$("#file-area").hide();
        					$("#titleImg").click(function(){
        						$("#file0").click();
        					});
        					$("#contentImg1").click(function(){
        						$("#file1").click();
        					});
        				});
        				
        				function putImg(){
        					var fileNum = $(event.target).prop("id").charAt(10);
        					var fileId = "file"+fileNum
        					var inputFile = document.getElementById(fileId);
        						inputFile.click();
        				}
        				
        				function loadImg(inputFile,num){
							if(inputFile.files.length == 1){
								var reader = new FileReader();
								reader.readAsDataURL(inputFile.files[0]);
								reader.onload = function(e){
								
								switch(num){
								case 0: $("#titleImg").attr("src",e.target.result); break;
								case 1: $("#contentImg1").attr("src",e.target.result); break;
								case 2: $("#contentImg2").attr("src",e.target.result); break;
								case 3: $("#contentImg3").attr("src",e.target.result); break;
								case 4: $("#contentImg4").attr("src",e.target.result); break;
								case 5: $("#contentImg5").attr("src",e.target.result); break;
								case 6: $("#contentImg6").attr("src",e.target.result); break;
								case 7: $("#contentImg7").attr("src",e.target.result); break;
								case 8: $("#contentImg8").attr("src",e.target.result); break;
								}
							}
						}else{
							switch(num){
							case 0: $("#titleImg").attr("src",null); break;
							case 1: $("#contentImg1").attr("src",null); break;
							case 2: $("#contentImg2").attr("src",null); break;
							case 3: $("#contentImg3").attr("src",null); break;
							case 4: $("#contentImg4").attr("src",null); break;
							case 5: $("#contentImg5").attr("src",null); break;
							case 6: $("#contentImg6").attr("src",null); break;
							case 7: $("#contentImg7").attr("src",null); break;
							case 8: $("#contentImg8").attr("src",null); break;
							}
						}
				}
                    </script>
         
            </div>
        <script>
        
        	function goMain(){
        		location.href="<%=request.getContextPath()%>/mainPage.jsp";
        	}        	
        </script>

            <div id="mapDiv">
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div class="map_wrap">
                        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                    
                        <div id="menu_wrap" class="bg_white">
                            <div class="option">
                                <div>
                                    <form onsubmit="searchPlaces(); return false;">
                                        키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                                        <button type="submit">검색하기</button> 
                                    </form>
                                </div>
                            </div>
                            <hr>
                            <ul id="placesList"></ul>
                            <div id="pagination"></div>
                        </div>
                    </div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7122a55dfee4ed591b995856dce3e752&libraries=services"></script>
                                                            <script>
                                                                $("#content").css("overflow","hidden");
                                                            // 마커를 담을 배열입니다
                                                            var markers = [];

                                                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                                                mapOption = {
                                                                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                                                    level: 3 // 지도의 확대 레벨
                                                                };  

                                                            // 지도를 생성합니다    
                                                            var map = new kakao.maps.Map(mapContainer, mapOption); 

                                                            // 장소 검색 객체를 생성합니다
                                                            var ps = new kakao.maps.services.Places();  

                                                            // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                                                            var infowindow = new kakao.maps.InfoWindow({zIndex:1});

                                                            // 키워드로 장소를 검색합니다
                                                            searchPlaces();

                                                            // 키워드 검색을 요청하는 함수입니다
                                                            function searchPlaces() {

                                                                var keyword = document.getElementById('keyword').value;

                                                                if (!keyword.replace(/^\s+|\s+$/g, '')) {
                                                                    alert('키워드를 입력해주세요!');
                                                                    return false;
                                                                }

                                                                // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                                                                ps.keywordSearch( keyword, placesSearchCB); 
                                                            }

                                                            // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                                                            function placesSearchCB(data, status, pagination) {
                                                                if (status === kakao.maps.services.Status.OK) {

                                                                    // 정상적으로 검색이 완료됐으면
                                                                    // 검색 목록과 마커를 표출합니다
                                                                    displayPlaces(data);

                                                                    // 페이지 번호를 표출합니다
                                                                    displayPagination(pagination);

                                                                } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                                                                    alert('검색 결과가 존재하지 않습니다.');
                                                                    return;

                                                                } else if (status === kakao.maps.services.Status.ERROR) {

                                                                    alert('검색 결과 중 오류가 발생했습니다.');
                                                                    return;

                                                                }
                                                            }

                                                            // 검색 결과 목록과 마커를 표출하는 함수입니다
                                                            function displayPlaces(places) {

                                                                var listEl = document.getElementById('placesList'), 
                                                                menuEl = document.getElementById('menu_wrap'),
                                                                fragment = document.createDocumentFragment(), 
                                                                bounds = new kakao.maps.LatLngBounds(), 
                                                                listStr = '';
                                                                
                                                                // 검색 결과 목록에 추가된 항목들을 제거합니다
                                                                removeAllChildNods(listEl);

                                                                // 지도에 표시되고 있는 마커를 제거합니다
                                                                removeMarker();
                                                                
                                                                for ( var i=0; i<places.length; i++ ) {

                                                                    // 마커를 생성하고 지도에 표시합니다
                                                                    var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                                                                        marker = addMarker(placePosition, i), 
                                                                        itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                                                                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                                                                    // LatLngBounds 객체에 좌표를 추가합니다
                                                                    bounds.extend(placePosition);

                                                                    // 마커와 검색결과 항목에 mouseover 했을때
                                                                    // 해당 장소에 인포윈도우에 장소명을 표시합니다
                                                                    // mouseout 했을 때는 인포윈도우를 닫습니다
                                                                    (function(marker, title) {
                                                                        kakao.maps.event.addListener(marker, 'mouseover', function() {
                                                                            displayInfowindow(marker, title);
                                                                        });

                                                                        kakao.maps.event.addListener(marker, 'mouseout', function() {
                                                                            infowindow.close();
                                                                        });

                                                                        itemEl.onmouseover =  function () {
                                                                            displayInfowindow(marker, title);
                                                                        };

                                                                        itemEl.onmouseout =  function () {
                                                                            infowindow.close();
                                                                        };
                                                                    })(marker, places[i].place_name);

                                                                    fragment.appendChild(itemEl);
                                                                }

                                                                // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                                                                listEl.appendChild(fragment);
                                                                menuEl.scrollTop = 0;

                                                                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                                                                map.setBounds(bounds);
                                                            }

                                                            // 검색결과 항목을 Element로 반환하는 함수입니다
                                                            function getListItem(index, places) {

                                                                var el = document.createElement('li'),
                                                                itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                                                                            '<div class="info" onclick="findInfo();">' +
                                                                            '   <h5>' + places.place_name + '</h5>';

                                                                if (places.road_address_name) {
                                                                    itemStr += '    <span>' + places.road_address_name + '</span>' +
                                                                                '   <span class="jibun gray">' +  places.address_name  + '</span>';
                                                                } else {
                                                                    itemStr += '    <span>' +  places.address_name  + '</span>'; 
                                                                }
                                                                            
                                                                itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                                                                            '</div>';           

                                                                el.innerHTML = itemStr;
                                                                el.className = 'item';

                                                                return el;
                                                            }

                                                            // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                                                            function addMarker(position, idx, title) {
                                                                var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                                                                    imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                                                                    imgOptions =  {
                                                                        spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                                                                        spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                                                                        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                                                                    },
                                                                    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                                                                        marker = new kakao.maps.Marker({
                                                                        position: position, // 마커의 위치
                                                                        image: markerImage 
                                                                    });

                                                                marker.setMap(map); // 지도 위에 마커를 표출합니다
                                                                markers.push(marker);  // 배열에 생성된 마커를 추가합니다

                                                                return marker;
                                                            }

                                                            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                                                            function removeMarker() {
                                                                for ( var i = 0; i < markers.length; i++ ) {
                                                                    markers[i].setMap(null);
                                                                }   
                                                                markers = [];
                                                            }

                                                            // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                                                            function displayPagination(pagination) {
                                                                var paginationEl = document.getElementById('pagination'),
                                                                    fragment = document.createDocumentFragment(),
                                                                    i; 

                                                                // 기존에 추가된 페이지번호를 삭제합니다
                                                                while (paginationEl.hasChildNodes()) {
                                                                    paginationEl.removeChild (paginationEl.lastChild);
                                                                }

                                                                for (i=1; i<=pagination.last; i++) {
                                                                    var el = document.createElement('a');
                                                                    el.href = "#";
                                                                    el.innerHTML = i;

                                                                    if (i===pagination.current) {
                                                                        el.className = 'on';
                                                                    } else {
                                                                        el.onclick = (function(i) {
                                                                            return function() {
                                                                                pagination.gotoPage(i);
                                                                            }
                                                                        })(i);
                                                                    }

                                                                    fragment.appendChild(el);
                                                                }
                                                                paginationEl.appendChild(fragment);
                                                            }

                                                            // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
                                                            // 인포윈도우에 장소명을 표시합니다
                                                            function displayInfowindow(marker, title) {
                                                                var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

                                                                infowindow.setContent(content);
                                                                infowindow.open(map, marker);
                                                            }

                                                            // 검색결과 목록의 자식 Element를 제거하는 함수입니다
                                                            function removeAllChildNods(el) {   
                                                                while (el.hasChildNodes()) {
                                                                    el.removeChild (el.lastChild);
                                                                }
                                                            }

                                                            function openMap(){
                                                                $("#mapDiv").css("transform","translateY(-2660px)");
                                                                map.relayout();
//                                                                 $("#closeMapBtn").css("display","block");
//                                                                 $("#openMapBtn").css("display","none");
                                                            }

                                                            function closeMap1(){
                                                                $("#mapDiv").css("transform","translateY(2660px)");
                                                                $("#openMapBtn").css("display","block");
                                                                $("#closeMapBtn").css("display","none");
                                                            }

                                                            function findInfo(){
                                                                var abc = $(event.target).parent().children();
                                                                
                                                                var name = abc.eq(0).text();
                                                                var address = abc.eq(2).text();
                                                                $(".restaurantName").val(name);
                                                                $(".restaurantAddress").val(address);
                                                                $("#mapDiv").css("transform","translateY(2060px)");
                                                            }
                                                            </script>
                       </div>
                    </div>
                           <br>
    <%@include file="./../common/footer.jsp" %>
    </div>
</body>
</html>