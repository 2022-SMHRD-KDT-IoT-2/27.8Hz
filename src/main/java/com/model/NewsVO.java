package com.model;

public class NewsVO {
	private int news_seq;
	private String news_title;
	private String news_content;
	private String news_file;
	private String news_date;
	private int news_cnt;
	private String user_id;
	private int news_likes;
	
	public NewsVO(int news_seq, String news_title, String news_content, String news_file, String news_date,
			int news_cnt, String user_id, int news_likes) {
		super();
		this.news_seq = news_seq;
		this.news_title = news_title;
		this.news_content = news_content;
		this.news_file = news_file;
		this.news_date = news_date;
		this.news_cnt = news_cnt;
		this.user_id = user_id;
		this.news_likes = news_likes;
	}

	public int getNews_seq() {
		return news_seq;
	}

	public String getNews_title() {
		return news_title;
	}

	public String getNews_content() {
		return news_content;
	}

	public String getNews_file() {
		return news_file;
	}

	public String getNews_date() {
		return news_date;
	}

	public int getNews_cnt() {
		return news_cnt;
	}

	public String getUser_id() {
		return user_id;
	}

	public int getNews_likes() {
		return news_likes;
	}
}