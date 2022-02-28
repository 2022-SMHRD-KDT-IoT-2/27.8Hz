package com.model;

public class CenterCommentVO {
	
	private	int a_seq;	//
	private	int q_seq; // 
	private	int a_content; // 
	private String a_file ; // 
	private String a_date; // 
	private  String user_id; //
	
	
	



	public int getA_seq() {
		return a_seq;
	}






	public int getQ_seq() {
		return q_seq;
	}






	public int getA_content() {
		return a_content;
	}






	public String getA_file() {
		return a_file;
	}






	public String getA_date() {
		return a_date;
	}






	public String getUser_id() {
		return user_id;
	}






	public CenterCommentVO(int a_seq, int q_seq, int a_content, String a_file, String a_date, String user_id) {
		super();
		this.a_seq = a_seq;
		this.q_seq = q_seq;
		this.a_content = a_content;
		this.a_file = a_file;
		this.a_date = a_date;
		this.user_id = user_id;
	}
	
	
	
	

	
	
	
}
