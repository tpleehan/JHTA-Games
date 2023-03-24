package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.NoticeBoard;

public class NoticeBoardDao {

	// 싱글턴 객체
	private static NoticeBoardDao self = new NoticeBoardDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private NoticeBoardDao() {
	}                                                             // 생성자를 private으로 선언

	public static NoticeBoardDao getInstance() {                  // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}
	
	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	/**
	 * 공지사항 번호로 공지사항 조회하기
	 * @param noticeNo
	 * @return NoticeBoard 객체
	 * @throws SQLException
	 */
	public NoticeBoard getNoticeByNo(int noticeNo) throws SQLException {
		return (NoticeBoard)sqlmap.queryForObject("notice.getNoticeByNo", noticeNo);
	}

	/**
	 * 모든 공지사항 조회하기
	 * @return List<NoticeBoard>
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeBoard> getAllNotice() throws SQLException {
		return sqlmap.queryForList("notice.getAllNotice");
	}

	/**
	 * 입력받은 공지사항 객체 등록하기
	 * @param noticeBoard
	 * @throws SQLException
	 */
	public void insertNotice(NoticeBoard noticeBoard) throws SQLException {
		sqlmap.insert("notice.insertNotice", noticeBoard);
	}

	/**
	 * 최근 5개 공지사항 조회하기
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeBoard> getNoticeByDate() throws SQLException {
		return sqlmap.queryForList("notice.getNoticeByDate");
	}

	/**
	 * 검색옵션으로 찾아진 값들의 수 조회하기
	 * @param criteria
	 * @return int count
	 * @throws SQLException
	 */
	public int getNoticeBoardBySearchCount(Map<String, Object> criteria) throws SQLException {
		return (Integer)sqlmap.queryForObject("notice.getNoticeBoardBySearchCount", criteria);
	}

	/**
	 * 검색옵션으로 검색한 공지사항 조회하기
	 * @param criteria
	 * @return List<NoticeBoard>
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeBoard> getNoticeBoardBySearch(Map<String, Object> criteria) throws SQLException {
		return sqlmap.queryForList("notice.getNoticeBoardBySearch", criteria);
	}

	/**
	 * 공지사항을 보면 조회수를 증가시킨다.
	 * @param noticeBoard
	 * @throws SQLException
	 */
	public void updateNoticeCountByNo(NoticeBoard noticeBoard) throws SQLException {
		sqlmap.update("notice.updateNoticeCountByNo", noticeBoard);
	}

	/**
	 * 공지사항의 제목, 내용을 변경한다.
	 * @param noticeBoard
	 * @throws SQLException
	 */
	public void updateNotice(NoticeBoard noticeBoard) throws SQLException {
		sqlmap.update("notice.updateNotice", noticeBoard);
	}

	/**
	 * 입력받은 공지사항 번호로 공지사항을 삭제한다.
	 * @param noticeBoardNo
	 * @throws SQLException
	 */
	public void deleteNoticeByNo(int noticeBoardNo) throws SQLException {
		sqlmap.delete("notice.deleteNoticeByNo", noticeBoardNo);
	}
}
