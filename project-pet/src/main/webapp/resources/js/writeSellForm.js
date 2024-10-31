function loadFile(input) {
	if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  reader.onload = function(e) {
	    document.getElementById('preview').src = e.target.result;
	  };
	  reader.readAsDataURL(input.files[0]);
	} else {
	  document.getElementById('preview').src = "";
	}
}

function writeCheck() {
	var input = document.userInput;
	if (input.name.value == '') {
		alert("상품명을 입력해주세요.");
		return false;
	}
	if (input.content.value == '') {
		alert("상세 내용을 입력해주세요.");
		return false;
	}
	if (input.price.value > 100000000 || input.price.value < 0) {
		alert("상품 금액을 0 ~ 100000000 사이로 입력해 주세요.")
		return false;
	}
	if (input.condition.value == '') {
		alert("상품 상태를 체크해 주세요.");
		return false;
	}
	if (input.isSelling != null && input.isSelling.value == ''){
		alert("판매 상태를 체크해 주세요.")
		return false;
	}
}
