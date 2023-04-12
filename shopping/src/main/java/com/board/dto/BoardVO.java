package com.board.dto;

import java.sql.Timestamp;

public class BoardVO {
	private int board_id;
	private String board_title;
	private String board_content;
	private String board_writer;
	private Timestamp board_createdate;
	private int board_viewcnt;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public Timestamp getBoard_createdate() {
		return board_createdate;
	}
	public void setBoard_createdate(Timestamp board_createdate) {
		this.board_createdate = board_createdate;
	}
	public int getBoard_viewcnt() {
		return board_viewcnt;
	}
	public void setBoard_viewcnt(int board_viewcnt) {
		this.board_viewcnt = board_viewcnt;
	}
	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_writer=" + board_writer + ", board_createdate=" + board_createdate + ", board_viewcnt="
				+ board_viewcnt + "]";
	}

	
}
