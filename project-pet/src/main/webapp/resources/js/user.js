{

	let isIdChecked=false; //중복 검사 여부
	let isIdAvailable=false; //아이디 사용 가능 여부
	//아이디 중복 검사 함수
	function userCheck (){		
		let userInput = document.forms["userInput"];
		const userId = document.getElementById("userId").value; //입력된 아이디 값
		if(userId){
			fetch(`checkUserId.jsp?userId=${userId}`)
				.then(response=>response.text())
				.then(data=>{
					const idResult = document.getElementById("idResult");
					console.log("Received response:", data); // 응답 데이터 로그
					if(data.trim() ==="available"){
						isIdAvailable = true;
						idResult.innerHTML ="<font color='green'>사용 가능한 아이디 입니다.</font>";
					} else {
						isIdAvailable = false;
						idResult.innerHTML = "<font color='red'>사용 불가능한 아이디 입니다.</font>";
					}
					isIdChecked=true;
				})
				.catch(error=>{
					console.error("Error:",error);
					isIdChecked=false;
				});
		}else{// 아이디 유효성 검사
			formCheck(userInput);
		}
	}//userCheck()
	
	//폼 입력값 유효성 검사
	function formCheck(userInput){
		if (!userInput.userId.value) {
		    alert("아이디를 입력해주세요.");
		    return false;
		}
		
		if (!isIdChecked) { 
		    alert("아이디 중복 검사를 해주세요.");
		    return false;
		}else if(!isIdAvailable){
			alert("사용할 수 없는 아이디 입니다.");
			return false;
		}
		
		if(!userInput.userPw.value){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if(userInput.userPw.value != userInput.userPw2.value){
			alert("입력하신 비밀번호와 같은 비밀번호를 입력해주세요.");
			return false;
		}
		if(!userInput.email.value){
			alert("이메일을 입력해주세요.");
			return false;
		}
		return true;
	}
	
	//폼 제출 시 실행
	function submitForm() {
	    let userInput = document.forms["userInput"];
	    // 전체 유효성 검사
	    if (!formCheck(userInput)) {
	        return false; // 유효성 검사 실패 시 더 이상 진행하지 않음
	    }
	    userInput.submit(); // 폼제출
	}
	
	
	//회원 탈퇴 - 체크박스 체크 여부 확인
	function isCheck(){
		const delCheck = document.getElementById("delCheck");
		const userPw = document.getElementById("userPw").value;
		//체크 박스 선택 되었는지 확인
		if(!delCheck.checked){
			alert("탈퇴 시 유의사항을 확인해주세요.");
			return false;
		}
		//비밀번호 입력 여부 확인
		if(userPw.trim()===""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		console.log("폼 제출 전");
		document.getElementById("delForm").submit();
		return true;
		console.log("요청 처리완료");
	}
	
	function previewImage(event) {
	    const file = event.target.files[0]; // 선택한 파일
	    const preview = document.getElementById('preview'); // 미리보기 이미지 요소

	    if (file) {
	        const reader = new FileReader(); // FileReader 객체 생성
	        reader.onload = function(e) {
	            preview.src = e.target.result; // 읽은 파일을 미리보기 이미지로 설정
	            preview.style.display = 'block'; // 이미지 표시
	        }
	        reader.readAsDataURL(file); // 파일을 Data URL로 읽음
	    } else {
	        preview.src = '../resources/image/profile-image.png'; // 파일이 없을 경우 이미지 초기화
	    }
	}
}