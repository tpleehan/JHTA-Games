<%@page import="java.util.Enumeration" %>
<%@page import="com.semi4.vo.GameImage" %>
<%@page import="com.semi4.dao.GameImageDao" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.semi4.dao.PublisherDao" %>
<%@page import="com.semi4.utils.DateUtil" %>
<%@page import="com.semi4.vo.Publisher" %>
<%@page import="com.semi4.vo.Genre" %>
<%@page import="com.semi4.dao.GameDao" %>
<%@page import="com.semi4.vo.Game" %>
<%@page import="java.util.Date" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");

    //multipart/form-data 요청 처리하기
    //워크스페이스 본인 워크스페이스로 입력할 것
    // new DefaultFileRenamePolicy() 를 사용해주면 파일 이름이 중복될 경우, 자동으로 번호를 부여해서 중복을 방지해 준다.
    MultipartRequest multipartRequest
            = new MultipartRequest(request,
            "C:\\projects\\semi_workspace\\semi-4\\WebContent\\resources\\images\\gameImages",
            1024 * 1024 * 10,
            "utf-8", new DefaultFileRenamePolicy());
    // 타이틀, 가격, 할인가격, 출시일, 장르, 퍼블리셔, 사진이름, 소개글, 시스템요구사항 을 전달받은 폼에서 가져오기
    String title = multipartRequest.getParameter("title");
    // 입력받은 타이틀명과 같은 타이틀의 게임이 등록되어 있는지 확인
    GameDao gameDao = GameDao.getInstance();
    Game foundGame = gameDao.getGameByTitle(title);
    if (foundGame != null) {
        // DB에 같은 타이틀의 게임이 존재 시, 등록폼으로 다시 보낸다.
        response.sendRedirect("adminGameRegisterForm.jsp?result=sameTitle");
        return;
    }

    // 새로 등록할 게임의 시퀀스 번호 조회하고 등록할 game 객체에 set 하기
    int newGameNo = gameDao.getNewGameNo();
    Game game = new Game();
    game.setNo(newGameNo);

    int price = Integer.parseInt(multipartRequest.getParameter("price"));
    int discountPrice = Integer.parseInt(multipartRequest.getParameter("discountPrice"));
    String dateString = multipartRequest.getParameter("createDate");
    Date date = DateUtil.stringToDate(dateString);
    int genreNo = Integer.parseInt(multipartRequest.getParameter("genreno"));

    // 퍼블리셔 직접 입력 시 입력받은 퍼블리셔 번호, 이름으로 퍼블리셔 DB 생성하기
    int publisherNo = Integer.parseInt(multipartRequest.getParameter("publisherno"));
    if (publisherNo == 0) {
        String publisherName = multipartRequest.getParameter("publishername");
        PublisherDao publisherDao = PublisherDao.getInstance();
        publisherNo = publisherDao.getPublisherSeqNo();
        Publisher publisher = new Publisher();
        publisher.setNo(publisherNo);
        publisher.setName(publisherName);
        publisherDao.insertNewPublisher(publisher);
    }

    // 등록한 사진이 없으면 no_image.jpg 파일로 등록되게 하기
    String filename = multipartRequest.getFilesystemName("image");
    if (filename == null) {
        filename = "no_image.jpg";
    }

    String intro = multipartRequest.getParameter("intro");
    String requirement = multipartRequest.getParameter("requirement");

    game.setTitle(title);
    game.setPrice(price);
    game.setDiscountPrice(discountPrice);
    game.setCreateDate(date);

    Genre genreObject = new Genre();
    genreObject.setNo(genreNo);
    game.setGenre(genreObject);

    Publisher publisherObject = new Publisher();
    publisherObject.setNo(publisherNo);
    game.setPublisher(publisherObject);

    game.setImageFileName(filename);
    game.setIntro(intro);
    game.setRequire(requirement);

    gameDao.insertNewGame(game);

    // GameImage 객체 만들어서 파일 담기
    GameImageDao gameImageDao = GameImageDao.getInstance();
    GameImage gameImage = new GameImage();
    gameImage.setGame(game);

    int count = Integer.parseInt(multipartRequest.getParameter("count"));
    //MultipartRequest 객체에서 상세이미지 정보 받아오기
    for (int i = 0; i < count; i++) {
        String imageFile = multipartRequest.getFilesystemName("detailImage" + i);
        // 선택된 이미지 파일이 없을 경우 "no_image.jpg"로 설정
        if (imageFile == null) {
            imageFile = "no_image.jpg";
        }
        gameImage.setImage(imageFile);
        gameImageDao.insertGameImage(gameImage);
    }

    response.sendRedirect("adminGameRegisterForm.jsp?result=success");
%>
