package com.model;

public class CommentVO {
	
	private	int comment_seq;	// 댓글번호
	private	String article_seq; // 	기사번호
	private	String comment_con; // 
	private String comment_date; // 댓글작성날짜
	private String user_id; // 유저아이디
	private  String comment_likes; // 좋아요수
	
	
	public CommentVO(String comment_con, String user_id, String getDate) {
		super();
		this.comment_con = comment_con;
		this.user_id = user_id;
		this.comment_date=getDate;
	
	}

	public CommentVO(int comment_seq, String article_seq, String comment_con, String comment_date, String user_id,
			String comment_likes) {
		super();
		this.comment_seq = comment_seq;
		this.article_seq = article_seq;
		this.comment_con = comment_con;
		this.comment_date = comment_date;
		this.user_id = user_id;
		this.comment_likes = comment_likes;
	}
	
	public int getComment_seq() {
		return comment_seq;
	}
	public String getArticle_seq() {
		return article_seq;
	}
	public String getComment_con() {
		return comment_con;
	}
	public String getComment_date() {
		return comment_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getComment_likes() {
		return comment_likes;
	}
	
	
	
	

}
