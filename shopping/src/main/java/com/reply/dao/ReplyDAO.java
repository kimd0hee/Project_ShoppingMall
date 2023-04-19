package com.reply.dao;

import java.util.List;

import com.reply.dto.ReplyVO;

public interface ReplyDAO {

   public void create(ReplyVO vo);

   public List<ReplyVO> list(Integer bno, int start, int end);

   public ReplyVO detail(Integer rno);

   public void update(ReplyVO vo);

   public void delete(Integer rno);

   public int count(Integer bno);

}