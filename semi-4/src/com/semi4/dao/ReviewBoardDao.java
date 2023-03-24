package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.ReviewBoard;

public class ReviewBoardDao {

	private static ReviewBoardDao self = new ReviewBoardDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private ReviewBoardDao() {
	}                                                             // 생성자를 private으로 선언

	public static ReviewBoardDao getInstance() {                  // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	public void insertReview(ReviewBoard board) throws SQLException {
		sqlmap.insert("review.insertReview", board);
	}

	@SuppressWarnings("unchecked")
	public List<ReviewBoard> getAllReviewBoard() throws SQLException {
		return sqlmap.queryForList("review.getAllReviewBoard");
	}

	public ReviewBoard getReviewBoardByNo(int reviewNo) throws SQLException {
		return (ReviewBoard)sqlmap.queryForObject("review.getReviewBoardByNo", reviewNo);
	}

	public void updatereviewcount(ReviewBoard reviewBoard) throws SQLException {
		sqlmap.update("review.updatereviewcount", reviewBoard);
	}

	public void updateReviewboard(ReviewBoard reviewBoard) throws SQLException {
		sqlmap.update("review.updateReviewboard", reviewBoard);
	}

	public void updateReviewboardlike(ReviewBoard reviewBoard) throws SQLException {
		sqlmap.update("review.updateReviewboardlike", reviewBoard);
	}

	@SuppressWarnings("unchecked")
	public List<ReviewBoard> getReviewBoardByDynamic(Map<String, Object> criteria) throws SQLException {
		return sqlmap.queryForList("review.getReviewBoardByDynamic", criteria);
	}

	public Integer countReviewBoard(Map<String, Object> criteria) throws SQLException {
		return (Integer)sqlmap.queryForObject("review.countReviewBoard", criteria);
	}

	public void deleteReviewboard(int reviewNo) throws SQLException {
		sqlmap.delete("review.deleteReviewboard", reviewNo);
	}

	@SuppressWarnings("unchecked")
	public List<ReviewBoard> getReviewsByUserNo(int userNo) throws SQLException {
		return sqlmap.queryForList("review.getReviewsByUserNo", userNo);
	}
}
