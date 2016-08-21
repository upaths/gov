<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript" src="../script/script.js"></script>
</head>
<body>
	<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td></td>
		</tr>
	</table>
	<table width="100%" border="1" align="center" cellpadding="0"
		cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED" id="2">
		<tr>
			<td height="40" align="center" valign="middle"
				class="nzcms_table_top" bgcolor="#FFFFFF">留言答复</td>
		</tr>
		<tr>
			<td align="left" valign="top" bgcolor="#FFFFFF" class="z">
				<table width="100%" border="1" cellpadding="0" cellspacing="1"
					bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td class="nzcms_table_top2" width="50">序号</td>
						<td class="nzcms_table_top2">答复</td>
						<td class="nzcms_table_top2" width="150">时间</td>
						<td class="nzcms_table_top2" width="80">操作</td>
					</tr>
					<c:forEach items="${replyList }" var="item" varStatus="status">
						<tr onMouseOver="this.bgColor='#E4EDF9';"
							onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
							<td height="30" align="center">${status.count }</td>
							<td align="center">${item.reply }</td>
							<td align="center">
								<fmt:formatDate value="${item.date}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td align="center">
								<a href="javascript:if(confirm('确定删除？')){window.location.href='msg_deleteReply.action?replyId=${item.id }&msgId=${msgId}';}void(0);">删除</a>
							</td>
						</tr>
					</c:forEach>
					<form id="reply_form" action="msg_insertReply.action" method="post">
						<input type="hidden" name="msgId" value="${msgId}" />
						<tr onMouseOver="this.bgColor='#E4EDF9';"
							onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
							<td height="30" align="center">新增</td>
							<td align="center" colspan="2"><input name="messageReply.reply" id="reply" style="width: 100%" /></td>
							<td align="center">
								<a href="javascript:if($('#reply').val()==''){alert('请填写答复内容！');}else{$('#reply_form').submit();}void(0);">答复</a>
							</td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>