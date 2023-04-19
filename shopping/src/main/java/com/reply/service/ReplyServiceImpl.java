package com.reply.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.reply.dao.ReplyDAO;
import com.reply.dto.ReplyVO;


@Service
public class ReplyServiceImpl implements ReplyService {

   @Inject
   ReplyDAO dao;

   @Override
   public void create(ReplyVO vo) {
      dao.create(vo);
   }

   @Override
   public List<ReplyVO> list(Integer bno, int start, int end, HttpSession session) {
      List<ReplyVO> items = dao.list(bno, start, end);
      String user_id = (String) session.getAttribute("user_id");
      for(ReplyVO vo : items) {
         if(vo.getSecretReply().equals("y")) {
            if(user_id==null) {
               vo.setReplytext("비밀 댓글입니다.");
            } else {
               String writer = vo.getWriter();
               String replyer = vo.getReplyer();
               if(!user_id.equals(writer) && !user_id.equals(replyer)) {
                  vo.setReplytext("비밀 댓글입니다.");
               }
            }
         }
      }
      return items;
   }

   @Override
   public ReplyVO detail(Integer rno) {
      return dao.detail(rno);
   }

   @Override
   public void update(ReplyVO vo) {
      dao.update(vo);
   }

   @Override
   public void delete(Integer rno) {
      dao.delete(rno);

   }

   @Override
   public int count(Integer bno) {
      return dao.count(bno);
   }

}