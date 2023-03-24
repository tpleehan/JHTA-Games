<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.vo.GameImage"%>
<%@page import="com.semi4.dao.GameImageDao"%>
<%@page import="com.semi4.vo.Genre"%>
<%@page import="com.semi4.vo.Publisher"%>
<%@page import="com.semi4.dao.PublisherDao"%>
<%@page import="com.semi4.utils.DateUtil"%>
<%@page import="java.util.Date"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	//multipart/form-data 요청 처리하기
	//워크스페이스 본인 워크스페이스로 입력할 것
	MultipartRequest multipartRequest 
		= new MultipartRequest(	request,
								"C:\\projects\\semi_workspace\\semi-4\\WebContent\\resources\\images\\gameImages",
								1024*1024*10,
								"utf-8");
	// 번호, 타이틀, 가격, 할인가격, 출시일, 장르, 퍼블리셔, 사진이름, 소개글, 시스템요구사항 을 전달받은 폼에서 가져오기
	int gameNo = Integer.parseInt(multipartRequest.getParameter("gameno"));
	String title = multipartRequest.getParameter("title");
	
	//수정하려는 타이틀명이 다른 번호에 등록되어 있는 경우 수정하지 않음
 	GameDao gameDao = GameDao.getInstance();
	Game game = gameDao.getGameByNo(gameNo);
	Game foundGame = gameDao.getGameByTitle(title);
	if (foundGame != null) {
		if(foundGame.getNo() != gameNo) {
			response.sendRedirect("adminEditGameForm1.jsp?result=sameTitle");
			return;
		}
	}
	
	
	
	int price = Integer.parseInt(multipartRequest.getParameter("price"));
	int discountPrice = Integer.parseInt(multipartRequest.getParameter("discountPrice"));
	String dateString = multipartRequest.getParameter("createDate");
	Date date = DateUtil.stringToDate(dateString);
	int genreNo = Integer.parseInt(multipartRequest.getParameter("genreno"));
	
	// 퍼블리셔 직접 입력 시 입력받은 퍼블리셔 번호, 이름으로 퍼블리셔 DB 생성하기
	int publisherNo = Integer.parseInt(multipartRequest.getParameter("publisherno"));
	if(publisherNo == 0) {
		String publisherName = multipartRequest.getParameter("publishername");
		PublisherDao publisherDao = PublisherDao.getInstance();
		publisherNo = publisherDao.getPublisherSeqNo();
		Publisher newPublisher = new Publisher();
		newPublisher.setNo(publisherNo);
		newPublisher.setName(publisherName);
		publisherDao.insertNewPublisher(newPublisher);
	}

 	// 등록한 사진이 없으면 no_image.jpg 파일로 등록되게 하기
	String filename = multipartRequest.getFilesystemName("image");
	if(filename == null) {
		filename = game.getImageFileName();
	}  
	
	String intro = multipartRequest.getParameter("intro");
	String requirement = multipartRequest.getParameter("requirement");
	
	// 게임 상세 이미지 수정/삭제/추가 하기
	
	// GameImage 객체 만들어서 파일 담기
	GameImageDao gameImageDao = GameImageDao.getInstance();
	GameImage gameImage = new GameImage();
	gameImage.setGame(game);
	
	List<GameImage> images =  gameImageDao.getGameImagesByGameNo(gameNo);
	// 기존에 등록되어 있는 사진 중 수정폼에서 삭제해서 전달되지 않는 사진은 삭제하기
	
	
	int count = Integer.parseInt(multipartRequest.getParameter("imagecount"));
	//MultipartRequest 객체에서 상세이미지 정보 받아오기
	for(int i=1; i<=count; i++) {
		String imageFile = multipartRequest.getFilesystemName("detailImage"+i);
		int imageNo = Integer.parseInt(multipartRequest.getParameter("imageno"+i));
		
		//기존에 등록되어 있는 사진인지 여부 확인
		if (imageNo != 0) {
			GameImage foundImage = gameImageDao.getGameImageByImageNo(imageNo);
			int foundNo = foundImage.getNo();
			// Iterator를 이용해서 DB의 이미지 번호와 일치하는 이미지는 지울 목록에서 제거하기
			// Iterator은 1회용이기 때문에 for문 안에서 선언하여 반복적으로 수행될 수 있도록 한다.
			Iterator<GameImage> it = images.iterator();
			while(it.hasNext()) {
				if(it.next().getNo() == foundNo) {
					it.remove();
				}
			}
			
			// 기존 사진을 유지하는지 변경하는 것인지 여부를 확인
			if(imageFile == null) {
				// 기존 사진을 유지하는 경우 그냥 돌려보낸다.
				imageFile = game.getImageFileName();
				
			}else {
				// 기존 사진을 변경하는 경우 업데이트 한다.
				gameImage.setNo(imageNo);
				gameImage.setImage(imageFile);
				gameImageDao.updateGameImage(gameImage);
			}
		}else {
			// 새로 추가등록하는 사진부분
			// 선택된 이미지 파일이 없을 경우 "no_image.jpg"로 설정
			if(imageFile == null) {
				imageFile = "no_image.jpg";
			}else {
				// 새로운 사진이면서 파일 이름이 있는 경우 새로 등록한다.
				gameImage.setImage(imageFile);
				gameImageDao.insertGameImage(gameImage);
			}
		}
		
	}
	// 수정 폼에서 전달되지 않은 DB에 남아있는 기존 이미지들 삭제하기
	// Iterator를 이용해서 수정폼에서 남길 이미지들은 지울 목록에서 제거하였다.
	for(GameImage image : images) {
		int imageNo = image.getNo();
		gameImageDao.deleteGameImageByImageNo(imageNo);
	}
	
	// 새로운 Game 객체에 수정할 값들을 담은 뒤 update를 실행한다.
	Game editGame = new Game();
	editGame.setNo(gameNo);
	editGame.setTitle(title);
	editGame.setPrice(price);
	editGame.setDiscountPrice(discountPrice);
	editGame.setCreateDate(date);
	
	Genre genreObject = new Genre();
	genreObject.setNo(genreNo);
	editGame.setGenre(genreObject);
	
	Publisher publisherObject = new Publisher();
	publisherObject.setNo(publisherNo);
	editGame.setPublisher(publisherObject);
	
	editGame.setImageFileName(filename);
	editGame.setIntro(intro);
	editGame.setRequire(requirement);
	
	gameDao.updateGame(editGame);
	
	response.sendRedirect("adminEditGameForm1.jsp?result=success");
%>