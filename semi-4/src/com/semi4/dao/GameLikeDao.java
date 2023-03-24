package com.semi4.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.GameLike;

public class GameLikeDao {

	// 싱글턴 객체
	private static GameLikeDao self = new GameLikeDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private GameLikeDao() {
	}                                                       // 생성자를 private으로 선언

	public static GameLikeDao getInstance() {               // GameLikeDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	public void insertGameLikes(GameLike gameLike) throws SQLException {
		sqlmap.insert("gamelike.insertGameLikes", gameLike);
	}

	public GameLike selectGameLikeByGameNo(int gameNo) throws SQLException {
		return (GameLike)sqlmap.queryForObject("gamelike.selectGameLikeByGameNo", gameNo);
	}

	public int selectGameLikeCntByNo(GameLike gameLike) throws SQLException {
		return (Integer)sqlmap.queryForObject("gamelike.selectGameLikeCntByNo", gameLike);
	}

	public void deleteGameLikes(GameLike gameLike) throws SQLException {
		sqlmap.delete("gamelike.deleteGameLikes", gameLike);
	}
}
