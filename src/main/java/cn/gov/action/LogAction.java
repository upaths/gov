package cn.gov.action;

import java.util.List;

import cn.gov.model.Log;
import cn.gov.service.LogService;
import cn.gov.util.AlertUtil;

public class LogAction extends BasicAction {
	private Log log;
	private LogService logService;
	private List list;
	private Integer[] id;

	public String query() {
		if (getPageBean().getPageSize() < 0) {
			getPageBean().setPageSize(15);
		}
		// 设置记录总数，否则不能正确取得pageSize
		int count = logService.queryCount();
		getPageBean().setTotalRows(count);
		getPageBean().addParam(
				"currentIndex",
				String.valueOf((getPageBean().getCurrentPage() - 1)
						* getPageBean().getPageSize()));
		getPageBean().addParam("pageSize",
				String.valueOf(getPageBean().getPageSize()));
		list = logService.query(getPageBean().getParams());
		return "query";
	}

	public String delete() {
		logService.delete(log.getId());
		AlertUtil.alertThenGo(response, "删除成功！", "log_query.action");
		return null;
	}

	public String delChk() {
		String msg = "";
		if (id != null && id.length > 0) {
			for (Integer i : id) {
				logService.delete(i);
			}
			msg = "删除成功！";
		}
		AlertUtil.alertThenGo(response, msg, "log_query.action");
		return null;
	}
	
	public Log getLog() {
		return log;
	}

	public void setLog(Log log) {
		this.log = log;
	}

	public LogService getLogService() {
		return logService;
	}

	public void setLogService(LogService logService) {
		this.logService = logService;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Integer[] getId() {
		return id;
	}

	public void setId(Integer[] id) {
		this.id = id;
	}
	
}
