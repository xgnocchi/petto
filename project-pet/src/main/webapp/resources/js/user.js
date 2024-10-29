{
	
	function checkId(){
		let id = document.getElementById("user_id").value;
		open("confirmId.jsp?user_id="+id, 'confirm','width=400,hieght=400');
	}
	function userCheck (){
		var userInput = document.userInput;
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
					/*전화번호 양식 유효성검사*/
					if(!userInput.gender.value){
						alert("성별을 선택해주세요.")
						return false;
					}
	}
	
	
}