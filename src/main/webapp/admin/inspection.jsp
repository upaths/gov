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
			<td align="center" bgcolor="#f0f0f0" class="nzcms_table_top">管理巡视组</td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td height="35" colspan="6" align="left" valign="top">
				<table width="100%" border="1" align="center" cellpadding="0"
					cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td class="nzcms_table_top2" width="50">序号</td>
						<td class="nzcms_table_top2">组别</td>
						<td class="nzcms_table_top2">巡视单位</td>
						<td class="nzcms_table_top2">举报邮箱</td>
						<td class="nzcms_table_top2" width="200">操作</td>
					</tr>
					<c:forEach items="${inspectionDetails }" var="item" varStatus="status">
					<tr onMouseOver="this.bgColor='#E4EDF9';"
						onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
						<td height="30" align="center">${status.count}</td>
						<td align="center">&nbsp;${item.team}</td>
						<td align="center">&nbsp;${item.organization }</td>
						<td align="center">&nbsp;${item.report }</td>
						<td align="center">
							<a href="javascript:window.location.href='inspection_toUpdate.action?id=${item.id }';void(0);">修改</a>
							<a href="javascript:if(confirm('确定删除？')){window.location.href='inspection_delete.action?id=${item.id }';}void(0);">删除</a>
							<a href="javascript:window.location.href='inspection_inspectReport.action?id=${item.id }';void(0);">进入邮箱</a>
						</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>