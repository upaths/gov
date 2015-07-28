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
	function edit(id) {
		window.location.href='organization_toUpdate.action?organization.id='+id;
	}
	
	function del(id) {
		window.location.href='organization_delete.action?organization.id='+id;
	}
</script>
</head>
<body>
	<form name="form1" method="post" action="" style="margin: 0;">
		<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<table width="100%" border="1" align="center" cellpadding="5"
			cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
			<tr bgcolor="#f0f0f0">
				<td height="40" align="center" class="nzcms_table_top">管理机构类别</td>
			</tr>
			<tr align="center" bgcolor="#FFFFFF">
				<td align="left" valign="top">
					<table width="100%" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#FFFFFF">
						<c:forEach items="${list }" var="item">
						<c:choose>
						<c:when test="${empty item.parentId }">
							<tr>
								<td height="25" class="nzcms_table_top2">&nbsp;&nbsp;<img
									src="images/wenj.gif" alt="nzcms" />&nbsp;&nbsp;${item.dwmc }&nbsp;&nbsp;（排号&nbsp;${item.px }）
								</td>
								<td width="14%" align="center" class="nzcms_table_top2"><img
									src="images/addinfo.gif" alt="nzcms" />&nbsp;&nbsp;<a
									href="javascript:window.location.href='organization_toAdd.action?parentId=${item.id }'">增加小类别</a></td>
								<td width="6%" align="center" class="nzcms_table_top2"><a
									href="javascript:edit('${item.id }');void(0);">修改</a></td>
								<td width="6%" align="center" class="nzcms_table_top2"><a
									href="javascript:if(window.confirm('会删除本单位及下面的子单位，确认删除？')){del('${item.id }');}void(0);">删除</a></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
							<td colspan="4">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="xux">
					          <tr>
					            <td height="35" align="left" valign="middle">&nbsp;&nbsp;<font color="gray">┣</font>&nbsp;${item.dwmc }&nbsp;</td>
					            <td width="10%" align="center" valign="middle">&nbsp;</td>
					            <td width="10%" align="center" valign="middle" class="gray" >排号:${item.px }</td>
					            <td width="6%" align="center" valign="middle" class="gray" ><a href="javascript:edit('${item.id }');void(0);">修改</a></td>
					            <td width="6%" align="center" valign="middle" ><a href="javascript:if(window.confirm('确认删除？')){del('${item.id }');}void(0);">删除</a></td>
					          </tr>
					        </table>
					        </td>
					        </tr>
						</c:otherwise>
						</c:choose>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>