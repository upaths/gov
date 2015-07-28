package cn.gov.action;

import java.util.Date;
import java.util.List;

import cn.gov.model.Message;
import cn.gov.service.MessageService;
import cn.gov.util.AlertUtil;
import cn.gov.util.IpUtil;

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
		message.setRq(new Date());
		messageService.insert(message);
		AlertUtil.alertThenGo(response, "留言成功，我们会尽快与您联系！", "message.jsp");
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
