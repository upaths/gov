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
	<script type="text/javascript">
		function check() {
			var ip = $("#ip");
			if (ip.val() == "") {
				alert("IP不能为空！");
				ip.focus();
				return;
			}
			$("#myform").submit();
		}
	</script>
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
				class="nzcms_table_top" bgcolor="#FFFFFF">IP地址禁止</td>
		</tr>
		<tr>
			<td align="left" valign="top" bgcolor="#FFFFFF" class="z">
				<table width="100%" border="1" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td class="nzcms_table_top2">序号</td>
						<td class="nzcms_table_top2">IP地址</td>
						<td width="10%" class="nzcms_table_top2">操作</td>
					</tr>
					<c:forEach items="${list }" var="item" varStatus="status">
						<tr onMouseOver="this.bgColor='#E4EDF9';"
							onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
							<td align="center">${status.count }</td>
							<td align="center">${item.ip }</td>
							<td align="center">
								<a href="ip_forbid_delete.action?id=${item.id }" onclick="return confirm('确定删除？')">删除</a>
							</td>
						</tr>
					</c:forEach>
					<form action="ip_forbid_insert.action" name="myform" id="myform">
						<tr onMouseOver="this.bgColor='#E4EDF9';"
							onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
							<td align="center">新增</td>
							<td align="center"><input name="ipForbid.ip" id="ip" /></td>
							<td align="center">
								<a href="javascript:check();void(0);">保存</a>
							</td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>