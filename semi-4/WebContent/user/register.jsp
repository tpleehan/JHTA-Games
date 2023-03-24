<%@page import="com.semi4.dao.UserDao"%>
<%@page import="com.semi4.vo.User"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	String name = request.getParameter("username");
	String tel1 = request.getParameter("usertel1");
	String tel2 = request.getParameter("usertel2");
	String tel3 = request.getParameter("usertel3");
	String tel = tel1+"-"+tel2+"-"+tel3;	
	String email1 = request.getParameter("useremail");
	String email2 = request.getParameter("useremail2");
	String email = email1+"@"+email2;
	
	//System.out.println("이름: " + name);
	//System.out.println("아이디: " + id);
	//System.out.println("비밀번호: " + password);
	//System.out.println("이메일: " + email);

	// 회원가입 하는 유저 DB에 저장
	User user = new User();
	user.setId(id);
	user.setPassword(password);
	user.setName(name);
	user.setTel(tel);
	user.setEmail(email);
	
	// 싱글톤방식으로 생성된 UserDao객체 획득
	UserDao userDao = UserDao.getInstance();
	
	User prevUser = userDao.getUserById(user.getId());
	if (prevUser != null) {
		response.sendRedirect("registerform.jsp?fail=dup");
		return;
	} 
	
	userDao.insertUser(user);
	response.sendRedirect("registercompletedform.jsp");
%>