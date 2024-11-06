package user;

import java.sql.Timestamp;

public class UserDTO { //회원정보 
	private int idx;			//0 회원번호
	private String userId;		//1 유저 아이디
	private String userPw;		//2 유저 비밀번호
	private String userNick;	//3 유저 닉네임 <-나중에 기본값으로 설정
	private String email;		//4 이메일
	private Timestamp signInDate; //5 가입일자
	private String profileImg; //6 프로필 이미지 값
	
public void setIdx(int idx) {
	this.idx = idx;
}
public int getIdx() {
	return idx;
}

public void setUserId(String userId) {
	this.userId = userId;
}
public String getUserId() {
	return userId;
}

public void setUserPw(String userPw) {
	this.userPw=userPw;
}
public String getUserPw() {
	return userPw;
}

public void setUserNick(String userNick) {
	this.userNick = userNick;
}
public String getUserNick() {
	return userNick;
}

public void setEmail(String email) {
	this.email=email;
}
public String getEmail() {
	return email;
}

public void setSignInDate(Timestamp signInDate) {
	this.signInDate=signInDate;
}
public Timestamp getsignInDate() {
	return signInDate;
}

public void setProfileImg(String profileImg) {
	this.profileImg=profileImg;
}
public String getProfileImg() {
	return profileImg;
}
}//UserDTO
