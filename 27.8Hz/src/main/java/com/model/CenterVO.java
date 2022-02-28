package com.model;

public class CenterVO {
	
	private	int q_seq;	//
	private	String q_title; // 
	private	String q_content; // 
	private String q_file ; // 
	private String q_date; // 
	private  String user_ID; // 
	
	public CenterVO(int q_seq, String q_title, String q_content, String q_file, String q_date, String user_id) {
		super();
		this.q_seq = q_seq;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_file = q_file;
		this.q_date = q_date;
		this.user_ID = user_id;
	}

	public int getQ_seq() {
		return q_seq;
	}

	public String getQ_title() {
		return q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public String getQ_file() {
		return q_file;
	}

	public String getQ_date() {
		return q_date;
	}

	public String getUser_id() {
		return user_ID;
	}
	
	
	
	

}
