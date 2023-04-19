<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 등록</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <style>
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
            margin-top: 60px;
            height: 90%;
            width: 90%;
            /* background-color: yellow; */
        }
        #doWrite{
            border-bottom: 1px solid black;
            font-size: 60px;
            text-align: left;
            padding: 15px 0px 20px 10px;
        }
        #categoryBar>div{
            float: left;
            margin: 10px 0px;
        }
        #btns>button{
            width: 100px;
            height: 50px;
            font-size: 17px;
            font-weight: 500;
            margin: 0px 10px;
        }

    </style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="menubar"></div>
        </div>
        <div id="content" align="center">
            <div id="content_1">
                <div id="doWrite">게시글 등록</div> <br>
        <form name="form" action="">
                <div id="categoryBar" align="left">
                    <select name="boardCategory" id="" style="width: 873px; height: 46px; font-size: 18px;">
                        <option value="">카테고리</option>
                        <option value="">동네 소식</option>
                        <option value="">살림 꿀팁</option>
                        <option value="">자취 레시피</option>
                        <option value="">나눔 할게요</option>
                        <option value="">이거 필요해요</option>
                        <option value="">같이 사요</option>
                        <option value="">같이 해요</option>
                    </select>
                    <select name="" id="" style="width: 472px; height: 46px; font-size: 18px;">
                        <option value="">세부 카테고리</option>
                        <option value="">실시간 우동</option>
                        <option value="">행사/축제</option>
                        <option value="">신장 개업</option>
                        <option value="">사건/사고</option>
                        <option value="">분실/실종</option>
                    </select>
                    <br>
                    <div id="cityCategory">
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
                        <select name='county'  class=select style="width: 250px; height: 46px; font-size: 18px;">
                            <option value=''>구/군</option>
                        </select>
                        <script>
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
                            sel=document.form.county
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
                </div>
                <br>
                <div id="writeTitle">
                    <input type="text" name="title" placeholder="제목을 입력하세요." style="width: 1350px; height: 60px; font-size: 18px;" required>
                </div>
                <br>
                <div id="summernote" style="width:1350px; height:1000px;"><p>Hello Summernote</p></div>
                <div id="upFile" align="left">
                    <input type="file" name="upfile" > 
                </div>
                <br>
                <div id="btns" align="center">
                    <button type="submit" class="btn btn-outline-secondary">등록</button>
                    <button class="btn btn-outline-secondary">취소</button>
                </div>
        </form>
                <br>
                <script>
                $(document).ready(function() {
                    $('#summernote').summernote();
                    $(".note-resizebar").remove();
                    $(".note-editor").css("width","1350px").css("height","1000px");
                    $(".note-editable").css("width","1350px").css("height","1000px");
                });
                </script>
            </div>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>