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
		var mc = $("#mc");
		var px = $("#px");
		if (mc.val() == "") {
			alert("类别名称不能为空！");
			return false;
		}
		if (px.val() == "") {
			alert("顺序不能为空！");
			return false;
		}
		if (isNaN(px.val())) {
			alert("顺序请输入数字！");
			return false;
		}
		return true;
	}
	
	function go(i, c, action) {
		var mc = $("#mc");
		var parentId = $("#parentId");
		var px = $("#px");
		var id = $("#id");
		mc.val($("#mc_"+i+"_"+c).val());
		parentId.val($("#parentId_"+i+"_"+c).val());
		px.val($("#px_"+i+"_"+c).val());
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
		<input type="hidden" name="category.mc" id="mc" />
		<input type="hidden" name="category.parentId" id="parentId" />
		<input type="hidden" name="category.px" id="px" />
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
				<c:forEach items="${list }" var="item" varStatus="status">

					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="xux">
						<tr>
							<td height="35" align="left" valign="middle">&nbsp;&nbsp;${item.mc }</td>
							<td width="10%" align="center" valign="middle">&nbsp;</td>
							<td width="10%" align="center" valign="middle" class="gray">排号:${item.px }</td>
							<td width="6%" align="center" valign="middle" class="gray"><a
								href="javascript:$('#edit_${status.count }').toggle();void(0);">修改</a></td>
							<td width="6%" align="center" valign="middle"><a
								href="javascript:if(window.confirm('确认删除？')){del('${item.id }');}void(0);">删除</a></td>
						</tr>
					</table>
				</c:forEach></td>
		</tr>
	</table>
</body>
</html>