package com.order.dto;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class OrderVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//상품
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_desc;
	private String product_thumbnail;
	private String product_info;
	private String product_opt;
	private String fullname;
	
	//주문자
	private String user_id;
	private String user_name;
	private String user_address1;
	private String user_address2;
	private String user_address3;
	private String user_phone;
	private String postcode;
	private String email;
	
	//주문
	private int order_num;
	private int order_seq_num;
	private Timestamp pay_time;
	private String order_con;
	private String order_message;
	private int total_amount;
	private Date date;
	private int deliver_situ;
	private Date billing_date;
	private String cal_info;
	
	public OrderVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public String getProduct_thumbnail() {
		return product_thumbnail;
	}
	public void setProduct_thumbnail(String product_thumbnail) {
		this.product_thumbnail = product_thumbnail;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public String getProduct_opt() {
		return product_opt;
	}
	public void setProduct_opt(String product_opt) {
		this.product_opt = product_opt;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getUser_address3() {
		return user_address3;
	}
	public void setUser_address3(String user_address3) {
		this.user_address3 = user_address3;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getOrder_seq_num() {
		return order_seq_num;
	}
	public void setOrder_seq_num(int order_seq_num) {
		this.order_seq_num = order_seq_num;
	}
	public Timestamp getPay_time() {
		return pay_time;
	}
	public void setPay_time(Timestamp pay_time) {
		this.pay_time = pay_time;
	}
	public String getOrder_con() {
		return order_con;
	}
	public void setOrder_con(String order_con) {
		this.order_con = order_con;
	}
	public String getOrder_message() {
		return order_message;
	}
	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getDeliver_situ() {
		return deliver_situ;
	}
	public void setDeliver_situ(int deliver_situ) {
		this.deliver_situ = deliver_situ;
	}
	public Date getBilling_date() {
		return billing_date;
	}
	public void setBilling_date(Date billing_date) {
		this.billing_date = billing_date;
	}
	public String getCal_info() {
		return cal_info;
	}
	public void setCal_info(String cal_info) {
		this.cal_info = cal_info;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "OrderVO [product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_desc=" + product_desc + ", product_thumbnail=" + product_thumbnail
				+ ", product_info=" + product_info + ", product_opt=" + product_opt + ", fullname=" + fullname
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", user_address1=" + user_address1
				+ ", user_address2=" + user_address2 + ", user_address3=" + user_address3 + ", user_phone=" + user_phone
				+ ", postcode=" + postcode + ", email=" + email + ", order_num=" + order_num + ", order_seq_num="
				+ order_seq_num + ", pay_time=" + pay_time + ", order_con=" + order_con + ", order_message="
				+ order_message + ", total_amount=" + total_amount + ", date=" + date + ", deliver_situ=" + deliver_situ
				+ ", billing_date=" + billing_date + ", cal_info=" + cal_info + "]";
	}
	
	
	
}
