package com.reply.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.reply.dto.ReplyVO;

public interface ReplyService {

   public void create(ReplyVO vo);

   public List<ReplyVO> list(Integer bno, int start, int end, HttpSession session);

   public ReplyVO detail(Integer rno);

   public void update(ReplyVO vo);

   public void delete(Integer rno);

   public int count(Integer bno);

}