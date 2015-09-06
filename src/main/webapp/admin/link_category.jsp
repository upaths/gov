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
		function check(form) {
			var name = form["linkCategory.name"];
			var sort = form["linkCategory.sort"];
			if (name.value == "") {
				alert("名称不能为空！");
				return false;
			}

			if (sort.value == "") {
				alert("顺序不能为空！");
				return false;
			}
			if (isNaN(sort.value)) {
				alert("顺序请输入数字！");
				return false;
			}
			return true;
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
				class="nzcms_table_top" bgcolor="#FFFFFF">
				链接类型管理
			</td>
		</tr>
		<tr>
			<td align="left" valign="top" bgcolor="#FFFFFF" class="z">
				<table width="100%" border="1" cellpadding="0" cellspacing="1"
					bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td width="50" class="nzcms_table_top2">ID</td>
						<td class="nzcms_table_top2">名称</td>
						<td class="nzcms_table_top2">序号</td>
						<td width="100" class="nzcms_table_top2">操作</td>
					</tr>
					<c:forEach items="${list }" var="item" varStatus="status">
						<tr onMouseOver="this.bgColor='#E4EDF9';"
							onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
							<form method="post" action="link_cat_update.action" onsubmit="return check(this)">
							<td height="30" align="center">
								${item.id }
								<input name="linkCategory.id" type="hidden" value="${item.id }">
							</td>
							<td align="center"><input name="linkCategory.name" type="text" value="${item.name }" /></td>
							<td align="center"><input name="linkCategory.sort" type="text" value="${item.sort }" /></td>
							<td align="center">
								<input type="submit" class="button" value="修改" />|
								<a href="javascript:if(window.confirm('确认删除？')){window.location.href='link_cat_delete.action?id=${item.id}';}void(0);">删除</a>
							</td>
							</form>
						</tr>
					</c:forEach>
					<form action="link_cat_insert.action" method="post" onsubmit="return check(this)">
						<tr onMouseOver="this.bgColor='#E4EDF9';"
							onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
							<td height="30" align="center">新增</td>
							<td align="center"><input name="linkCategory.name" type="text" /></td>
							<td align="center"><input name="linkCategory.sort" type="text" /></td>
							<td align="center">
								<input type="submit" class="button" value="添加" />
							</td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>