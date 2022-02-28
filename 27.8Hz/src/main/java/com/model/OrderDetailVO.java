package com.model;

public class OrderDetailVO {
	
	private int order_detail_seq;
	private int goods_seq;
	private int goods_cnt;
	private int order_seq;
	
	public OrderDetailVO(int order_detail_seq, int goods_seq, int goods_cnt, int order_seq) {
		super();
		this.order_detail_seq = order_detail_seq;
		this.goods_seq = goods_seq;
		this.goods_cnt = goods_cnt;
		this.order_seq = order_seq;
	}

	public int getOrder_detail_seq() {
		return order_detail_seq;
	}

	public int getGoods_seq() {
		return goods_seq;
	}

	public int getGoods_cnt() {
		return goods_cnt;
	}

	public int getOrder_seq() {
		return order_seq;
	}
	
	
	

}
