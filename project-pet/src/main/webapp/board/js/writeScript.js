function writeCheck() {
	if( document.writeForm.title.value == '' ) {
		alert("제목을 입력해주세요.");
		return flase;
	}
	if( document.writeForm.content.value == '' ) {
		alert("내용을 입력해주세요.");
		return flase;
	}
	if( document.writeForm.passwd.value == '' ) {
		alert("비밀번호를 입력해주세요.");
		return flase;
	}
}