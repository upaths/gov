package cn.gov.action;

import java.util.Date;
import java.util.List;

import cn.gov.model.Message;
import cn.gov.service.MessageService;
import cn.gov.util.AlertUtil;
import cn.gov.util.IpUtil;
import org.apache.commons.lang.StringEscapeUtils;

public class MessageAction extends BasicAction {
	private Message message;
	private MessageService messageService;
	private List list;

	public String query() {
		if (getPageBean().getPageSize() < 0) {
			getPageBean().setPageSize(15);
		}
		// 设置记录总数，否则不能正确取得pageSize
		int count = messageService.queryMessageCount();
		getPageBean().setTotalRows(count);
		getPageBean().addParam(
				"currentIndex",
				String.valueOf((getPageBean().getCurrentPage() - 1)
						* getPageBean().getPageSize()));
		getPageBean().addParam("pageSize",
				String.valueOf(getPageBean().getPageSize()));
		list = messageService.queryMessage(getPageBean().getParams());
		return "query";
	}

	public String delete() {
		messageService.delete(message.getId());
		AlertUtil.alertThenGo(response, "删除成功！", "msg_query.action");
		return null;
	}
	
	public String insert() {
		message.setIp(IpUtil.getClientIp(request));
		message.setDate(new Date());
		message.setDisplay(false);
		message.setContent(StringEscapeUtils.escapeHtml(message.getContent()));
		message.setNetName(StringEscapeUtils.escapeHtml(message.getNetName()));
		message.setTelephone(StringEscapeUtils.escapeHtml(message.getTelephone()));
		message.setTitle(StringEscapeUtils.escapeHtml(message.getTitle()));
		messageService.insert(message);
		AlertUtil.alertThenGo(response, "留言成功！", request.getContextPath()+"/index.html");
		return null;
	}

	public String update() {
		String msg;
		int cnt = messageService.updateMessage(message);
		msg = cnt > 0 ? "更新成功！" : "更新失败！";
		AlertUtil.alertThenGo(response, msg, "msg_query.action");
		return null;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
}
