package org.jgs1905.service;

import java.sql.SQLException;

import org.jgs1905.dao.CommentDao;
import org.jgs1905.entity.Comment;

public class CommentService {
	
	private CommentDao commentDao = new CommentDao();

	/**
	 * 
	 * @param comment
	 * @return
	 * @throws SQLException 
	 */
	public int add(Comment comment) throws SQLException {
		return commentDao.insert(comment);
	}

}
