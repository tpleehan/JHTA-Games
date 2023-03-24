package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.ProfitResult;

public class ProfitResultDao {

	// 싱글턴 객체
	private static ProfitResultDao self = new ProfitResultDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private ProfitResultDao() {
	}                                                               // 생성자를 private으로 선언

	public static ProfitResultDao getInstance() {                   // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	/**
	 * 입력한 날짜형식의 문자열에 해당하는 일, 월 수익 조회하기. 입력값 없을 시 전체 수익 조회
	 * @param opt
	 * @return List<ProfitResult>
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<ProfitResult> getProfitResults(Map<String, String> opt) throws SQLException {
		return sqlmap.queryForList("profitresult.getProfitResults", opt);
	}

	/**
	 * 입력한 날짜형식의 문자열에 해당하는 일, 월의 수익 합계 조회하기
	 * @param opt
	 * @return ProfitResult 객체
	 * @throws SQLException
	 */
	public ProfitResult getTotalProfitResult(Map<String, String> opt) throws SQLException {
		return (ProfitResult)sqlmap.queryForObject("profitresult.getTotalProfitResult", opt);
	}
}
