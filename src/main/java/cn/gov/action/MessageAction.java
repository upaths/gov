package cn.gov.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.gov.model.Message;
import cn.gov.model.MessageReply;
import cn.gov.service.MessageService;
import cn.gov.util.AlertUtil;
import cn.gov.util.IpUtil;
import org.apache.commons.lang.StringEscapeUtils;

public class MessageAction extends BasicAction {
	private Message message;
	private MessageService messageService;
	private List<Message> list;
	private Map<Integer, Integer> replyCnt;
	private List<MessageReply> replyList;
	private MessageReply messageReply;
	private Integer replyId;
	private Integer msgId;

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
		if (list != null) {
			replyCnt = new HashMap<Integer, Integer>();
			for (Message msg : list) {
				replyCnt.put(msg.getId(), messageService.countMsgReply(msg.getId()));
			}
		}
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

	public String reply() {
		replyList = messageService.queryMsgReply(msgId);
		return "reply";
	}

	public String deleteReply() {
		String msg;
		int cnt = messageService.deleteMsgReply(replyId);
		msg = cnt > 0 ? "删除成功！" : "删除失败！";
		AlertUtil.alertThenGo(response, msg, "msg_reply.action?msgId="+msgId);
		return null;
	}

	public String insertReply() {
		messageReply.setDate(new Date());
		messageReply.setMessageId(msgId);
		messageService.insertMsgReply(messageReply);
		AlertUtil.alertThenGo(response, "答复成功！", "msg_reply.action?msgId="+msgId);
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

	public List<Message> getList() {
		return list;
	}

	public void setList(List<Message> list) {
		this.list = list;
	}

	public Map<Integer, Integer> getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(Map<Integer, Integer> replyCnt) {
		this.replyCnt = replyCnt;
	}

	public List<MessageReply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<MessageReply> replyList) {
		this.replyList = replyList;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	public MessageReply getMessageReply() {
		return messageReply;
	}

	public void setMessageReply(MessageReply messageReply) {
		this.messageReply = messageReply;
	}
}
