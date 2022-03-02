package com.model;

public class CommunityVO {
	private int article_seq;
	private String article_title;
	private String article_content;
	private String article_file;
	private String article_date;
	private int article_cnt;
	private String user_id;
	private int article_likes;
	
	public CommunityVO(int article_seq, String article_title, String article_content, String article_file,
			String article_date, int article_cnt, String user_id, int article_likes) {
		super();
		this.article_seq = article_seq;
		this.article_title = article_title;
		this.article_content = article_content;
		this.article_file = article_file;
		this.article_date = article_date;
		this.article_cnt = article_cnt;
		this.user_id = user_id;
		this.article_likes = article_likes;
	}
	
	
	
	

	public CommunityVO(int article_seq, String article_title, String user_id, String article_date, int article_cnt ) {
		super();
		this.article_seq = article_seq;
		this.article_title = article_title;
		this.article_date = article_date;
		this.article_cnt = article_cnt;
		this.user_id = user_id;
	}





	public int getArticle_seq() {
		return article_seq;
	}

	public String getArticle_title() {
		return article_title;
	}

	public String getArticle_content() {
		return article_content;
	}

	public String getArticle_file() {
		return article_file;
	}

	public String getArticle_date() {
		return article_date;
	}

	public int getArticle_cnt() {
		return article_cnt;
	}

	public String getUser_id() {
		return user_id;
	}

	public int getArticle_likes() {
		return article_likes;
	}
}