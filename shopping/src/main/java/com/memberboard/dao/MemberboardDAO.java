package com.memberboard.dao;

import java.util.List;

import com.memberboard.dto.MemberboardVO;

public interface MemberboardDAO {

	// 게시글 작성
	public void insertMemberboard(MemberboardVO vo);

	// 게시글 상세보기
	public MemberboardVO viewMemberboard(int cs_id);

	// 게시글 수정
	public void updateMemberboard(MemberboardVO vo);

	// 게시글 삭제
	public void deleteMemberboard(int cs_id);

	// 게시글 목록
	public List<MemberboardVO> memberboardList(int start, int end,
			String searchOption, String keyword);

	// 게시글 조회 증가
	public void increaseViewcnt(int cs_id);

	// 게시글 레코드 갯수 메서드 추가
	public int countArticle(String searchOption, String keyword);
}
