package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.Cart;

public class CartDao {

	// 싱글턴 객체
	private static CartDao self = new CartDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private CartDao() {
	}                                               // 생성자를 private으로 선언

	public static CartDao getInstance() {           // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	public void insertCartItem(Cart cart) throws SQLException {
		sqlmap.insert("cart.insertCartItem", cart);
	}

	public void updateCartItemAmount(Cart cart) throws SQLException {
		sqlmap.update("cart.updateCartItemAmount", cart);
	}

	public Cart getCartItem(Cart cart) throws SQLException {
		return (Cart)sqlmap.queryForObject("cart.getCartItem", cart);
	}

	public void deleteCartItem(Cart cart) throws SQLException {
		sqlmap.delete("cart.deleteCartItem", cart);
	}

	public void deleteAllMyCart(int userNo) throws SQLException {
		sqlmap.delete("cart.deleteAllMyCart", userNo);
	}

	@SuppressWarnings("unchecked")
	public List<Cart> getCartItemsByUserNo(int userNo) throws SQLException {
		return sqlmap.queryForList("cart.getCartItemsByUserNo", userNo);
	}

	public Cart getCarItemtByCartNo(int cartNo) throws SQLException {
		return (Cart)sqlmap.queryForObject("cart.getCarItemtByCartNo", cartNo);
	}

	/**
	 * 게임번호로 장바구니 삭제하기
	 * @throws SQLException
	 */
	public void deleteCartByGameNo(int gameNo) throws SQLException {
		sqlmap.delete("cart.deleteCartByGameNo", gameNo);
	}
} 
