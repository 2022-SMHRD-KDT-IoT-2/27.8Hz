package com.model;

public class UserVO {
	private String userID;
	private String userPW;
	private String userNAME;
	private String userPHONE;
	private String userCARNUM;
	private String userADDR;
	private String guardianPHONE;
	private String userJOINDATE;
	private String adminYN;
	
	public UserVO(String userID, String userPW, String userNAME, String userPHONE, String userCARNUM, String userADDR,
			String guardianPHONE, String userJOINDATE, String adminYN) {
		super();
		this.userID = userID;
		this.userPW = userPW;
		this.userNAME = userNAME;
		this.userPHONE = userPHONE;
		this.userCARNUM = userCARNUM;
		this.userADDR = userADDR;
		this.guardianPHONE = guardianPHONE;
		this.userJOINDATE = userJOINDATE;
		this.adminYN = adminYN;
	}
	
	public String getUserID() {
		return userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public String getUserNAME() {
		return userNAME;
	}
	public String getUserPHONE() {
		return userPHONE;
	}
	public String getUserCARNUM() {
		return userCARNUM;
	}
	public String getUserADDR() {
		return userADDR;
	}
	public String getGuardianPHONE() {
		return guardianPHONE;
	}
	public String getUserJOINDATE() {
		return userJOINDATE;
	}
	public String getAdminYN() {
		return adminYN;
	}
	
	

}
