package com.model;

public class OrderVO {
	
	private int order_seq;
	private String order_date;
	private String user_id;
	private int total_amount;
	private int discount_amount;
	private int pay_amount;
	private char pay_method;
	
	public OrderVO(int order_seq, String order_date, String user_id, int total_amount, int discount_amount,
			int pay_amount, char pay_method) {
		super();
		this.order_seq = order_seq;
		this.order_date = order_date;
		this.user_id = user_id;
		this.total_amount = total_amount;
		this.discount_amount = discount_amount;
		this.pay_amount = pay_amount;
		this.pay_method = pay_method;
	}

	public int getOrder_seq() {
		return order_seq;
	}

	public String getOrder_date() {
		return order_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public int getTotal_amount() {
		return total_amount;
	}

	public int getDiscount_amount() {
		return discount_amount;
	}

	public int getPay_amount() {
		return pay_amount;
	}

	public char getPay_method() {
		return pay_method;
	}
	
	
	
	
	

}
