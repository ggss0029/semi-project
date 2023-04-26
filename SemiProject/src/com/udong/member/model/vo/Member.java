package com.udong.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo; //USER_NO	NUMBER
	private String userId; //USER_ID	VARCHAR2(30 BYTE)
	private String userPwd; //USER_PWD	VARCHAR2(100 BYTE)
	private String userName; //USER_NAME	VARCHAR2(15 BYTE)
	private String nickname; //NICKNAME	VARCHAR2(40 BYTE)
	private String birthday; //BIRTHDAY VARCHAR2(10 BYTE)
	private String gender; // GENDER VARCHAR2(3 BYTE)
	private String introduction; //INTRODUCTION VARCHAR2 (400 BYTE)
	private String email; //EMAIL	VARCHAR2(100 BYTE)
	private String address; //ADDRESS	VARCHAR2(400 BYTE)
	private Date enrollDate; //ENROLL_DATE	DATE
	private String status; //STATUS	VARCHAR2(1 BYTE)
	private String admin; //ADMIN	VARCHAR2(1 BYTE)
	private int userReport; //USER_REPORT	NUMBER
	private int loginType; //LOGIN_TYPE	NUMBER
	
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Member() {
		super();
	}
	
	public Member(int userNo, String nickname, String address, Date enrollDate) {
		super();
		this.userNo = userNo;
		this.nickname = nickname;
		this.address = address;
		this.enrollDate = enrollDate;
	}

	public Member(String userId, String userName, String nickname, String birthday, String gender, String introduction,
			String email, String address) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.nickname = nickname;
		this.birthday = birthday;
		this.gender = gender;
		this.introduction = introduction;
		this.email = email;
		this.address = address;
	}

	public Member(String userId, String userPwd, String userName, String nickname, String birthday, String gender,
			String email, String address, int loginType) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.birthday = birthday;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.loginType = loginType;
	}

	

	public Member(int userNo, String userId, String userPwd, String userName, String nickname, String birthday,
			String gender, String introduction, String email, String address, Date enrollDate, String status,
			String admin, int userReport, int loginType) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.birthday = birthday;
		this.gender = gender;
		this.introduction = introduction;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
		this.status = status;
		this.admin = admin;
		this.userReport = userReport;
		this.loginType = loginType;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public int getUserReport() {
		return userReport;
	}

	public void setUserReport(int userReport) {
		this.userReport = userReport;
	}

	public int getLoginType() {
		return loginType;
	}

	public void setLoginType(int loginType) {
		this.loginType = loginType;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", nickname=" + nickname + ", birthday=" + birthday + ", gender=" + gender + ", introduction="
				+ introduction + ", email=" + email + ", address=" + address + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", admin=" + admin + ", userReport=" + userReport + ", loginType=" + loginType
				+ "]";
	}

	
	
	

	
	
}
