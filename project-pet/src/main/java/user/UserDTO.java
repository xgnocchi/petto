package user;

import java.sql.Timestamp;

public class UserDTO { //회원정보 
	private int idx;		
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String email;
	private String phone;
	private String phone_agency;
	private Timestamp birth;
	private String gender;
	private String profile_img;
	private Timestamp join_date;
	private Timestamp last_date;
	private String status;
	


public void setIdx(int idx) {
	this.idx = idx;
}
public int getIdx() {
	return idx;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getUser_id() {
	return user_id;
}

public void setUser_pw(String user_pw) {
	this.user_pw=user_pw;
}
public String getUser_pw() {
	return user_pw;
}

public void setEmail(String email) {
	this.email=email;
}
public String getEmail_pw() {
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

}//UserDTO
