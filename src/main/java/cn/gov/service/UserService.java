package cn.gov.service;

import java.util.List;

import cn.gov.model.User;

public interface UserService {
	
	public void insert(User user);
	
	public int update(User user);
	
	public List query();
	
	public int delete(String username);
	
	public boolean check(String username, String password);
	
	public boolean isNameExists(String username);
}
