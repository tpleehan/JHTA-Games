package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.PurchaseItem;

public class PurchaseItemDao {

	// 싱글턴 객체
	private static PurchaseItemDao self = new PurchaseItemDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private PurchaseItemDao() {
	}                                                               // 생성자를 private으로 선언

	public static PurchaseItemDao getInstance() {                   // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	public int countPurchaseItem(int userNo) throws SQLException {
		return (Integer)sqlmap.queryForObject("item.countPurchaseItem", userNo);
	}

	@SuppressWarnings("unchecked")
	public List<PurchaseItem> getAllPurchasesItems() throws SQLException {
		return sqlmap.queryForList("item.getAllPurchasesItems");
	}

	@SuppressWarnings("unchecked")
	public List<PurchaseItem> getPurchasesItemsByUserNo(int userNo) throws SQLException {
		return sqlmap.queryForList("item.getPurchasesItemsByUserNo", userNo);
	}

	public void insertPurchaseItem(PurchaseItem purchaseItem) throws SQLException {
		sqlmap.insert("item.insertPurchaseItem", purchaseItem);
	}

	/**
	 * 주문번호에 해당하는 주문물품내역 조회하기
	 * @param purchaseNo
	 * @return List<PurchaseItem>
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<PurchaseItem> getPurchasesByPurchaseNo(int purchaseNo) throws SQLException {
		return sqlmap.queryForList("item.getPurchasesByPurchaseNo", purchaseNo);
	}

	@SuppressWarnings("unchecked")
	public List<PurchaseItem> getOrderByOrderUser(Map<String, Object> criteria) throws SQLException {
		return sqlmap.queryForList("item.getOrderByOrderUser", criteria);
	}

	/**
	 * 구매번호로 PurchaseItem 삭제하기
	 * @param itemNo
	 * @throws SQLException
	 */
	public void deletePurchaseItemByGameNo(int gameNo) throws SQLException {
		sqlmap.delete("item.deletePurchaseItemByGameNo", gameNo);
	}
}
