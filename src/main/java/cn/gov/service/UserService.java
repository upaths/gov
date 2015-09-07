package cn.gov.service;

import java.util.List;
import java.util.Map;

import cn.gov.model.Role;
import cn.gov.model.User;
import cn.gov.model.UserRole;

public interface UserService {
	
	public void insert(User user);
	
	public int updateSelective(User user);
	
	public List<Map> query();
	
	public int delete(String username);
	
	public boolean check(String username, String password);
	
	public boolean isNameExists(String username);

	public List<Role> queryRoles();

	public int updateUserRole(UserRole userRole);

	public void insertUserRole(UserRole userRole);

	public int deleteUserRole(String username);

	public Role queryRoleByUsername(String username);

}
