<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <script type="text/javascript" src="../resources/js/user.js"></script> -->
    
    <title>회원가입</title>
</head>
<body>
	<script>
		function checkId(){
			let id = document.getElementById("id").value; // 사용자가 입력한 값
			open("confirmId.jsp?id="+id, 'confirm','width=400,hieght=400');
			//주소가되는 부분 뒤의 ?는 뒤에 파라미터 값이 옴
			//창을 열면서 파라미터로 입력받은 아이디 값을 보냄, 창의 이름은 confirm
		}
		
		function memCheck(){
			var userInput = document.userInput;
			if( !userInput.id.value){
				alert("아이디를 입력해주세요");
				return false;			
			}

			if(!userInput.pw.value){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if(userInput.pw.value != userInput.pw2.value){
				alert("입력하신 비밀번호와 같은 비밀번호를 입력해주세요.");
				return false;
			}
			if(!userInput.name.value){
				alert("이름을 입력해주세요.")
				return false;
			}
			if(!userInput.birth.value){
				alert("생일을 입력해주세요.")
				return false;
			}
			if(userInput.phone1.value == "none"){
				alert("통신사를 선택해주세요.")
				return false;
			}
			if(!userInput.phone2.value){
				alert("전화번호를 입력해주세요.")
				return false;
			}
			if(!userInput.gender.value){
				alert("성별을 선택해주세요.")
				return false;
			}
			
		}
		
	</script>
<%
		String user_id = request.getParameter("user_id");
		UserDTO dto = new UserDTO();
		UserDAO dao = UserDAO.getInstance();
	
	 	if(user_id!=null){
		dto.setUserId(user_id);
	}

/* 		boolean isResult = dao.confirmId(dto.getUserId());
		if(isResult){
			out.print("<span style='color: green;'>사용 가능한 아이디입니다.</span>");
		}	else {
	        out.print("<span style='color: red;'>이미 사용 중인 아이디입니다.</span>");
	    } */
	// 아이디 중복 확인 메서드
	
%>
    	<form action="insertPro.jsp" method="post" name="userInput" onsubmit="return userCheck()">
		id : 	<input type="text" name="userId" id="user_id"/> <br/>
				<input type="button" value="중복확인" onclick="checkId()"/> <br/>
				<div id="idResult"></div>
		pw : 	<input type="password" name="userPw"/> <br/>
		pw 확인 : <input type="password" name="userPw"/> <br/>
		닉네임 : <input type="text" name="userNick"/> <br/>
<!--	이름 : 	<input type="text" name="user_name"/> <br/>
 	
		이메일 :<input type="email" name="email"/>
		생일 :	<input type="date" name="birth"/> <br/>
		통신사 : 	<select name="phone1">
					<option value="none">선택</option>
					<option value="KT">KT</option>
					<option value="SKT">SKT</option>
					<option value="Uplus">U+</option>
					<option value="알뜰폰">알뜰폰</option>					
				</select> <br/>
		전화번호:	<input type="text" name="phone2" placeholder="01012345678 형식"/> <br/>
		성별 : 	<input type="radio" name="gender" value="m"/>남
				<input type="radio" name="gender" value="w"/>여 <br/> -->
				<button type="submit">가입하기</button>		
		</form>
<%
		
%>		

</body>
</html>
