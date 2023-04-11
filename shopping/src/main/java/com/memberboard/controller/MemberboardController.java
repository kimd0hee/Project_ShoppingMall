package com.memberboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.memberboard.dto.MemberboardVO;
import com.memberboard.service.BoardPager;
import com.memberboard.service.MemberboardService;

@Controller
public class MemberboardController {
	
	@Inject
	MemberboardService service;
	
//	@Inject
//	ReplyService replyservice;
	
	
	// 게시글 목록
	@RequestMapping("memberboardList.do")
	public ModelAndView memberboardList(@RequestParam(defaultValue="cs_title")
	String searchOption,				@RequestParam(defaultValue="")
	String keyword,						@RequestParam(defaultValue="1")
	int curPage) {
		
		int count = service.countArticle(searchOption, keyword);
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin()-1;
		int end = boardPager.getPageEnd();
		
		List<MemberboardVO> list = service.memberboardList(start, end,
	searchOption, keyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("memberboardList");
		
		return mav;
	}
	
	// 게시글 작성화면
	@RequestMapping("memberboardWrite.do")
	public String memberboardWrite() {
		return "memberboardWrite";
	}
	
	// 게시글 작성
	@RequestMapping("insertMemberboard.do")
	public String insertMemberboard(@ModelAttribute MemberboardVO vo, HttpSession session) {
		String cs_writer = (String) session.getAttribute("user_id");
		vo.setCs_writer(cs_writer);
		service.insertMemberboard(vo);
		return " redirect:/memberboardList.do";
	}
	
	// 게시글 상세조회, 게시글 조회수 증가
	@RequestMapping("viewMemberboard.do")
	public ModelAndView viewMemberboard(@RequestParam int cs_id, @RequestParam int curPage,
@RequestParam String searchOption, @RequestParam String keyword, HttpSession session) {
		service.increaseViewcnt(cs_id, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberboardView");
		//mav.addObject("count", replyservice.count(cs_id));
		//mav.addObject("dto", service.read(cs_id));
		mav.addObject("curPage", curPage);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		return mav;
	}
	
	// 게시글 수정
	@RequestMapping("updateMemberboard.do")
	public String updateMemberboard(@ModelAttribute MemberboardVO vo) {
		service.updateMemberboard(vo);
		return "redirect:/memberboardList.do";
	}
	
	// 게시글 삭제
	@RequestMapping("deleteMemberboard.do")
	public String deleteMemberboard(@ModelAttribute int cs_id) {
		service.deleteMemberboard(cs_id);
		return "redirect:/memberboardList.do";
	}
}
