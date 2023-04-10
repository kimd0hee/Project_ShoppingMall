package com.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.dto.BoardVO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/*")
public class BoardController {

		@Inject
		BoardService service;
<<<<<<< HEAD
		//
=======

>>>>>>> branch 'K.D.H' of https://github.com/kimd0hee/Project_ShoppingMall.git
		// 게시글 목록
		@RequestMapping("boardList.do")
		public ModelAndView list() throws Exception{
			List<BoardVO> list = service.boardList();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("boardList");
			mav.addObject("list",list);
			return mav;
		}

		//게시글 작성 화면
		@RequestMapping(value="boardWrite.do",method=RequestMethod.GET)
		public String write() {
			return "boardWrite";
		}

		//게시글 작성 처리
		@RequestMapping(value="boardInsert.do", method=RequestMethod.POST)
		public String insert(@ModelAttribute BoardVO vo) throws Exception{
			service.insertBoard(vo);
			return "redirect:/boardList.do";
		}

		//게시글 상세내용 조회
		@RequestMapping(value="boardView.do", method=RequestMethod.GET)
		public ModelAndView view(@RequestParam int board_id, HttpSession session) throws Exception{

			ModelAndView mav = new ModelAndView();
			mav.setViewName("boardView");
			mav.addObject("dto", service.viewBoard(board_id));
			return mav;
		}

		//게시글 수정
		@RequestMapping(value="boardUpdate.do", method=RequestMethod.POST)
		public String boardUpdate(@ModelAttribute BoardVO vo) throws Exception{
			service.updateBoard(vo);
			return "redirect:boardList.do";
		}

		//게시글 삭제
		@RequestMapping("boardDelete.do")
		public String boardDelete(@RequestParam int cs_id) throws Exception{
			service.deleteBoard(cs_id);
			return "redirect:boardList.do";
		}
}
