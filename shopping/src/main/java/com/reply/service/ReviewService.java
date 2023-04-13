package com.reply.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.reply.dto.ReviewVO;

public interface ReviewService {

	public void createReview(ReviewVO vo);

	public List<ReviewVO> reviewList(Integer oreder_id, int start, int end, HttpSession session);

	public ReviewVO detail(Integer review_id);

	public void updateReview(ReviewVO vo);

	public void deleteReview(Integer review_id);

	public int countReview(Integer order_id);

}
