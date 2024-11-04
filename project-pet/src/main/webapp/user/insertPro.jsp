<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="user.UserDAO"%>
<%--@page import="user.UserDTO" --%>
<jsp:useBean id="dto" class="user.UserDTO"/>
<jsp:setProperty name="dto" property="*"/> 
<%
		UserDAO dao = UserDAO.getInstance();
		dao.insertUser(dto);
%>
		
	<script>
	 	alert("가입 되었습니다.");
		window.location="main.jsp";
	</script>
