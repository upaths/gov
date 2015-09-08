<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script src="../My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td></td>
		</tr>
	</table>
	<table width="100%" border="1" align="center" cellpadding="0"
		cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
		<tr bgcolor="#f0f0f0">
			<td align="center" bgcolor="#f0f0f0" class="nzcms_table_top">话题评论审核</td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td height="35" colspan="6" align="left" valign="top">
				<table width="100%" border="1" align="center" cellpadding="0"
					cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td class="nzcms_table_top2">序号</td>
						<td class="nzcms_table_top2">状态</td>
						<td class="nzcms_table_top2">姓名</td>
						<td class="nzcms_table_top2">IP</td>
						<td class="nzcms_table_top2">评论</td>
						<td class="nzcms_table_top2">时间</td>
						<td class="nzcms_table_top2">操作</td>
					</tr>
					<c:forEach items="${topicComments }" var="item" varStatus="status">
					<tr onMouseOver="this.bgColor='#E4EDF9';"
						onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
						<td height="30" align="center">${status.count}</td>
						<td align="center">
							<c:choose>
								<c:when test="${item.display }">
									<img src="images/dui.png" alt="已审核" />
								</c:when>
								<c:otherwise>
									<img src="images/no.png" alt="未审核" />
								</c:otherwise>
							</c:choose>
						</td>
						<td align="center">&nbsp;${item.netName}</td>
						<td align="center">&nbsp;${item.ip }</td>
						<td align="center">&nbsp;${item.comment }</td>
						<td align="center">
							<fmt:formatDate value="${item.date}" type="both" />
						</td>
						<td align="center"><c:choose>
							<c:when test="${item.display }">
								<a href="javascript:if(confirm('确定撤销审核？')){window.location.href='topic_commentUpdate.action?topicComment.id=${item.id }&topicComment.display=false&id=${id}';}void(0);"><font class="red">撤销</font></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:window.location.href='topic_commentUpdate.action?topicComment.id=${item.id }&topicComment.display=true&id=${id}';void(0);">审核</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>