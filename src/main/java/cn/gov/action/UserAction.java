package cn.gov.action;

import java.io.IOException;
import java.util.List;

import cn.gov.model.ReportAdmin;
import cn.gov.model.Role;
import cn.gov.model.User;
import cn.gov.model.UserRole;
import cn.gov.service.ReportService;
import cn.gov.service.UserService;
import cn.gov.util.AlertUtil;
import com.opensymphony.xwork2.ActionContext;

public class UserAction extends BasicAction {
	private User user;
	private UserService userService;
	private List list;
	private List<Role> roleList;
	private Integer roleId;
	private ReportService reportService;
	private ReportAdmin reportAdmin;
	public String query() {
		list = userService.query();
		roleList = userService.queryRoles();
		return "query";
	}
	
	public String upt() {
		String msg;
		int cnt = userService.updateSelective(user);
		UserRole userRole = new UserRole();
		userRole.setUsername(user.getUsername());
		userRole.setRoleId(roleId);
		cnt += userService.updateUserRole(userRole);
		if (cnt >= 2) {
			msg = "更新成功！";
		}else {
			msg = "更新失败！";
		}
		AlertUtil.alertThenGo(response, msg, "user_query.action");
		return null;
	}
	
	public String del() {
		String msg;
		int cnt = userService.deleteUserRole(user.getUsername());
		cnt += userService.delete(user.getUsername());
		if (cnt >= 2) {
			msg = "删除成功！";
		}else {
			msg = "删除失败！";
		}
		AlertUtil.alertThenGo(response, msg, "user_query.action");
		return null;
	}
	
	public String toAdd() {
		roleList = userService.queryRoles();
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
		UserRole userRole = new UserRole();
		userRole.setUsername(user.getUsername());
		userRole.setRoleId(roleId);
		userService.insertUserRole(userRole);
		AlertUtil.alertThenGo(response, "添加成功！", "user_query.action");
		return null;
	}

	public String toChangePassword() {
		return "toChangePassword";
	}

	public String changePassword() {
		String msg;
		String username = (String) ActionContext.getContext().getSession().get("user");
		if (username != null && !"".equals(username)) {
			user.setUsername(username);
			int cnt = userService.updateSelective(user);
			if (cnt > 0) {
				msg = "修改成功，请重新登录！";
				request.getSession().invalidate();
			}else {
				msg = "修改失败！";
			}
		}else {
			msg = "修改失败！";
		}
		AlertUtil.alertThenGo(response, msg, "user_toChangePassword.action");
		return null;
	}

	public String changeReportPassword() {
		String msg;
		String username = (String) ActionContext.getContext().getSession().get("report_user");
		if (username != null && !"".equals(username)) {
			reportAdmin.setUsername(username);
			int cnt = reportService.updateReportAdminSelective(reportAdmin);
			if (cnt > 0) {
				msg = "修改成功，请重新登录！";
				request.getSession().invalidate();
			}else {
				msg = "修改失败！";
			}
		}else {
			msg = "修改失败！";
		}
		AlertUtil.alertThenGo(response, msg, "user_chg_pwd.jsp");
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

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public ReportService getReportService() {
		return reportService;
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

	public ReportAdmin getReportAdmin() {
		return reportAdmin;
	}

	public void setReportAdmin(ReportAdmin reportAdmin) {
		this.reportAdmin = reportAdmin;
	}
}
