<%@page import="com.semi4.vo.GameImage" %>
<%@page import="com.semi4.dao.GameImageDao" %>
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
                <%
                    request.getParameter("utf-8");
                    String result = request.getParameter("result");

                    if ("pwderror".equals(result)) {
                %>
                <div class="row">
                    <div class="col-xs-12 text-center">
                        <div class="alert alert-danger">
                            <strong>게임 삭제 실패</strong>
                            <p>관리자 비밀번호가 일치하지 않습니다.</p>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>

                <h3 class="text-center" style="font-weight: bold;">등록된 게임정보 삭제</h3><br><br>
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
                <form class="well" method="post" id="edit-form" action="adminDeleteGame.jsp">
                    <div class="form-group">
                        <input type="hidden" class="form-control" name="gameno" value="<%=game.getNo() %>"/>
                    </div>
                    <div class="form-group">
                        <label>게임 제목</label>
                        <input type="text" class="form-control" name="title" id="game-title"
                               value="<%=game.getTitle() %>" readOnly/>
                    </div>
                    <div class="form-group">
                        <label>가격</label>
                        <input type="text" class="form-control" name="price" id="game-price"
                               value="<%=game.getPrice() %>" readOnly/>
                    </div>
                    <div class="form-group">
                        <label>할인가격</label>
                        <input type="text" class="form-control" name="discountPrice" id="game-discountPrice"
                               value="<%=game.getDiscountPrice() %>" readOnly/>
                    </div>
                    <div class="form-group">
                        <label>출시일</label>
                        <input type="date" class="form-control" name="createDate" id="game-createDate"
                               value="<%=date %>" readOnly/>
                    </div>
                    <div class="form-group">
                        <label>장르</label>
                        <%
                            GenreDao genreDao = GenreDao.getInstance();
                            int genreNo = game.getGenre().getNo();
                            Genre genre = genreDao.getGenreByGenreNo(genreNo);
                        %>
                        <input type="text" class="form-control" name="genre" value="<%=genre.getName() %>" readOnly/>


                    </div>
                    <div class="form-group">
                        <label>퍼블리셔</label>
                        <%
                            PublisherDao publisherDao = PublisherDao.getInstance();
                            int publisherNo = game.getPublisher().getNo();
                            Publisher publisher = publisherDao.getPublisherByNo(publisherNo);
                        %>
                        <input type="text" class="form-control" name="publisher" value="<%=publisher.getName() %>"
                               readOnly/>
                    </div>
                    <div class="form-group">
                        <label>썸네일 이미지</label>
                        <p style="padding:10px;"><img style=" width:100%; height:50%;" alt=""
                                                      src="../resources/images/gameImages/<%=game.getImageFileName() %>">
                        </p>
                    </div>
                    <div class="form-group">
                        <label>게임 상세 이미지</label>

                        <%
                            GameImageDao gameImageDao = GameImageDao.getInstance();
                            List<GameImage> gameImages = gameImageDao.getGameImagesByGameNo(gameNo);
                            int count = 1;
                            for (GameImage image : gameImages) {
                        %>
                        <p style="padding:10px;"><img style=" width:100%; height:50%;" alt=""
                                                      src="../resources/images/gameImages/<%=image.getImage() %>"></p>

                        <%
                            }
                        %>
                    </div>
                    <div class="form-group">
                        <label>게임 소개</label>
                        <textarea class="form-control" rows="8" name="intro" id="game-intro"
                                  readOnly><%=game.getIntro() %></textarea>
                    </div>
                    <div class="form-group">
                        <label>시스템 요구 사항</label>
                        <textarea class="form-control" rows="8" name="requirement" id="game-requirement"
                                  readOnly><%=game.getRequire() %></textarea>
                    </div>
                    <div class="form-group">
                        <label class="text text-danger">관리자 비밀번호 입력</label>
                        <input type="password" class="form-control" name="password" id="admin-password">
                    </div>

                    <div class="text-right">
                        <button type="submit" class="btn btn-danger">게임 삭제</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
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
</body>
</html>
