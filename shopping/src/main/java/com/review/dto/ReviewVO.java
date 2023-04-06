package com.review.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ReviewVO {
	private Integer review_id;
	private Integer order_id;
	private int review_writer;
	private String user_id;
	private String review_context;
	private String review_grade;
	private String review_img;
	private	int review_recommend;
	private String review_comment;
	private String review_reply;
	private Timestamp review_date;
	private Timestamp review_comment_date;
	private Timestamp review_comment_update;
	private Timestamp review_reply_date;
	private String review_secret;
	private String review_secret_writer;
	
	public Integer getReview_id() {
		return review_id;
	}
	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public int getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(int review_writer) {
		this.review_writer = review_writer;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_context() {
		return review_context;
	}
	public void setReview_context(String review_context) {
		this.review_context = review_context;
	}
	public String getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(String review_grade) {
		this.review_grade = review_grade;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public int getReview_recommend() {
		return review_recommend;
	}
	public void setReview_recommend(int review_recommend) {
		this.review_recommend = review_recommend;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	public String getReview_reply() {
		return review_reply;
	}
	public void setReview_reply(String review_reply) {
		this.review_reply = review_reply;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	public Timestamp getReview_comment_date() {
		return review_comment_date;
	}
	public void setReview_comment_date(Timestamp review_comment_date) {
		this.review_comment_date = review_comment_date;
	}
	public Timestamp getReview_comment_update() {
		return review_comment_update;
	}
	public void setReview_comment_update(Timestamp review_comment_update) {
		this.review_comment_update = review_comment_update;
	}
	public Timestamp getReview_reply_date() {
		return review_reply_date;
	}
	public void setReview_reply_date(Timestamp review_reply_date) {
		this.review_reply_date = review_reply_date;
	}
	public String getReview_secret() {
		return review_secret;
	}
	public void setReview_secret(String review_secret) {
		this.review_secret = review_secret;
	}
	public String getReview_secret_writer() {
		return review_secret_writer;
	}
	public void setReview_secret_writer(String review_secret_writer) {
		this.review_secret_writer = review_secret_writer;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", order_id=" + order_id + ", review_writer=" + review_writer
				+ ", user_id=" + user_id + ", review_context=" + review_context + ", review_grade=" + review_grade
				+ ", review_img=" + review_img + ", review_recommend=" + review_recommend + ", review_comment="
				+ review_comment + ", review_reply=" + review_reply + ", review_date=" + review_date
				+ ", review_comment_date=" + review_comment_date + ", review_comment_update=" + review_comment_update
				+ ", review_reply_date=" + review_reply_date + ", review_secret=" + review_secret
				+ ", review_secret_writer=" + review_secret_writer + "]";
	}
	
}
