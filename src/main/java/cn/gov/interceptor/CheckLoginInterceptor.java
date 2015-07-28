package cn.gov.interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckLoginInterceptor extends AbstractInterceptor {

	public String intercept(ActionInvocation ai) throws Exception {
		String username = (String)ai.getInvocationContext().getSession().get("user");
		if (username == null || "".equals(username)) {
			return Action.LOGIN;
		}else {
			return ai.invoke();
		}
	}

}
