<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="secondhand.FavListDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String userId = (String)session.getAttribute("sid");
	if(userId == null){
%>		
		<script>
			alert("로그인 후 이용해주세요.");
			window.location="../user/loginForm.jsp";
		</script>
<%
	}
	UserDAO userDao = UserDAO.getInstance();
	UserDTO userDto = userDao.getUserInfo(userId);
	
	int itemNum = Integer.parseInt(request.getParameter("itemNum"));
	int idx = userDto.getIdx();
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	FavListDAO dao = FavListDAO.getInstance();
	
	int result = dao.addFav(itemNum, idx, name, price);
%>
<title>찜 목록에 추가중</title>
</head>
<body>
<%	if(result == 1) {%>
		<h2 align="center">상품이 찜 목록에 등록되었습니다.</h2>	<br />
		<button onclick="self.close()">확인</button>
<%	} else if(result == 2) {%>
		<h2>이미 찜 목록에 존재합니다.</h2>
		<button onclick="self.close()">닫기</button>
<%	} else { %>
		<h2>오류 발생! 다시 시도해주세요.</h2>
		<button onclick="self.close()">닫기</button>
<%	} %>
</body>
</html>