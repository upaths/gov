<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../script/jquery-1.4.min.js"></script>
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
			<td align="center" bgcolor="#f0f0f0" class="nzcms_table_top">署名举报</td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td height="35" colspan="6" align="left" valign="top">
				<table width="100%" border="1" align="center" cellpadding="0"
					cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td width="40" rowspan="2">序号</td>
						<td width="50" rowspan="2">地区</td>
						<td colspan="3">反映人信息</td>
						<td colspan="3">被反映人信息</td>
						<td colspan="3">反映内容</td>
						<td width="80" rowspan="2">IP</td>
						<td width="100" rowspan="2">时间</td>
						<td width="70" rowspan="2">处置状态</td>
						<td width="70" rowspan="2">操作</td>
					</tr>
					<tr align="center" bgcolor="#C9DEFA">
						<td>姓名</td>
						<td>联系方式</td>
						<td>现居住地址</td>
						<td>姓名</td>
						<td>单位</td>
						<td>职务</td>
						<td>标题</td>
						<td>问题类别</td>
						<td>问题细类</td>
					</tr>
					<c:forEach items="${reportMsgs }" var="item" varStatus="status">
					<tr onMouseOver="this.bgColor='#E4EDF9';"
						onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
						<td height="30" align="center">${status.count}</td>
						<td align="center">${item.org}</td>
						<td align="center">${item.reportName}</td>
						<td align="center">${item.reportContact }</td>
						<td align="center">${item.reportAddress }</td>
						<td align="center">${item.reportedName }</td>
						<td align="center">${item.reportedOrg }</td>
						<td align="center">${item.reportedPost }</td>
						<td align="center">${item.title }</td>
						<td align="center">${item.problemType }</td>
						<td align="center">${item.problemTypeDetail }</td>
						<td align="center">${item.ip }</td>
						<td align="center">
							<fmt:formatDate value="${item.date}" type="both" />
						</td>
						<td align="center">
							<c:if test="${item.answered != null && item.answered}">已答复</c:if>
							<c:if test="${item.answered == null || item.answered == false}">未答复</c:if>
						</td>
						<td align="center">
							<a href="signReportDetail.action?msgId=${item.id}">答复</a>
						</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>