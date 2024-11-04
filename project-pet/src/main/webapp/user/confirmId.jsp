<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO" %>
<%@page import="user.UserDTO" %>

<%
		UserDTO dto = new UserDTO();
		UserDAO dao = UserDAO.getInstance();
		boolean result = dao.confirmId(dto.getUserId());
		if(result==true){
	%>
	<script>
		opener.document.getElementById("idResult").innerHTML="<font color='pink'>사용 불가능한 아이디 입니다.</font>";
		self.close();
	</script>
	<% }else{ %>
	<script>
		opener.document.getElementById("idResult").innerHTML="<font color='skyblue'>사용 가능한 아이디 입니다.</font>";
		self.close();
	</script>
	<%} %>