package com.model;

public class BasketVO { 
	
	private	int basket_seq; // 장바구니 번호
	private	int goods_seq; // 상품 번호
	private String user_ID ; // 사용자 ID
	private int goods_cnt; // 상품 개수
	private  String basket_date; // 장바구니 날짜
	
	public BasketVO(int basket_seq, int goods_seq, String user_ID, int goods_cnt, String basket_date) {
		super();
		this.basket_seq = basket_seq;
		this.goods_seq = goods_seq;
		this.user_ID = user_ID;
		this.goods_cnt = goods_cnt;
		this.basket_date = basket_date;
	}
	public int getBasket_seq() {
		return basket_seq;
	}
	public int getGoods_seq() {
		return goods_seq;
	}
	public String getUser_id() {
		return user_ID;
	}
	public int getGoods_cnt() {
		return goods_cnt;
	}
	public String getBasket_date() {
		return basket_date;
	}
	
	
	
 

}
