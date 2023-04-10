package com.review.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.review.dao.ReviewDAO;
import com.review.dto.ReviewVO;


@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	ReviewDAO dao;

	@Override
	public void createReview(ReviewVO vo) {
		dao.createReview(vo);
	}

	@Override
	public List<ReviewVO> reviewList(Integer order_id, int start, int end, HttpSession session) {
		List<ReviewVO> items = dao.reviewList(order_id, start, end);
		String user_id = (String) session.getAttribute("user_id");
		for(ReviewVO vo : items) {
			if(vo.getReview_secret().equals("y")) {
				if(user_id==null) {
					vo.setReview_context("비밀 댓글입니다.");
				} else {
					String writer = vo.getReview_secret_writer();
					String replyer = vo.getUser_id();
					if(!user_id.equals(writer) && !user_id.equals(replyer)) {
						vo.setReview_context("비밀 댓글입니다.");
					}
				}
			}
		}
		return items;
	}

	@Override
	public ReviewVO detail(Integer review_id) {
		return dao.detailReview(review_id);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		dao.updateReview(vo);
	}

	@Override
	public void deleteReview(Integer review_id) {
		dao.deleteReview(review_id);

	}

	@Override
	public int countReview(Integer order_id) {
		return dao.countReview(order_id);
	}

}