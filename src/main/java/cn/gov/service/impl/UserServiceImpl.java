package cn.gov.service.impl;

import java.util.List;
import java.util.Map;

import cn.gov.dao.ExtraMapper;
import cn.gov.dao.RoleMapper;
import cn.gov.dao.UserMapper;
import cn.gov.dao.UserRoleMapper;
import cn.gov.model.*;
import cn.gov.service.UserService;
import cn.gov.util.MD5Util;

public class UserServiceImpl implements UserService {
	private UserMapper userMapper;
	private ExtraMapper extraMapper;
	private RoleMapper roleMapper;
	private UserRoleMapper userRoleMapper;

	public void insert(User user) {
		user.setPassword(MD5Util.md5(user.getPassword()));
		userMapper.insert(user);
	}

	public List<Map> query() {
		return extraMapper.queryAllUser();
	}

	public int delete(String username) {
		return userMapper.deleteByPrimaryKey(username);
	}

	public int updateSelective(User user) {
		if (user.getPassword() != null && !"".equals(user.getPassword())) {
			user.setPassword(MD5Util.md5(user.getPassword()));
		}
		return userMapper.updateByPrimaryKeySelective(user);
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

	@Override
	public List<Role> queryRoles() {
		return roleMapper.selectByExample(null);
	}

	@Override
	public int updateUserRole(UserRole userRole) {
		UserRoleExample userRoleExample = new UserRoleExample();
		userRoleExample.createCriteria().andUsernameEqualTo(userRole.getUsername());
		return userRoleMapper.updateByExampleSelective(userRole, userRoleExample);
	}

	@Override
	public void insertUserRole(UserRole userRole) {
		userRoleMapper.insert(userRole);
	}

	@Override
	public int deleteUserRole(String username) {
		UserRoleExample userRoleExample = new UserRoleExample();
		userRoleExample.createCriteria().andUsernameEqualTo(username);
		return userRoleMapper.deleteByExample(userRoleExample);
	}

	@Override
	public Role queryRoleByUsername(String username) {
		UserRoleExample userRoleExample = new UserRoleExample();
		userRoleExample.createCriteria().andUsernameEqualTo(username);
		List<UserRole> userRoleList = userRoleMapper.selectByExample(userRoleExample);
		if (userRoleList != null && userRoleList.size() > 0) {
			return roleMapper.selectByPrimaryKey(userRoleList.get(0).getRoleId());
		}
		return null;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public ExtraMapper getExtraMapper() {
		return extraMapper;
	}

	public void setExtraMapper(ExtraMapper extraMapper) {
		this.extraMapper = extraMapper;
	}

	public RoleMapper getRoleMapper() {
		return roleMapper;
	}

	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}

	public UserRoleMapper getUserRoleMapper() {
		return userRoleMapper;
	}

	public void setUserRoleMapper(UserRoleMapper userRoleMapper) {
		this.userRoleMapper = userRoleMapper;
	}
}
