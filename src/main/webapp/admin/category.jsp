<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript" src="../script/script.js"></script>
<script type="text/javascript">
	function check() {
		var name = $("#name");
		var sort = $("#sort");
		if (name.val() == "") {
			alert("类别名称不能为空！");
			return false;
		}
		if (sort.val() == "") {
			alert("顺序不能为空！");
			return false;
		}
		if (isNaN(sort.val())) {
			alert("顺序请输入数字！");
			return false;
		}
		return true;
	}
	
	function go(i, c, action) {
		var name = $("#name");
		var parentId = $("#parentId");
		var sort = $("#sort");
		var id = $("#id");
		name.val($("#mc_"+i+"_"+c).val());
		parentId.val($("#parentId_"+i+"_"+c).val());
		sort.val($("#px_"+i+"_"+c).val());
		if ($("#id_"+i+"_"+c)) {
			id.val($("#id_"+i+"_"+c).val());
		}
		if (check()) {
			$("#myform").attr("action", "category_"+action+".action");
			$("#myform").submit();
		}
	}
	
	function del(id) {
		window.location.href='category_delete.action?category.id='+id;
	}
</script>
</head>
<body>
	<form name="myform" id="myform" method="post" action=""
		style="margin: 0;">
		<input type="hidden" name="category.id" id="id" />
		<input type="hidden" name="category.name" id="name" />
		<input type="hidden" name="category.parentId" id="parentId" />
		<input type="hidden" name="category.sort" id="sort" />
	</form>
	<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td></td>
		</tr>
	</table>
	<table width="100%" border="1" align="center" cellpadding="5"
		cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
		<tr bgcolor="#f0f0f0">
			<td height="40" align="center" class="nzcms_table_top">管理栏目</td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td align="left" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="xux" bgcolor="#C4D8ED">
					<tr>
						<td height="35" align="center" valign="middle">栏目名称</td>
						<td width="10%" align="center" valign="middle">栏目类型</td>
						<td width="10%" align="center" valign="middle">导航是否显示</td>
						<td width="10%" align="center" valign="middle">排号</td>
						<td width="15%" align="center" valign="middle">管理操作</td>
					</tr>
				</table>
				<c:forEach items="${list }" var="item" varStatus="status">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="xux">
						<tr>
							<td height="35" align="left" valign="middle">&nbsp;&nbsp;${item.name }</td>
							<td width="10%" align="center" valign="middle">
								<c:if test="${item.categoryType eq '1'}">栏目</c:if>
								<c:if test="${item.categoryType eq '2'}">单页</c:if>
								<c:if test="${item.categoryType eq '3'}">专题</c:if>
								<c:if test="${item.categoryType eq '4'}">外链</c:if>
								<c:if test="${item.categoryType eq '5'}">文件</c:if>
							</td>
							<td width="10%" align="center" valign="middle">
								<c:if test="${!item.display }">不显示</c:if>
								<c:if test="${item.display }">显示</c:if>
							</td>
							<td width="10%" align="center" valign="middle">${item.sort }</td>
							<td width="15%" align="center" valign="middle">
								<a href="category_toAdd.action?type=${item.categoryType}&parentId=${item.id}">增加子栏目</a>|
								<a href="category_toUpdate.action?id=${item.id}">修改</a>|
								<a href="javascript:if(window.confirm('确认删除？')){del('${item.id }');}void(0);">删除</a>
							</td>
						</tr>
					</table>
				</c:forEach>
			</td>
		</tr>
	</table>
</body>
</html>