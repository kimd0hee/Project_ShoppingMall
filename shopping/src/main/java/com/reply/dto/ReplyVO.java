package com.reply.dto;

import java.util.Date;

public class ReplyVO {
   private Integer rno; //댓글 번호
   private Integer bno; // 게시글 번호
   private String replytext; //댓글 내용
   private String replyer; //댓글 작성자
   private String user_name; //댓글 작성자의 이름
   private Date regdate; // 댓글 작성일자
   private Date updatedate; //댓글 수정일자
   private String secretReply;
   private String writer;
   
   public Integer getRno() {
      return rno;
   }
   
   public void setRno(Integer rno) {
      this.rno = rno;
   }
   
   public Integer getBno() {
      return bno;
   }

   public void setBno(Integer bno) {
      this.bno = bno;
   }
   
   public String getReplytext() {
      return replytext;
   }
   
   public void setReplytext(String replytext) {
      this.replytext = replytext;
   }
   
   public String getReplyer() {
      return replyer;
   }
   
   public void setReplyer(String replyer) {
      this.replyer = replyer;
   }
   
   public String getUser_name() {
      return user_name;
   }
   
   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }
   
   public Date getRegdate() {
      return regdate;
   }

   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }

   public Date getUpdatedate() {
      return updatedate;
   }

   public void setUpdatedate(Date updatedate) {
      this.updatedate = updatedate;
   }

   public String getSecretReply() {
      return secretReply;
   }

   public void setSecretReply(String secretReply) {
      this.secretReply = secretReply;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   @Override
   public String toString() {
      return "ReviewVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
            + ", user_name=" + user_name + ", regdate=" + regdate + ", updatedate=" + updatedate + ", secretReply="
            + secretReply + ", writer=" + writer + "]";
   }
   
}