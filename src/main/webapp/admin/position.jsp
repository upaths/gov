<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
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
				class="nzcms_table_top" bgcolor="#FFFFFF">
				<input type="button" value="新增" style="float: right;position:relative;right:20px;padding:0 10px;color:red;" onclick="window.location.href='position_toAdd.action'">
				推荐位管理
			</td>
		</tr>
		<tr>
			<td align="left" valign="top" bgcolor="#FFFFFF" class="z">
				<table width="100%" border="1" cellpadding="0" cellspacing="1"
					bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td width="150" class="nzcms_table_top2">推荐位ID</td>
						<td class="nzcms_table_top2">推荐位名称</td>
						<td width="50" class="nzcms_table_top2">序号</td>
						<td width="100" class="nzcms_table_top2">操作</td>
					</tr>
					<c:forEach items="${list }" var="item" varStatus="status">
						<tr onMouseOver="this.bgColor='#E4EDF9';"
							onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
							<td height="30" align="center">${item.id }</td>
							<td align="center">${item.name }</td>
							<td align="center">${item.sort }</td>
							<td align="center">
								<a href="position_toUpdate.action?position.id=${item.id}">修改</a>|
								<a href="javascript:if(window.confirm('确认删除？')){window.location.href='position_delete.action?position.id=${item.id}';}void(0);">删除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>