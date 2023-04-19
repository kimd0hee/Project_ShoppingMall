package com.reply.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.reply.dto.ReplyVO;



@Repository
public class ReplyDAOImpl implements ReplyDAO {

   @Inject
   SqlSession sqlsession;
   // String nameSpace = "user";

      @Override
      public void create(ReplyVO vo) {
         sqlsession.insert("reply.insertReply", vo);
      }

   @Override
   public List<ReplyVO> list(Integer bno, int start, int end) {
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("bno", bno);
      map.put("start", start);
      map.put("end", end);
      return sqlsession.selectList("reply.listReply", map);
   }

   @Override
   public ReplyVO detail(Integer rno) {
      return sqlsession.selectOne("reply.detailReply", rno);
   }

   @Override
   public void update(ReplyVO vo) {
      sqlsession.update("reply.updateReply", vo);
   }

   @Override
   public void delete(Integer rno) {
      sqlsession.delete("reply.deleteReply", rno);
   }

   @Override
   public int count(Integer bno) {
      return sqlsession.selectOne("reply.countReply", bno);
   }

}