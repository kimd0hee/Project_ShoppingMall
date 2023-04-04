package com.memberboard.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.memberboard.dao.MemberboardDAO;
import com.memberboard.dto.MemberboardVO;

@Service
public class MemberboardServiceImpl implements MemberboardService {

	@Inject
	MemberboardDAO dao;
	
	// 게시글 쓰기
	@Override
	public void insertMemberboard(MemberboardVO vo) {
		String cs_title = vo.getCs_title();
		String cs_context = vo.getCs_context();
		String cs_writer = vo.getCs_writer();
		
		cs_title = cs_title.replace("<", "&lt;");
		cs_title = cs_title.replace("<", "&gt;");
		cs_writer = cs_writer.replace("<", "&lt;");
		cs_writer = cs_writer.replace("<", "&gt;");
		
		cs_title = cs_title.replace("  ",   "&nbsp;&nbsp;");
		cs_writer = cs_writer.replace("  ",   "&nbsp;&nbsp;");
		
		cs_context = cs_context.replace("\n", "<br>");
		vo.setCs_title(cs_title);
		vo.setCs_context(cs_context);
		vo.setCs_writer(cs_writer);
		dao.insertMemberboard(vo);
	}
	
	// 게시글 상세보기
	@Override
	public MemberboardVO viewMemberboard(int cs_id) {
		return dao.viewMemberboard(cs_id);
	}

	// 게시글 수정
	@Override
	public void updateMemberboard(MemberboardVO vo) {
		dao.updateMemberboard(vo);

	}
	
	// 게시글 삭제
	@Override
	public void deleteMemberboard(int cs_id) {
		dao.deleteMemberboard(cs_id);

	}

	// 게시글 목록
	@Override
	public List<MemberboardVO> memberboardList(int start, int end, String searchOption, String keyword) {
		return dao.memberboardList(start, end, searchOption, keyword);
	}

	// 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int cs_id, HttpSession session) {
		long update_time = 0;
		if(session.getAttribute("update_time_" + cs_id) != null) {
			update_time = (long)session.getAttribute("update_time_" + cs_id);
		}
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(cs_id);
			session.setAttribute("update_time"+cs_id, current_time);
		}
	}

	// 게시글 레코드 개수
	@Override
	public int countArticle(String searchOption, String keyword) {
		return dao.countArticle(searchOption, keyword);
	}

}
