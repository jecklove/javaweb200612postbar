package org.jgs1905.service;

import java.sql.SQLException;

import org.jgs1905.dao.UserDao;
import org.jgs1905.entity.User;

/**
 * 	用户业务类
 * @author junki
 * @date 2020年6月5日
 */
public class UserService {
	
	private UserDao userDao = new UserDao();

	/**
	 * 	用户登录业务方法
	 * @param user
	 * @return
	 * @throws SQLException 
	 */
	public User login(User user) throws SQLException {
		return userDao.findOneByUsernameAndPassword(user);
	}

	/**
	 * 	添加用户
	 * @param user
	 * @return
	 * @throws SQLException 
	 */
	public int add(User user) throws SQLException {
		return userDao.insert(user);
	}

}
