<%@page import="java.util.Iterator" %>
<%@page import="com.semi4.vo.GameImage" %>
<%@page import="com.semi4.dao.GameImageDao" %>
<%@page import="java.awt.font.ImageGraphicAttribute" %>
<%@page import="com.semi4.utils.DateUtil" %>
<%@page import="com.semi4.vo.Game" %>
<%@page import="com.semi4.dao.GameDao" %>
<%@page import="com.semi4.vo.Publisher" %>
<%@page import="com.semi4.dao.PublisherDao" %>
<%@page import="com.semi4.vo.Genre" %>
<%@page import="java.util.List" %>
<%@page import="com.semi4.dao.GenreDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>관리자 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script type="text/javascript"> $(window).scroll(function (event) {
        if (jQuery(window).scrollTop() >
            jQuery(".banner").offset().top) {
            jQuery("#chase").css("position", "fixed");
        } else if ((jQuery(window).scrollTop()
            < jQuery(".banner").offset().top)) {
            jQuery("#chase").css("position", "static");
        }
    }); </script>
    <style>
        #admin-list.admin-off {
            display: none;
        }

        #game-list.game-off {
            display: none;
        }

        .link {
            color: black;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<%@ include file="isLogin.jsp" %>
<div class="container">
    <!-- 관리자 페이지 상단 글씨 -->
    <div class="row">
        <div class="col-sm-12" style="border-bottom:2px solid grey;">
            <h1><a class="link" href="adminMain.jsp" style="text-decoration:none;"><strong>관리자 페이지</strong></a></h1>

        </div>
    </div>
    <!-- 관리자 페이지 좌측 tab 선택 부분 -->

    <div class="banner col-sm-3">
        <div id="chase" style="top:0px;">
            <div class="col-sm-12">
                <h4><a class="link" href="adminNotice.jsp" style="text-decoration:none;">공지사항</a></h4>
            </div>
            <div class="col-sm-12">
                <h4><a class="link" href="adminQna.jsp" style="text-decoration:none">QNA 게시판 관리</a></h4>
            </div>
            <div class="col-sm-12">
                <h4><a class="link" href="adminProfits.jsp" style="text-decoration:none">수익 조회</a></h4>
            </div>
            <div class="col-sm-12">
                <h4><a class="link" href="" style="text-decoration:none" onclick="gamelist(event)">게임 관리
                    <span class="caret"></span>
                </a></h4>
                <ul id="game-list" class="game-off" style="list-style-type: none;">
                    <li style="padding-bottom:5px;"><a class="link" href="adminGameRegisterForm.jsp"
                                                       style="text-decoration:none">새로운 게임 등록</a></li>
                    <li><a class="link" href="adminEditGameForm1.jsp" style="text-decoration:none">게임정보 수정/삭제</a></li>
                </ul>
            </div>
            <div class="col-sm-12">
                <h4><a class="link" href="" style="text-decoration:none" onclick="adminList(event)">관리자 계정 관리
                    <span class="caret"></span>
                </a></h4>
                <ul id="admin-list" class="admin-off" style="list-style-type: none;">
                    <li style="padding-bottom:5px;"><a class="link" href="adminClientRegisterForm.jsp"
                                                       style="text-decoration:none">관리자 생성</a></li>
                    <li style="padding-bottom:5px;"><a class="link" href="adminClientEditForm.jsp"
                                                       style="text-decoration:none">관리자 수정</a></li>
                    <li><a class="link" href="adminClientDeleteForm.jsp" style="text-decoration:none">관리자 삭제</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 구분선 -->

    <!-- 관리자 페이지 우측 메인컨텐츠 부분 -->
    <div class="col-sm-9" style="border-left: 2px solid grey;">
        <div class="row">
            <div class="col-sm-12">
                <h3 class="text-center" style="font-weight: bold;">등록된 게임정보 수정 테스트</h3><br><br>
            </div>
        </div>
        <!-- 게임 등록 입력폼 부분 -->
        <%
            int gameNo = Integer.parseInt(request.getParameter("gameno"));
            GameDao gameDao = GameDao.getInstance();
            Game game = gameDao.getGameByNo(gameNo);
            String date = DateUtil.dateToString(game.getCreateDate());
        %>
        <div class="row">
            <div class="col-sm-offset-1 col-sm-10">
                <form class="well" method="post" id="edit-form" enctype="multipart/form-data"
                      action="adminEditGame.jsp">
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="gameno" value="<%=game.getNo() %>"/>
                    </div>
                    <div class="form-group">
                        <label>게임 제목</label>
                        <input type="text" class="form-control" name="title" id="game-title"
                               value="<%=game.getTitle() %>" onkeypress="checkTitle()"/>
                    </div>
                    <div class="form-group">
                        <label>가격</label>
                        <input type="text" class="form-control" name="price" id="game-price"
                               value="<%=game.getPrice() %>" onkeypress="numberOnly()"/>
                    </div>
                    <div class="form-group">
                        <label>할인가격</label>
                        <input type="text" class="form-control" name="discountPrice" id="game-discountPrice"
                               value="<%=game.getDiscountPrice() %>" onkeypress="numberOnly()"/>
                    </div>
                    <div class="form-group">
                        <label>출시일</label>
                        <input type="date" class="form-control" name="createDate" id="game-createDate"
                               value="<%=date %>"/>
                    </div>
                    <div class="form-group">
                        <label>장르 선택</label>
                        <select class="form-control inputbox" name="genreno" id="game-genre">
                            <%
                                GenreDao genreDao = GenreDao.getInstance();
                                List<Genre> allGenres = genreDao.getAllGenres();
                                int genreNo = game.getGenre().getNo();
                                for (Genre genre : allGenres) {
                            %>

                            <option value="<%=genre.getNo() %>" <%=genre.getNo() == genreNo ? "selected" :
                                    "" %>><%=genre.getName() %>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>퍼블리셔 선택</label>
                        <select class="form-control inputbox" name="publisherno" onchange="changePublisher()"
                                id="pub-select">
                            <%
                                PublisherDao publisherDao = PublisherDao.getInstance();
                                List<Publisher> allPublishers = publisherDao.getAllPublishers();
                                int publisherNo = game.getPublisher().getNo();
                                for (Publisher publisher : allPublishers) {
                            %>
                            <option value="<%=publisher.getNo() %>" <%=publisher.getNo() == publisherNo ? "selected" :
                                    "" %> ><%=publisher.getName() %>
                            </option>
                            <%
                                }
                            %>
                            <option value="0">직접입력</option>
                        </select>
                        <input type="text" name="publishername" class="form-control" id="publisher-input-form"
                               readonly/>
                    </div>
                    <div class="form-group">
                        <label>썸네일 이미지</label>
                        <p style="padding:10px;"><img style=" width:100%; height:50%;" alt=""
                                                      src="../resources/images/gameImages/<%=game.getImageFileName() %>">
                        </p>
                        <input type="file" class="form-control" name="image" id="game-image"/>
                    </div>


                    <!-- 구분선 ------------------------------------------------------------------------------------------ -->


                    <div class="form-group">
                        <label>게임 상세 이미지 - 변경/추가/삭제</label>
                        <input class="btn btn-primary btn-xs" type="Button" value="추가" onclick="addForm()">
                        <input class="btn btn-danger btn-xs" type="Button" value="삭제" onclick="delForm()">
                        <%
                            int imageNumber = 0;
                        %>

                        <div id="image-box">
                            <%
                                GameImageDao gameImageDao = GameImageDao.getInstance();
                                List<GameImage> gameImages = gameImageDao.getGameImagesByGameNo(gameNo);
                                int count = 1;
                                Iterator<GameImage> gi = gameImages.iterator();
                                while (gi.hasNext()) {
                                    GameImage image = gi.next();
                                    imageNumber++;
                            %>
                            <div id="image-item-<%=imageNumber %>">
                                <p style="padding:10px;">
                                    <input class="form-control hidden" name="imageno<%=imageNumber %>"
                                           value="<%=image.getNo() %>">
                                    <img style=" width:100%; height:50%;" alt=""
                                         src="../resources/images/gameImages/<%=image.getImage() %>">
                                </p>
                                <input type="file" class="form-control" name="detailImage<%=imageNumber %>"
                                       style="margin-bottom: 15px; margin-top: -15px;"/>
                            </div>
                            <%
                                }
                            %>

                        </div>
                        <input class="hidden" type="number" id="image-count" name="imagecount"
                               value="<%=imageNumber %>">

                        <!-- 구분선 ------------------------------------------------------------------------------------------ -->
                    </div>
                    <div class="form-group">
                        <label>게임 소개</label>
                        <textarea class="form-control" style="width: 100%; min-height:300px; resize: none; border: 1;"
                                  name="intro" id="game-intro"><%=game.getIntro() %></textarea>
                    </div>
                    <div class="form-group">
                        <label>시스템 요구 사항</label>
                        <textarea class="form-control" style="width: 100%; min-height:300px; resize: none; border: 1;"
                                  name="requirement" id="game-requirement"><%=game.getRequire() %></textarea>
                    </div>


                    <div class="text-right">
                        <button onclick="checkFormField()" type="button" class="btn btn-primary">게임 수정</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">

    var count = document.getElementById("image-count").value;

    function addForm() {
        count++;
        var imageBox = document.getElementById("image-box");

        var div = document.createElement("div");
        div.setAttribute("id", "image-item-" + count);

        var imageno = document.createElement('input');
        imageno.setAttribute("class", "form-control hidden");
        imageno.setAttribute("name", "imageno" + count);
        imageno.setAttribute("value", 0);

        div.appendChild(imageno);
        imageBox.appendChild(div);

        var input = document.createElement('input');
        input.setAttribute("type", "file");
        input.setAttribute("class", "form-control");
        input.setAttribute("name", "detailImage" + count);
        input.style.marginBottom = "10px"

        div.appendChild(input);
        imageBox.appendChild(div);

        document.getElementById("image-count").value = count;
    }

    function delForm() {

        var imageBox = document.getElementById("image-box");
        var inputSize = document.querySelectorAll("#image-box div[id^='image-item']").length;
        if (inputSize > 1) {
            var lastInput = document.querySelector('#image-box div:last-child');
            imageBox.removeChild(lastInput);
            count--;
            document.getElementById("image-count").value = count;
        } else {
            alert("최소 하나 이상의 상세이미지를 등록해야 합니다.");
        }
    }


    // 퍼블리셔 선택시 실행될 함수
    function changePublisher() {
        // 퍼블리셔 이름 선택 시 선택된 값을 조회한다.
        var selectedValue = document.querySelector("#pub-select").value;
        // 조회된 값이 custom이면 readonly 속성을 해제한다.
        if (selectedValue == "0") {
            document.querySelector("#publisher-input-form").readOnly = false;
            // 조회된 값이 custom이 아니면 readonly 속성을 부여한다.
        } else {
            document.querySelector("#publisher-input-form").readOnly = true;
        }
    }

    // 입력 폼 값 비어있는지 확인하기
    function checkFormField() {
        //게임명 공란 확인
        var title = document.querySelector("#game-title").value;
        if (title == "") {
            alert("게임명을 입력하세요");
            return;
        }
        //게임가격 공란 확인
        var price = document.querySelector("#game-price").value;
        if (price == "") {
            alert("게임 가격을 입력하세요");
            return;
        }
        //할인가격 공란 확인
        var discountPrice = document.querySelector("#game-discountPrice").value;
        if (discountPrice == "") {
            alert("할인 가격을 입력하세요");
            return;
        }
        //출시일 미선택 확인
        var createDate = document.querySelector("#game-createDate").value;
        if (createDate == "") {
            alert("출시일을 선택하세요");
            return;
        }
        //게임 장르가 직접 선택 이면서 공란일 때
        var publisher = document.querySelector("#pub-select").value;
        var inputform = document.querySelector("#publisher-input-form").value;
        if (publisher == "custom" && inputform == "") {
            alert("게임 장르를 입력하세요");
            return;
        }
        //게임 소개글 공란 확인
        var intro = document.querySelector("#game-intro").value;
        if (intro == "") {
            alert("소개글을 입력하세요");
            return;
        }
        //게임 요구사항 공란 확인
        var requirement = document.querySelector("#game-requirement").value;
        if (requirement == "") {
            alert("요구사항을 입력하세요");
            return;
        }

        document.querySelector("#edit-form").submit();

    }

    //입력필드에 숫자만 입력가능하도록
    function numberOnly() {
        if (event.keyCode < 48 || event.keyCode > 57) {
            event.returnValue = false;
        }
    }

    function adminList(event) {
        event.preventDefault();
        var value = document.getElementById("admin-list").getAttribute("class");
        if (value == "admin-off") {
            document.getElementById("admin-list").setAttribute("class", "admin-on");
        } else {
            document.getElementById("admin-list").setAttribute("class", "admin-off");
        }
    }


    function gamelist(event) {
        event.preventDefault();
        var value = document.getElementById("game-list").getAttribute("class");
        if (value == "game-off") {
            document.getElementById("game-list").setAttribute("class", "game-on");
        } else {
            document.getElementById("game-list").setAttribute("class", "game-off");
        }
    }

</script>
</html>
