package com.semi4.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.semi4.utils.IbatisUtil;
import com.semi4.vo.Admin;

public class AdminDao {

	// 싱글턴 객체
	private static AdminDao self = new AdminDao();    // 자기 자신의 객체를 담는 정적변수에 객체를 저장한다.

	private AdminDao() {
	}                                                 // 생성자를 private으로 선언

	public static AdminDao getInstance() {            // UserDao 객체를 제공하는 정적메소드를 정의
		return self;
	}

	private SqlMapClient sqlmap = IbatisUtil.getSqlmap();

	/**
	 * 관리자 아이디로 관리자 조회하기
	 * @param adminId
	 * @return Admin 객체
	 * @throws SQLException
	 */
	public Admin getAdminById(String adminId) throws SQLException {
		return (Admin)sqlmap.queryForObject("admin.getAdminById", adminId);
	}

	/**
	 * 입력받은 Admin 객체로 관리자 생성하기
	 * @param admin
	 * @throws SQLException
	 */
	public void insertAdmin(Admin admin) throws SQLException {
		sqlmap.insert("admin.insertAdmin", admin);
	}

	/**
	 * 모든 관리자 조회하기
	 * @return List<Admin>
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Admin> getAllAdmins() throws SQLException {
		return sqlmap.queryForList("admin.getAllAdmins");
	}

	/**
	 * 입력받은 Admin 객체로 관리자 정보 수정하기
	 * @param admin
	 * @throws SQLException
	 */
	public void updateAdmin(Admin admin) throws SQLException {
		sqlmap.update("admin.updateAdmin", admin);
	}

	/**
	 * 입력받은 관리자 아이디에 해당하는 관리자 삭제하기
	 * @param adminId
	 * @throws SQLException
	 */
	public void deleteAdminById(String adminId) throws SQLException {
		sqlmap.delete("admin.deleteAdminById", adminId);
	}
}
