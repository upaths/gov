package cn.gov.service.impl;

import java.util.List;

import cn.gov.dao.UserMapper;
import cn.gov.model.User;
import cn.gov.model.UserExample;
import cn.gov.service.UserService;
import cn.gov.util.MD5Util;

public class UserServiceImpl implements UserService {
	private UserMapper userMapper;

	public void insert(User user) {
		user.setPassword(MD5Util.md5(user.getPassword()));
		userMapper.insert(user);
	}

	public List query() {
		return userMapper.selectByExample(null);
	}

	public int delete(String username) {
		return userMapper.deleteByPrimaryKey(username);
	}

	public int update(User user) {
		user.setPassword(MD5Util.md5(user.getPassword()));
		return userMapper.updateByPrimaryKey(user);
	}

	public boolean check(String username, String password) {
		User u = userMapper.selectByPrimaryKey(username);
		if (u != null && u.getPassword().equals(MD5Util.md5(password))) {
			return true;
		}
		return false;
	}

	public boolean isNameExists(String username) {
		return userMapper.selectByPrimaryKey(username) != null;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

}
