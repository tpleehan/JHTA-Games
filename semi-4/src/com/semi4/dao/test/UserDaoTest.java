package com.semi4.dao.test;

import java.sql.SQLException;

import org.junit.Assert;
import org.junit.Test;

import com.semi4.dao.UserDao;
import com.semi4.vo.User;

public class UserDaoTest {

	@Test
	public void testSearchBooks() {
		try {
			User user1 = UserDao.getInstance().getUserById("hong");
			Assert.assertNotNull(user1);

			User user2 = UserDao.getInstance().getUserById("test");
			Assert.assertNotNull(user2);

			User user3 = UserDao.getInstance().getUserById("dkdkdkddkddkdk");
			Assert.assertNull(user3);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
