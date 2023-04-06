package com.reply.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.user.dto.ReplyVO;
import com.user.service.ReplyPager;
import com.user.service.ReplyService;


@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Inject
	ReplyService replyservice;
	
	@RequestMapping("insert.do")
	public void insert(@ModelAttribute ReplyVO vo, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		vo.setReplyer(userId);
		
		replyservice.create(vo);
	}
	
	@RequestMapping(value="insertRest.do", method=RequestMethod.POST)
			
	public ResponseEntity<String> interRest(@RequestBody ReplyVO vo, HttpSession session) {
	ResponseEntity<String> entity = null;
	try {
		String userId = (String)session.getAttribute("userId");
		vo.setReplyer(userId);
		replyservice.create(vo);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
	} catch (Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
	return entity;
}

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam int bno,
@RequestParam(defaultValue="1") int curPage, ModelAndView mav, HttpSession session) {
	int count = replyservice.count(bno);
	ReplyPager replyPager = new ReplyPager(count, curPage);
	int start = replyPager.getPageBegin();
	int end = replyPager.getPageEnd();
	List<ReplyVO> list = replyservice.list(bno, start, end, session);
	mav.setViewName("userboard/replyList");
	mav.addObject("list", list);
	mav.addObject("replyPager", replyPager);
	return mav;
}
	
	@RequestMapping("listJson.do")
	public List<ReplyVO> listJson(@RequestParam int bno,
@RequestParam(defaultValue="1") int curPage, HttpSession session) {
	int count = replyservice.count(bno);
	ReplyPager pager = new ReplyPager(count, curPage);
	int start = pager.getPageBegin();
	int end = pager.getPageEnd();
	List<ReplyVO> list = replyservice.list(bno, start, end, session);
	return list;
}	
	
	@RequestMapping(value="list/{bno}/{curPage}", method=RequestMethod.GET)
	public ModelAndView replylist(@PathVariable("bno") int bno, @PathVariable int curPage, ModelAndView mav, HttpSession session) {

	int count = replyservice.count(bno);
	ReplyPager replyPager = new ReplyPager(count, curPage);
	int start = replyPager.getPageBegin();
	int end = replyPager.getPageEnd();
	List<ReplyVO> list = replyservice.list(bno, start, end, session);
	mav.setViewName("userboard/replyList");
	mav.addObject("list", list);
	mav.addObject("replyPager", replyPager);
	return mav;
}
	
	@RequestMapping(value="/delete/{rno}", method=RequestMethod.GET)
	public ModelAndView replydetail(@PathVariable("rno") Integer rno, ModelAndView mav) {
	ReplyVO vo = replyservice.detail(rno);
	mav.setViewName("userboard/replyDetail");
	mav.addObject("vo", vo);
	return mav;
}
	
	@RequestMapping(value="/update/{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> replyUpdate(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			replyservice.update(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	return entity;
}
	
	@RequestMapping(value="/delete/{rno}")
	public ResponseEntity<String> replyDelete(@PathVariable("rno") Integer rno) {
		ResponseEntity<String> entity = null;
		try {
			replyservice.delete(rno);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	return entity;
	}
}