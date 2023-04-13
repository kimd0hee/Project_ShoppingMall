package com.review.dao;

import java.util.List;

import com.review.dto.ReviewVO;

public interface ReviewDAO {

	public void createReview(ReviewVO vo);

	public List<ReviewVO> reviewList(Integer order_id, int start, int end);

	public ReviewVO detailReview(Integer review_id);

	public void updateReview(ReviewVO vo);

	public void deleteReview(Integer review_id);

	public int countReview(Integer order_id);

}
