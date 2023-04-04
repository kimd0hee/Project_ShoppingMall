package com.memberboard.dto;

import java.sql.Timestamp;

public class MemberboardVO {
	private int cs_id;
	private String cs_type;
	private String cs_title;
	private String cs_context;
	private Timestamp cs_date;
	private int cs_viewcnt;
	private String cs_answer;
	private Timestamp cs_ansdate;
	private String cs_status;
	private String cs_writer;
	private int cs_recnt;
	
	public int getCs_id() {
		return cs_id;
	}
	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}
	public String getCs_type() {
		return cs_type;
	}
	public void setCs_type(String cs_type) {
		this.cs_type = cs_type;
	}
	public String getCs_title() {
		return cs_title;
	}
	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}
	public String getCs_context() {
		return cs_context;
	}
	public void setCs_context(String cs_context) {
		this.cs_context = cs_context;
	}
	public Timestamp getCs_date() {
		return cs_date;
	}
	public void setCs_date(Timestamp cs_date) {
		this.cs_date = cs_date;
	}
	public int getCs_viewcnt() {
		return cs_viewcnt;
	}
	public void setCs_viewcnt(int cs_viewcnt) {
		this.cs_viewcnt = cs_viewcnt;
	}
	public String getCs_answer() {
		return cs_answer;
	}
	public void setCs_answer(String cs_answer) {
		this.cs_answer = cs_answer;
	}
	public Timestamp getCs_ansdate() {
		return cs_ansdate;
	}
	public void setCs_ansdate(Timestamp cs_ansdate) {
		this.cs_ansdate = cs_ansdate;
	}
	public String getCs_status() {
		return cs_status;
	}
	public void setCs_status(String cs_status) {
		this.cs_status = cs_status;
	}
	public String getCs_writer() {
		return cs_writer;
	}
	public void setCs_writer(String cs_writer) {
		this.cs_writer = cs_writer;
	}
	public int getCs_recnt() {
		return cs_recnt;
	}
	public void setCs_recnt(int cs_recnt) {
		this.cs_recnt = cs_recnt;
	}
	
	@Override
	public String toString() {
		return "MemberboardVO [cs_id=" + cs_id + ", cs_type=" + cs_type + ", cs_title=" + cs_title + ", cs_context="
				+ cs_context + ", cs_date=" + cs_date + ", cs_viewcnt=" + cs_viewcnt + ", cs_answer=" + cs_answer
				+ ", cs_ansdate=" + cs_ansdate + ", cs_status=" + cs_status + ", cs_writer=" + cs_writer + ", cs_recnt="
				+ cs_recnt + "]";
	}
}
