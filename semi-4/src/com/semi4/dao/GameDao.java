package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.Game;

public class GameDao {

	// 싱글턴 객체
	private static GameDao self = new GameDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private GameDao() {
	}                                               // 생성자를 private으로 선언

	public static GameDao getInstance() {           // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	/**
	 * 새로 등록할 게임번호의 새 시퀀스번호 조회하기
	 * @return int seqNo
	 * @throws SQLException
	 */
	public int getNewGameNo() throws SQLException {
		return (Integer)sqlmap.queryForObject("game.getNewGameNo");
	}

	/**
	 * 새로운 게임 등록하기
	 * @param game
	 * @throws SQLException
	 */
	public void insertNewGame(Game game) throws SQLException {
		sqlmap.insert("game.insertNewGame", game);
	}

	/**
	 * 제목으로 게임 조회하기
	 * @param title
	 * @return Game 객체
	 * @throws SQLException
	 */
	public Game getGameByTitle(String title) throws SQLException {
		return (Game)sqlmap.queryForObject("game.getGameByTitle", title);
	}

	/**
	 * 번호로 게임 조회하기
	 * @param gameNo
	 * @return Game 객체
	 * @throws SQLException
	 */
	public Game getGameByNo(int gameNo) throws SQLException {
		return (Game)sqlmap.queryForObject("game.getGameByNo", gameNo);
	}

	/**
	 * 모든 게임 조회하기
	 * @return List<Game>
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Game> getAllGames() throws SQLException {
		return sqlmap.queryForList("game.getAllGames");
	}

	/**
	 * 게임 정보 수정하기
	 * @param game
	 * @throws SQLException
	 */
	public void updateGame(Game game) throws SQLException {
		sqlmap.update("game.updateGame", game);
	}

	public void deleteGameByNo(int gameNo) throws SQLException {
		sqlmap.delete("game.deleteGameByNo", gameNo);
	}

	// 대일이부분
	public int searchGamesCount(Map<String, Object> param) throws SQLException {
		return (Integer)sqlmap.queryForObject("game.searchGamesCount", param);
	}

	@SuppressWarnings("unchecked")
	public List<Game> searchGames(Map<String, Object> param) throws SQLException {
		return sqlmap.queryForList("game.searchGames", param);
	}

	public int getGamesCount() throws SQLException {
		return (Integer)sqlmap.queryForObject("game.getGamesCount");
	}

	@SuppressWarnings("unchecked")
	public List<Game> getAllGamesByDate(Map<String, Object> criteria) throws SQLException {
		return sqlmap.queryForList("game.getAllGamesByDate", criteria);
	}

	@SuppressWarnings("unchecked")
	public List<Game> getMainGamesByDate() throws SQLException {
		return sqlmap.queryForList("game.getMainGamesByDate");
	}

	@SuppressWarnings("unchecked")
	public List<Game> getMainGamesByAtoZ() throws SQLException {
		return sqlmap.queryForList("game.getMainGamesByAtoZ");
	}

	@SuppressWarnings("unchecked")
	public List<Game> getMainGamesByLikes() throws SQLException {
		return sqlmap.queryForList("game.getMainGamesByLikes");
	}

	@SuppressWarnings("unchecked")
	public List<Game> selectKeywordGames(Map<String, Object> criteria) throws SQLException {
		return sqlmap.queryForList("game.selectKeywordGames", criteria);
	}

	public int selectKeywordGamesCount(Map<String, Object> criteria) throws SQLException {
		return (Integer)sqlmap.queryForObject("game.selectKeywordGamesCount", criteria);
	}
}
