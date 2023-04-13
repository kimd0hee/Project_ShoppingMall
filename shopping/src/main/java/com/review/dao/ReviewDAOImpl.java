package com.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.review.dto.ReviewVO;



@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	SqlSession sqlsession;
	// String nameSpace = "user";

		@Override
		public void createReview(ReviewVO vo) {
			sqlsession.insert("reply.insertReview", vo);
		}

	@Override
	public List<ReviewVO> reviewList(Integer order_id, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("order_id", order_id);
		map.put("start", start);
		map.put("end", end);
		return sqlsession.selectList("reply.reviewList", map);
	}

	@Override
	public ReviewVO detailReview(Integer review_id) {
		return sqlsession.selectOne("reply.detailReply", review_id);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		sqlsession.update("reply.updateReply", vo);
	}

	@Override
	public void deleteReview(Integer review_id) {
		sqlsession.delete("reply.deleteReply", review_id);
	}

	@Override
	public int countReview(Integer order_id) {
		return sqlsession.selectOne("reply.countReply", order_id);
	}

}
