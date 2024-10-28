package user;

import java.sql.Timestamp;

public class UserDTO { //회원정보 
	private int idx;			//1 회원번호
	private String userId;		//2 유저 아이디
	private String userPw;		//3 유저 비밀번호
	private String userNick;	//4 유저 닉네임
	private String user_name;  	//5 유저 실명이름
	private String email;		//6 이메일
	private String phone;		//7 휴대폰전화
	private String phone_agency;//8 통신사
	private String address; 	//9 주소
	private Timestamp birth;	//10 생일
	private String gender;		//11 성별
	private String profile_img; //12 프로필썸네일
	private Timestamp join_date;//13 가입날짜
	private Timestamp last_date;//14 마지막로그인날짜
	private String status;		//15 회원 탈퇴 여부
	
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

public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getUser_name() {
	return user_name;
}


public void setEmail(String email) {
	this.email=email;
}
public String getEmail() {
	return email;
}

public void setPhone(String phone) {
	this.phone = phone;
}
public String getPhone() {
	return phone;
}

public void setPhone_agency(String phone_agency) {
	this.phone_agency = phone_agency;
}
public String getPhone_agency() {
	return phone_agency;
}

public void setAddress(String address) {
	this.address=address;
}
public String getAddress() {
	return address;
}

public void setBirth(Timestamp birth) {
	this.birth = birth;
}
public Timestamp getBirth() {
	return birth;
}

public void setGender(String gender) {
	this.gender=gender;
}
public String getGender() {
	return gender;
}

public void setProfile_img(String profile_img) {
	this.profile_img=profile_img;
}
public String getProfile_img() {
	return profile_img;
}

public void setJoin_date(Timestamp join_date) {
	this.join_date =join_date;
}
public Timestamp getJoin_date() {
	return join_date;
}

public void setLast_date(Timestamp last_date) {
	this.last_date=last_date;
}
public Timestamp getLast_date() {
	return last_date;
}

public void setStatus(String status) {
	this.status=status;
}
public String getStatus() {
	return status;
}

}//UserDTO
