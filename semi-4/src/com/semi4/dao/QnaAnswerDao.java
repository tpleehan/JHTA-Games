package com.semi4.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.QnaAnswer;

public class QnaAnswerDao {

	// 싱글턴 객체
	private static QnaAnswerDao self = new QnaAnswerDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private QnaAnswerDao() {
	}                                                        // 생성자를 private으로 선언

	public static QnaAnswerDao getInstance() {               // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	public void insertQnaAnswer(QnaAnswer answer) throws SQLException {
		sqlmap.insert("qnaanswer.insertQnaAnswer", answer);
	}

	public QnaAnswer getQnaAnswerByNo(int qnaNo) throws SQLException {
		return (QnaAnswer)sqlmap.queryForObject("qnaanswer.getQnaAnswerByNo", qnaNo);
	}

	public void updateQnaAnswer(QnaAnswer answer) throws SQLException {
		sqlmap.update("qnaanswer.updateQnaAnswer", answer);
	}

	public void deleteQnaAnswerbyQnaNo(int qnaNo) throws SQLException {
		sqlmap.delete("qnaanswer.deleteQnaAnswerbyQnaNo", qnaNo);
	}

	/**
	 * Qna 게시판에 달린 답변의 수를 조회하는 메소드. 1이면 답변이 존재하고 0이면 답변이 존재하지 않은 것
	 * @param qnaBoardNo
	 * @return int 1 (답변이 존재) or int 0 (답변이 없음)
	 * @throws SQLException
	 */
	public int getQnaAnswerCountByNo(int qnaBoardNo) throws SQLException {
		return (Integer)sqlmap.queryForObject("qnaanswer.getQnaAnswerCountByNo", qnaBoardNo);
	}
}
