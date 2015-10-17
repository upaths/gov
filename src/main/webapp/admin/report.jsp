<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery-1.4.min.js"></script>
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
			<td align="center" bgcolor="#f0f0f0" class="nzcms_table_top">四风举报</td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td height="35" colspan="6" align="left" valign="top">
				<table width="100%" border="1" align="center" cellpadding="0"
					cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td width="40" rowspan="2">序号</td>
						<td colspan="3">反映人信息</td>
						<td colspan="2">被反映人信息</td>
						<td colspan="2">反映内容</td>
						<td rowspan="2">附件</td>
						<td width="100" rowspan="2">IP</td>
						<td width="150" rowspan="2">时间</td>
					</tr>
					<tr align="center" bgcolor="#C9DEFA">
						<td>姓名</td>
						<td>联系电话</td>
						<td>工作单位（住址）及职务</td>
						<td>姓名</td>
						<td>工作单位（住址）及职务</td>
						<td>标题</td>
						<td>主要问题</td>
					</tr>
					<c:forEach items="${reports }" var="item" varStatus="status">
					<tr onMouseOver="this.bgColor='#E4EDF9';"
						onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
						<td height="30" align="center">${status.count}</td>
						<td align="center">&nbsp;${item.reportName}</td>
						<td align="center">&nbsp;${item.reportContact }</td>
						<td align="center">&nbsp;${item.reportCondition }</td>
						<td align="center">&nbsp;${item.reportedName }</td>
						<td align="center">&nbsp;${item.reportedCondition }</td>
						<td align="center">&nbsp;${item.title }</td>
						<td align="center">&nbsp;${item.problem }</td>
						<td align="center">&nbsp;
							<c:if test="${!empty item.doc}">
								<a href="${pageContext.request.contextPath}${item.doc}" target="_blank">查看</a>
							</c:if>
						</td>
						<td align="center">&nbsp;${item.ip }</td>
						<td align="center">
							<fmt:formatDate value="${item.date}" type="both" />
						</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>