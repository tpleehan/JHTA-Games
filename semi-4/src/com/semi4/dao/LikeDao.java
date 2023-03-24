package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.Like;

public class LikeDao {

	// 싱글턴 객체
	private static LikeDao self = new LikeDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private LikeDao() {
	}                                               // 생성자를 private으로 선언

	public static LikeDao getInstance() {           // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	public void insertlikes(Like like) throws SQLException {
		sqlmap.insert("like.insertlikes", like);
	}

	public int getLikeCountByNo(int reviewNo) throws SQLException {
		return (Integer)sqlmap.queryForObject("like.getLikeCountByNo", reviewNo);
	}

	@SuppressWarnings("unchecked")
	public List<Like> getlikeByNo(int reviewNo) throws SQLException {
		return sqlmap.queryForList("like.getlikeByNo", reviewNo);
	}

	public int getlikeByNoes(Like like) throws SQLException {
		return (Integer)sqlmap.queryForObject("like.getlikeByNoes", like);
	}

	public void deletelikes(int reviewNo) throws SQLException {
		sqlmap.delete("like.deletelikes", reviewNo);
	}
}
