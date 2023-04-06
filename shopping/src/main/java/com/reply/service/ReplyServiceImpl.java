package com.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.user.dao.ReplyDAO;
import com.user.dto.ReplyVO;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO replyDao;

	@Override
	public void create(ReplyVO vo) {
		replyDao.create(vo);
	}

	@Override
	public List<ReplyVO> list(Integer bno, int start, int end, HttpSession session) {
		List<ReplyVO> items = replyDao.list(bno, start, end);
		String userId = (String) session.getAttribute("userId");
		for(ReplyVO vo : items) {
			if(vo.getSecretReply().equals("y")) {
				if(userId==null) {
					vo.setReplytext("비밀 댓글입니다.");
				} else {
					String writer = vo.getWrite();
					String replyer = vo.getReplyer();
					if(!userId.equals(writer) && !userId.equals(replyer)) {
						vo.setReplytext("비밀 댓글입니다.");
					}
				}
			}
		}
		return items;
	}

	@Override
	public ReplyVO detail(Integer rno) {
		return replyDao.detail(rno);
	}

	@Override
	public void update(ReplyVO vo) {
		replyDao.update(vo);
	}

	@Override
	public void delete(Integer rno) {
		replyDao.delete(rno);

	}

	@Override
	public int count(Integer bno) {
		return replyDao.count(bno);
	}

}