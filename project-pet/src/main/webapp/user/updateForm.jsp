<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--회원정보수정--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>updateForm</title>
</head>
<body>
    <form action="updatePro.jsp" method="post" name="userInput" onsubmit="return upCheck()">
	id: <%--sid --%> <br/>
		<input type="hidden" name="id"/>
	pw 변경: <input type="password" name="pw" value="<%--dto.getPw()--%>"/> <br/>
	pw 변경 확인: <input type="password" name="pw2" value="<%--dto.getPw()--%>"/> <br/>
	name 변경 : <input type="text" name="name" value="<%--dto.getName()--%>"/> <br/>
	birth <%--dto.getBirth()--%> <br/>
	통신사 변경 : <select name="phone1">
				<option><%--dto.getPhone1()--%></option>
				<option value="KT">KT</option>
				<option value="SKT">SKT</option>
				<option value="Uplus">U+</option>
				<option value="알뜰폰">알뜰폰</option>
				
	</select>
	연락처변경: <input type="text" name="phone2" value="<%--dto.getPhone2()--%>"/> <br/>
	gender : <%--dto.getGender() --%><br/>
			<input type="submit" value="정보수정"/>
			<input type="button" onclick="window.location='main.jsp'" value="메인으로"/>
			
</form>
</body>
</html>