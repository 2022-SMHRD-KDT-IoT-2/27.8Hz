package com.model;

public class GoodsVO {
	private int goods_seq;
	private String goods_name;
	private String goods_content;
	private String goods_maker;
	private int goods_price;
	private int goods_stock;
	private String goods_date;
	private String user_id;
	
	public GoodsVO(int goods_seq, String goods_name, String goods_content, String goods_maker, int goods_price,
			int goods_stock, String goods_date, String user_id) {
		super();
		this.goods_seq = goods_seq;
		this.goods_name = goods_name;
		this.goods_content = goods_content;
		this.goods_maker = goods_maker;
		this.goods_price = goods_price;
		this.goods_stock = goods_stock;
		this.goods_date = goods_date;
		this.user_id = user_id;
	}

	public int getGoods_seq() {
		return goods_seq;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public String getGoods_content() {
		return goods_content;
	}

	public String getGoods_maker() {
		return goods_maker;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public int getGoods_stock() {
		return goods_stock;
	}

	public String getGoods_date() {
		return goods_date;
	}

	public String getUser_id() {
		return user_id;
	}
}
