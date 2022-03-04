package com.model;

public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_carnum;
	private String user_addr;
	private String guardian_phone;
	private String user_joindate;
	private String admin_yn;
	
	public UserVO(String user_id, String user_pw, String user_name, String user_phone, String user_carnum,
			String user_addr, String guardian_phone, String user_joindate, String admin_yn) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_carnum = user_carnum;
		this.user_addr = user_addr;
		this.guardian_phone = guardian_phone;
		this.user_joindate = user_joindate;
		this.admin_yn = admin_yn;
	}
	
	public UserVO(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}

	public String getUser_id() {
		return user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public String getUser_carnum() {
		return user_carnum;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public String getGuardian_phone() {
		return guardian_phone;
	}
	public String getUser_joindate() {
		return user_joindate;
	}
	public String getAdmin_yn() {
		return admin_yn;
	}
	
	

}
