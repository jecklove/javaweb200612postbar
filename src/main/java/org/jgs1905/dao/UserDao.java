package org.jgs1905.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.jgs1905.entity.User;
import org.jgs1905.utils.DataSourceUtil;

/**
 * 	用户数据操作类
 * @author junki
 * @date 2020年6月5日
 */
public class UserDao {

	/**
	 * 	根据用户名和密码查询一个用户
	 * @return
	 * @throws SQLException 
	 */
	public User findOneByUsernameAndPassword(User user) throws SQLException {
		
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		
		String sql = "select * from user where username = ? and password = ?";
		
		User result = qr.query(sql, new BeanHandler<>(User.class), user.getUsername(), user.getPassword());
		
		return result;
	}

	/**
	 * 	插入用户数据
	 * @param user
	 * @return
	 * @throws SQLException 
	 */
	public int insert(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		
		String sql = "insert into user(nickname, username, password) value(?, ?, ?)";
		
		int result = qr.update(sql, user.getNickname(), user.getUsername(), user.getPassword());
		
		return result;
	}

}
