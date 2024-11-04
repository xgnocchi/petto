<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%--ID 중복 체크--%>
	<jsp:useBean id="dto" class="user.UserDTO"/>
	<jsp:setProperty name="dto" property="*"/>
	<%
		String userId = request.getParameter("userId"); //회원가입 폼에 입력한 id 값
		System.out.println("Received userId: " + userId); // 로그 추가
		UserDAO dao = UserDAO.getInstance();
		boolean result = dao.confirmId(userId); //아이디 중복 검사 메서드 호출
		if(result){
			out.print("not available"); //사용 불가능
			 System.out.println("User ID is not available."); // 로그 추가
		}else{
			out.print("available"); //사용 가능
	        System.out.println("User ID is available."); // 로그 추가
		}

	%>