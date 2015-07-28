package cn.gov.action;

import java.io.IOException;
import java.util.List;

import cn.gov.model.User;
import cn.gov.service.UserService;
import cn.gov.util.AlertUtil;

public class UserAction extends BasicAction {
	private User user;
	private UserService userService;
	private List list;
	public String query() {
		list = userService.query();
		return "query";
	}
	
	public String upt() {
		String msg;
		if (userService.update(user) > 0) {
			msg = "更新成功！";
		}else {
			msg = "更新失败！";
		}
		AlertUtil.alertThenGo(response, msg, "user_query.action");
		return null;
	}
	
	public String del() {
		String msg;
		if (userService.delete(user.getUsername()) > 0) {
			msg = "删除成功！";
		}else {
			msg = "删除失败！";
		}
		AlertUtil.alertThenGo(response, msg, "user_query.action");
		return null;
	}
	
	public String toAdd() {
		return "toAdd";
	}
	
	public String check() {
		String flag = "0"; //默认用户名不存在
		if (userService.isNameExists(user.getUsername())) {
			flag = "1"; // 用户名已存在
		}
		try {
			response.getWriter().write(flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String add() {
		userService.insert(user);
		AlertUtil.alertThenGo(response, "添加成功！", "user_query.action");
		return null;
	}
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
