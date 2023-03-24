package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.Genre;

public class GenreDao {

	// 싱글턴 객체
	private static GenreDao self = new GenreDao();  // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private GenreDao() {
	}                                               // 생성자를 private으로 선언

	public static GenreDao getInstance() {          // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	/**
	 * 모든 장르 조회하기
	 * @return List<Genre>
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Genre> getAllGenres() throws SQLException {
		return sqlmap.queryForList("genre.getAllGenres");
	}

	/**
	 * 장르번호로 장르 조회하기
	 * @param genreNo 장르번호
	 * @return 장르 객체 
	 * @throws SQLException
	 */
	public Genre getGenreByGenreNo(int genreNo) throws SQLException {
		return (Genre)sqlmap.queryForObject("genre.getGenreByGenreNo", genreNo);

	}
}
