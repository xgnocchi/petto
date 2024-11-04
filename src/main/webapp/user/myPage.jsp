<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="dto" class="user.UserDTO"/>
<jsp:setProperty name="dto" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String sid = (String)session.getAttribute("sid");
		UserDAO dao = UserDAO.getInstance();
		dto = dao.userInfo(sid);
		
		//로그인페이지로 리다이렉트
		if(sid==null){
			response.sendRedirect("loginForm.jsp");
			return;
		}
	%>
	<h3> <%=dto.getUserNick() %> 님의 마이페이지</h3>
	<img alt="기본 프로필 이미지" src="../resources/image/<%=dto.getProfileImg() %>" width="100" heigth="100"/>
	<p>가입일자 : <fmt:formatDate value="<%=dto.getsignInDate() %>" pattern="yyyy-MM-dd"/> </p>
	<span><b><%=dto.getUserNick() %></b>님</span>
	<span>(<%=sid %>)</span> <br/>
	<button onclick="window.location='updateInfoForm.jsp'">회원정보수정</button>
	<a href='logout.jsp'>로그아웃</a>
	<ul>
		<li>전체</li>
		<li>커뮤니티</li>
		<li>댓글</li>
		<li>찜목록</li>
		<li>판매글</li>
	</ul>
	<div>
	
	</div>
</body>
</html>