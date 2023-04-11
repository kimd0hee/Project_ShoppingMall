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
<<<<<<< HEAD
		String title = vo.getTitle();
		String content = vo.getContent();
		String writer = vo.getWriter();
		
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "&gt;");
		
		title = title.replace("  ",   "&nbsp;&nbsp;");
		writer = writer.replace("  ",   "&nbsp;&nbsp;");
		
		content = content.replace("\n", "<br>");
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
=======
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
>>>>>>> branch 'N.D.O' of https://github.com/kimd0hee/Project_ShoppingMall.git
		dao.insertMemberboard(vo);
	}

	// 게시글 상세보기
	@Override
	public MemberboardVO viewMemberboard(int bno) {
		return dao.viewMemberboard(bno);
	}

	// 게시글 수정
	@Override
	public void updateMemberboard(MemberboardVO vo) {
		dao.updateMemberboard(vo);

	}

	// 게시글 삭제
	@Override
	public void deleteMemberboard(int bno) {
		dao.deleteMemberboard(bno);

	}

	// 게시글 목록
	@Override
	public List<MemberboardVO> memberboardList(int start, int end, String searchOption, String keyword) {
		return dao.memberboardList(start, end, searchOption, keyword);
	}

	// 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int bno, HttpSession session) {
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초 조회시에는 세션에 저장된 값이 없어 if문 실행 안함
		if(session.getAttribute("update_time_" + bno) != null) { // 세션에서 읽어오기
			update_time = (long)session.getAttribute("update_time_" + bno);
		}
		long current_time = System.currentTimeMillis();
<<<<<<< HEAD
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 시스템 현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
=======

>>>>>>> branch 'N.D.O' of https://github.com/kimd0hee/Project_ShoppingMall.git
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(bno);
			session.setAttribute("update_time"+ bno, current_time);
		}
	}

	// 게시글 레코드 개수
	@Override
	public int countArticle(String searchOption, String keyword) {
		return dao.countArticle(searchOption, keyword);
	}

}
