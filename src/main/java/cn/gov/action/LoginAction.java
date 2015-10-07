package cn.gov.action;

import java.util.Date;

import cn.gov.model.Log;
import cn.gov.model.User;
import cn.gov.service.LogService;
import cn.gov.service.ReportService;
import cn.gov.service.UserService;
import cn.gov.util.IpUtil;

import com.opensymphony.xwork2.ActionContext;

public class LoginAction extends BasicAction {
	private String username;
	private String password;
	private String rand; // 表单中的rand
	private UserService userService;
	private LogService logService;
	private ReportService reportService;

	@SuppressWarnings("unchecked")
	public String execute() {
		Log log = new Log();
		log.setUsername(username);
		log.setIp(IpUtil.getClientIp(request));
		log.setLoginTime(new Date());
		log.setSuccess(false);
		String isSuc = LOGIN;
		// 从session中取出RandomAction.java 中生成的验证码random
		String arandom = (String) (ActionContext.getContext().getSession().get("random"));
		// 下面就是将session中保存验证码字符串与客户输入的验证码字符串对比了
		if (rand != null && rand.equals(arandom)) {
			if (userService.check(username, password)) {
				ActionContext.getContext().getSession().put("user", username);
				log.setSuccess(true);
				isSuc = SUCCESS;
			}
		}
		logService.insert(log);
		User user = new User();
		user.setUsername(username);
		user.setIp(IpUtil.getClientIp(request));
		user.setLoginTime(new Date());
		userService.updateSelective(user);
		return isSuc;
	}

	public String reportLogin() {
		String isSuc = LOGIN;
		// 从session中取出RandomAction.java 中生成的验证码random
		String arandom = (String) (ActionContext.getContext().getSession().get("random"));
		// 下面就是将session中保存验证码字符串与客户输入的验证码字符串对比了
		if (rand != null && rand.equals(arandom)) {
			if (reportService.check(username, password)) {
				ActionContext.getContext().getSession().put("report_user", username);
				isSuc = SUCCESS;
			}
		}
		return isSuc;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public LogService getLogService() {
		return logService;
	}

	public void setLogService(LogService logService) {
		this.logService = logService;
	}

	public ReportService getReportService() {
		return reportService;
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}
}
