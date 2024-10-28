function writeCheck() {
	var input = document.userInput;
	if (!input.itemName.value) {
		alert("상품명을 입력해주세요.");
		return false;
	}
	if (!input.content.value) {
		alert("상세 내용을 입력해주세요.");
		return false;
	}
}
