<%@page import="com.semi4.dao.UserDao"%>
<%@page import="com.semi4.vo.User"%>
<%@page import="com.semi4.vo.Admin"%>
<%@page import="com.semi4.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	// 관리자 아이디, 비밀번호 받아오기
	String adminId = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	// 관리자 아이디로 관리자 정보 가져오기
	AdminDao adminDao = AdminDao.getInstance();
	Admin admin = adminDao.getAdminById(adminId);
	
	// 네비게이션 바에서 사용할 유저객체로 admin 집어넣기
	UserDao userDao = UserDao.getInstance();
	User adminUser = new User();
	adminUser.setNo(1);
	adminUser.setId(adminId);
	adminUser.setPassword(password);
	adminUser.setName("관리자");
	adminUser.setEmail(adminId+"@gamil.com");
	adminUser.setTel("관리자연락처");
	
	//입력한 아이디로 찾아진 관리자가 없을때
	if(admin == null) {
		response.sendRedirect("../loginform.jsp?fail=invalid");
		return;
	}
	//입력한 비밀번호와 관리자 비밀번호가 일치하지 않을 때
	if(!admin.getPassword().equals(password)) {
		response.sendRedirect("../loginform.jsp?fail=invalid");
		return;
	}
	
	// 세션에 관리자 정보 저장   <--- 서버가 클라이언트의 정보를 보관하게 함
	session.setAttribute("LOGINED_ADMIN", admin);
	session.setAttribute("LOGINED_USER", adminUser);
	// 관리자 페이지로 이동
	response.sendRedirect("adminMain.jsp");

	
%>