package com.review.controller;

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

import com.review.dto.ReviewVO;
import com.review.service.ReviewPager;
import com.review.service.ReviewService;


@RestController
public class ReviewController {

	@Inject
	ReviewService service;

	@RequestMapping("insertReview.do")
	public void insertReview(@ModelAttribute ReviewVO vo, HttpSession session) {

		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);

		service.createReview(vo);
	}

	@RequestMapping(value="insertRest.do", method=RequestMethod.POST)

	public ResponseEntity<String> interRest(@RequestBody ReviewVO vo, HttpSession session) {
	ResponseEntity<String> entity = null;
	try {
		String user_id = (String)session.getAttribute("user_id");
		vo.setUser_id(user_id);
		service.createReview(vo);
		entity = new ResponseEntity<>("success", HttpStatus.OK);
	} catch (Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
	return entity;
}

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam int order_id,
@RequestParam(defaultValue="1") int curPage, ModelAndView mav, HttpSession session) {
	int count = service.countReview(order_id);
	ReviewPager replyPager = new ReviewPager(count, curPage);
	int start = replyPager.getPageBegin();
	int end = replyPager.getPageEnd();
	List<ReviewVO> list = service.reviewList(order_id, start, end, session);
	mav.setViewName("userboard/replyList");
	mav.addObject("list", list);
	mav.addObject("replyPager", replyPager);
	return mav;
}

	@RequestMapping("listJson.do")
	public List<ReviewVO> listJson(@RequestParam int order_id,
@RequestParam(defaultValue="1") int curPage, HttpSession session) {
	int count = service.countReview(order_id);
	ReviewPager pager = new ReviewPager(count, curPage);
	int start = pager.getPageBegin();
	int end = pager.getPageEnd();
	List<ReviewVO> list = service.reviewList(order_id, start, end, session);
	return list;
}

	@RequestMapping(value="list/{bno}/{curPage}", method=RequestMethod.GET)
	public ModelAndView replylist(@PathVariable("bno") int order_id, @PathVariable int curPage, ModelAndView mav, HttpSession session) {

	int count = service.countReview(order_id);
	ReviewPager replyPager = new ReviewPager(count, curPage);
	int start = replyPager.getPageBegin();
	int end = replyPager.getPageEnd();
	List<ReviewVO> list = service.reviewList(order_id, start, end, session);
	mav.setViewName("userboard/replyList");
	mav.addObject("list", list);
	mav.addObject("replyPager", replyPager);
	return mav;
}

	@RequestMapping(value="/delete/{review_id}", method=RequestMethod.GET)
	public ModelAndView replydetail(@PathVariable("review_id") Integer review_id, ModelAndView mav) {
	ReviewVO vo = service.detail(review_id);
	mav.setViewName("userboard/replyDetail");
	mav.addObject("vo", vo);
	return mav;
}

	@RequestMapping(value="/update/{review_id}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> updateReview(@PathVariable("review_id") Integer review_id, @RequestBody ReviewVO vo) {

		ResponseEntity<String> entity = null;
		try {
			vo.setOrder_id(review_id);
			service.updateReview(vo);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	return entity;
}

	@RequestMapping(value="/delete/{review_id}")
	public ResponseEntity<String> deleteReview(@PathVariable("review_id") Integer review_id) {
		ResponseEntity<String> entity = null;
		try {
			service.deleteReview(review_id);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	return entity;
	}
}