package com.board.dto;

import java.sql.Date;

public class BoardVO {
	private int cs_id;
	private String cs_title;
	private String cs_context;
	private String cs_writer;
	private Date cs_date;
	public int getCs_id() {
		return cs_id;
	}
	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
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
	public String getCs_writer() {
		return cs_writer;
	}
	public void setCs_writer(String cs_writer) {
		this.cs_writer = cs_writer;
	}
	public Date getCs_date() {
		return cs_date;
	}
	public void setCs_date(Date cs_date) {
		this.cs_date = cs_date;
	}

	@Override
	public String toString() {
		return "BoardVO [cs_id=" + cs_id + ", cs_title=" + cs_title + ", cs_context=" + cs_context + ", cs_writer="
				+ cs_writer + ", cs_date=" + cs_date + "]";
	}
}
