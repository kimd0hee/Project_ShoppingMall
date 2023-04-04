package com.product.dto;

public class ProductVO {
	private int product_id;
	private String product_category;
	private String product_name;
	private int product_price;
	private String product_color;
	private String product_size;
	private String product_desc;
	private int product_stock;
	private int product_view;
	private int product_quantity;
	private int product_delivery_price;
	private int product_recommend;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public int getProduct_view() {
		return product_view;
	}
	public void setProduct_view(int product_view) {
		this.product_view = product_view;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public int getProduct_delivery_price() {
		return product_delivery_price;
	}
	public void setProduct_delivery_price(int product_delivery_price) {
		this.product_delivery_price = product_delivery_price;
	}
	public int getProduct_recommend() {
		return product_recommend;
	}
	public void setProduct_recommend(int product_recommend) {
		this.product_recommend = product_recommend;
	}
	
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", product_category=" + product_category + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_color=" + product_color
				+ ", product_size=" + product_size + ", product_desc=" + product_desc + ", product_stock="
				+ product_stock + ", product_view=" + product_view + ", product_quantity=" + product_quantity
				+ ", product_delivery_price=" + product_delivery_price + ", product_recommend=" + product_recommend
				+ "]";
	}
}
