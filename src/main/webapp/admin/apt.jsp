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
			<td align="center" bgcolor="#f0f0f0" class="nzcms_table_top"><table
					width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<form action="apt_query.action" method="post">
						<tr>
							<td align="left" style="padding-left: 10px;">
							<strong>预约登记</strong>
       						&nbsp;预约时间：
								<input class="Wdate" type="text" name="begDate" onfocus="WdatePicker()" size="15" value="<fmt:formatDate value="${begDate}" pattern="yyyy-MM-dd" />"/>
								~
								<input class="Wdate" type="text" name="endDate" onfocus="WdatePicker()" size="15" value="<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" />"/>
								<input type="submit" name="Submit2" value="搜索" id="Submit" />
							</td>
						</tr>
					</form>
				</table></td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td height="35" colspan="6" align="left" valign="top">
				<table width="100%" border="1" align="center" cellpadding="0"
					cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td class="nzcms_table_top2">序号</td>
						<td class="nzcms_table_top2">单位名称</td>
						<td class="nzcms_table_top2">领队名称</td>
						<td class="nzcms_table_top2">职务</td>
						<td class="nzcms_table_top2">联系人姓名</td>
						<td class="nzcms_table_top2">联系方式</td>
						<td class="nzcms_table_top2">参观方式</td>
						<td class="nzcms_table_top2">参观内容</td>
						<td class="nzcms_table_top2">参观时间</td>
					</tr>
					<c:forEach items="${list }" var="item" varStatus="status">
					<tr onMouseOver="this.bgColor='#E4EDF9';"
						onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
						<td height="30" align="center"><font class="sidebarblock">${status.count}</font></td>
						<td align="center">&nbsp;${item.orgName}</td>
						<td align="center">&nbsp;${item.leaderName }</td>
						<td align="center">&nbsp;${item.post }</td>
						<td align="center">&nbsp;${item.contactPerson }</td>
						<td align="center">&nbsp;${item.contactInfo }</td>
						<td align="center">&nbsp;${item.number }</td>
						<td align="center">&nbsp;${item.content }</td>
						<td align="center">
							&nbsp;<fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>