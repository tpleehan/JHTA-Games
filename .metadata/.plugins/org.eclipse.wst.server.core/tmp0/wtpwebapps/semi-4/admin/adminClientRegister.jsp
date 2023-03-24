<%@page import="java.util.List"%>
<%@page import="com.semi4.vo.Admin"%>
<%@page import="com.semi4.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	// 전달받은 값들 받아오기
	String id = request.getParameter("adminid");
	String password = request.getParameter("adminpwd");
	String name = request.getParameter("adminname");
	String grade = request.getParameter("admingrade");

	// 전달 받은 아이디는 Primary key 이므로 중복체크해서 존재 시 등록폼으로 돌려보내기
	AdminDao adminDao = AdminDao.getInstance();
	List<Admin> allAdmins = adminDao.getAllAdmins();
	for(Admin ad : allAdmins) {
		if(ad.getId().equals(id)) {
			response.sendRedirect("adminClientRegisterForm.jsp?result=samename");
			return;
		}
	}
	
	// 관리자 객체에 전달받은 값 넣기
	Admin newAdmin = new Admin();
	newAdmin.setId(id);
	newAdmin.setPassword(password);
	newAdmin.setName(name);
	newAdmin.setGrade(grade);
	
	// 완성된 객체로 관리자 객체 생성하기
	adminDao.insertAdmin(newAdmin);
	
	response.sendRedirect("adminClientRegisterForm.jsp?result=success");
	
	
%>