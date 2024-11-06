{
	//회원가입 폼 전체 유효성 체크
	function formCheck(form) {
	    // 필수 입력 항목 확인
	    if (!form.userId.value) {
	        alert("아이디를 입력해주세요.");
	        return false;
	    }
	    if (!form.userPw.value) {
	        alert("비밀번호를 입력해주세요.");
	        return false;
	    }
	    if (!form.email.value) {
	        alert("이메일을 입력해주세요.");
	        return false;
	    }
	    
	    // 모든 필드가 채워져 있고 유효하다면 true 반환
	    return true;
	}
	
	//회원정보수정 폼 전체 유효성 체크
	function formUpdateCheck(form) {
	    // 필수 입력 항목 확인
	    if (!form.email.value) {
	        alert("이메일을 입력해주세요.");
	        return false;
	    }
	    if (!form.userNick.value) {
	        alert("닉네임을 입력해주세요.");
	        return false;
	    }
	    
	    // 모든 필드가 채워져 있고 유효하다면 true 반환
	    return true;
	}

	
	
	let isIdChecked=false; //아이디 중복 검사 여부
	let isIdAvailable=false; //아이디 사용 가능 여부
	
	//아이디 중복 검사 함수
	function userCheck (){		
		let userInput = document.forms["userInput"];
		const userId = document.getElementById("userId").value; //입력된 아이디 값
		const idResult = document.getElementById("idResult");
		if(userId){
			//유효성검사
			if(userId.length < 4 || userId.length > 12){
				idResult.innerHTML = "<font color='red'>아이디는 4~12글자의 문자이어야 합니다.</font>";
				isIdChecked = false;
				return;	
			}else if(!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/.test(userId)){
				idResult.innerHTML = "<font color='red'>아이디는 영어와 숫자를 포함해야 합니다.</font>";
				isIdChecked = false;
				return;
			}else {
			   // 유효성 검사를 통과한 경우, 결과 메시지를 초기화
			  idResult.innerHTML = ""; // 초기화
			}
			//서버에 요청		
			fetch(`checkUserId.jsp?userId=${userId}`)
				.then(response=>response.text())
				.then(data=>{
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
	
	
	
	//문자, 숫자, 특수문자를 포함한 8자 이상 비밀번호 입력받기
	function pwCheck(userPw) {
	    const pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	    const pwResult = document.getElementById("pwMessage");
	    if (pwPattern.test(userPw)) {
			pwResult.innerHTML = "";
			return true;
	    } else {
	        pwResult.innerHTML = "<font color='red'>8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요.</font>";
	        return false;
	    }
	}
	
	// 이메일 유효성 검사 함수
	function emailCheck() {
	    const email = document.getElementById("email").value;
	    const emailMessage = document.getElementById("emailMessage");
		if(!email){
			emailMessage.innerHTML = "<font color='red'>이메일을 입력해주세요.</font>";
			return false;
		}
		
	    if (/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/.test(email)) {
			return true;
	    } else {
	        emailMessage.innerHTML = "<font color='red'>올바른 이메일 형식을 입력해주세요.</font>";
			return false;
		}
	}
	
	
	
	//폼 제출 시 실행
	function submitForm() {
		console.log("submitForm called");
	    let userInput = document.forms["userInput"];
		
		if (!isIdChecked || !isIdAvailable) {
		    document.getElementById("idResult").innerHTML = "<font color='red'>아이디 중복 검사를 완료해주세요.</font>";
		    return false;
		}
		
		// 이메일 유효성 검사
			if(!emailCheck()){
				return false;
			}

		const userPw = userInput.userPw.value;
		const userPw2 = userInput.userPw2.value;
		// 비밀번호 일치 여부 확인
		if (userPw !== userPw2) {
		    document.getElementById("pwMessage").innerHTML = "<font color='red'>비밀번호가 일치하지 않습니다.</font>";
		    return false;
		}
		// 비밀번호 유효성 검사 
		if (!pwCheck(userPw)) { // pwCheck 함수 호출
		    return false; // 비밀번호가 유효하지 않으면 폼 제출 중지
		}
		
		// 전체 유효성 검사
		if (!formCheck(userInput)) {
		    return false; // 유효성 검사 실패 시 더 이상 진행하지 않음
		}
		
		userInput.submit(); // 모든 유효성 검사를 통과하면 폼 제출
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
	}//isCheck
	
	// 마이페이지 - 회원정보 수정 - 내가 선택한 이미지 파일 바로 보기
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
	}//previewImage
	
	
	
	/* 회원정보 수정 */
	let isNickChecked = false; // 닉네임 중복 검사 여부
	let isNickAvailable = false; // 닉네임 사용 가능 여부
	// 닉네임 유효성 검사
	function nickCheck() {
	 return new Promise((resolve) => { // Promise를 반환
	      console.log("닉네임 유효성 검사 시작");
	      const nickname = document.getElementById("nick").value;
	      const nickMessage = document.getElementById("nickMessage");
		  console.log(nickname);
	      if (!nickname) {
	          nickMessage.innerHTML = "<font color='red'>닉네임을 입력해주세요.</font>";
	          resolve(false);
			  return;
	      }
		  
		  fetch(`checkNickname.jsp?userNick=${nickname}`)
		          .then(response => response.text())
		          .then(data => {
		              if (data.trim() === "available") {
						console.log("닉네임 사용 가능")
						  isNickAvailable=true; //사용 가능
						  resolve(true);
		              } else {
		                  nickMessage.innerHTML = "<font color='red'>이미 사용 중인 닉네임입니다.</font>";
						  isNickAvailable=false; //사용 불가
						  resolve(false);
		              }
					  isNickChecked = true; //검사 완료
		          })
		          .catch(error => {
		              console.error("Error:", error);
		              nickMessage.innerHTML = "<font color='red'>오류가 발생했습니다. 다시 시도해주세요.</font>";
					  isNickChecked = false;//오류 발생
					  resolve(false);
		          });
				  
	  });
			return false;
	}
	
	function submitUpdateForm() {
		      console.log("submitUpdateForm called");
		      let userInput = document.forms["userInput"];

		      // 이메일 유효성 검사
		      if (!emailCheck()) {
		          return false; // 이메일 검사가 실패하면 폼 제출 중지
		      }
			  
			  // 닉네임 유효성 검사
			  const isValid = nickCheck(); // nickCheck를 호출하고 결과를 기다림
			  console.log("닉네임 유효성 검사 결과:", isValid); // 결과 로그 추가

			  if (!isValid) {
			      return false; // 닉네임이 유효하지 않으면 폼 제출 중지
			  }
		       userInput.submit(); // 모든 검사를 통과한 경우 폼 제출				
		  }
	
}