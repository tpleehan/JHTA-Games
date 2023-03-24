package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.Publisher;

public class PublisherDao {

	// 싱글턴 객체
	private static PublisherDao self = new PublisherDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private PublisherDao() {
	}                                                         // 생성자를 private으로 선언

	public static PublisherDao getInstance() {                // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	/**
	 * 퍼블리셔 전체 조회하기
	 * @return List<Publisher>
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Publisher> getAllPublishers() throws SQLException {
		return sqlmap.queryForList("publisher.getAllPublishers");
	}

	/**
	 * 퍼블리셔 번호로 퍼블리셔 조회하기
	 * @param publisherNo 퍼블리셔 번호
	 * @return 퍼블리셔 객체
	 * @throws SQLException
	 */
	public Publisher getPublisherByNo(int publisherNo) throws SQLException {
		return (Publisher)sqlmap.queryForObject("publisher.getPublisherByNo", publisherNo);
	}

	/**
	 * 새로운 퍼블리셔 시퀀스 번호 조회하기
	 * @return 새로운 publisher 시퀀스 번호
	 * @throws SQLException
	 */
	public int getPublisherSeqNo() throws SQLException {
		return (Integer)sqlmap.queryForObject("publisher.getPublisherSeqNo");
	}

	/**
	 * 조회한 퍼블리셔 시퀀스 번호로 새로운 퍼블리셔 생성
	 * @param publisher
	 * @throws SQLException
	 */
	public void insertNewPublisher(Publisher publisher) throws SQLException {
		sqlmap.insert("publisher.insertNewPublisher", publisher);
	}
}
