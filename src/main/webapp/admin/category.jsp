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
			<td align="center" class="nzcms_table_top">管理信息类别</td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td height="35" align="left"><table width="100%" border="0"
					cellpadding="8" cellspacing="0">
					<tr>
						<td class="gray">
							类别名称： <input id="mc_0_0" type="text" size="18" /> &nbsp;
							顺序： <input id="px_0_0" type="text" size="8" /> 顺序数字越小越排前
						</td>
					</tr>
					<tr id='notes_dj88' style='DISPLAY:'>
						<td><input type="button" class="button"
							id="Submit" value=" 添加 " onclick="go('0','0','insert');" /></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td></td>
		</tr>
	</table>
	<table width="100%" border="1" align="center" cellpadding="5"
		cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
		<tr align="center" bgcolor="#FFFFFF">
			<td align="left" valign="top"><c:forEach items="${list }"
					var="item" varStatus="status">
					<c:choose>
						<c:when test="${empty item.parentId }">
							<table width="100%" border="1" cellpadding="0" cellspacing="0"
								bordercolor="#FFFFFF">
								<tr>
									<td height="25" class="nzcms_table_top2">&nbsp;&nbsp;<img
										src="images/wenj.gif" />&nbsp;&nbsp;${item.mc }&nbsp;&nbsp;（排号&nbsp;${item.px }）
									</td>
									<td width="14%" align="center" class="nzcms_table_top2"><img
										src="images/addinfo.gif" alt="nzcms" />&nbsp;&nbsp;<a
										href="javascript:$('#child_${status.count }').toggle();void(0);">增加小类别</a></td>
									<td width="6%" align="center" class="nzcms_table_top2"><a
										href="javascript:$('#edit_${status.count }').toggle();void(0);">修改</a></td>
									<td width="6%" align="center" class="nzcms_table_top2"><a
										href="javascript:if(window.confirm('会删除本类别及下面的子类别，确认删除？')){del('${item.id }');}void(0);">删除</a></td>
								</tr>
							</table>
							<table id='edit_${status.count }' style='DISPLAY: none' width="100%"
								border="0" cellpadding="5" cellspacing="0" bgcolor="#C9DEFA">
								<tr>
									<td height="35">名称： <input type="text"
										id="mc_0_${status.count }" value="${item.mc }" />
										&nbsp;&nbsp;顺序： <input type="text" id="px_0_${status.count }" value="${item.px }"
										size="5" />
										<input type="hidden" id="id_0_${status.count }" value="${item.id }" />
									</td>
								</tr>
								<tr>
									<td height="35"><input type="button"
										class="button" value="确定修改" onclick="go('0','${status.count}','update');" /></td>
								</tr>
							</table>
							<table id='child_${status.count }' style='DISPLAY: none' width="100%"
								border="0" cellpadding="5" cellspacing="1" bgcolor="#C9DEFA">
								<tr>
									<td height="35" bgcolor="#FFFFFF" class="nzcms_table_top"><a
										href="javascript:$('#child_${status.count }').toggle();void(0);">关闭窗口</a></td>
								</tr>
								<tr>
									<td height="35" bgcolor="#FFFFFF" class="gray">
										<input type="hidden" id="parentId_1_${status.count }" value="${item.id }" />
										名称： <input type="text" id="mc_1_${status.count }" value="" />
									</td>
								</tr>
								<tr>
									<td height="35" bgcolor="#FFFFFF" class="gray">
										顺序： <input type="text" id="px_1_${status.count }" /> 提醒：顺序号数字越小在前台显示就越排前
									</td>
								</tr>
								<tr>
									<td height="35" valign="top" bgcolor="#FFFFFF" class="gray">
										<input type="button" value=" 添加 " class="button" onclick="go('1','${status.count }', 'insert');" /></td>
								</tr>
							</table>
						</c:when>
						<c:otherwise>
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="xux">
								<tr>
									<td height="35" align="left" valign="middle">&nbsp;&nbsp;<font
										color="gray">┣</font>&nbsp;${item.mc }&nbsp;</td>
									<td width="10%" align="center" valign="middle">&nbsp;</td>
									<td width="10%" align="center" valign="middle" class="gray">排号:${item.px }</td>
									<td width="6%" align="center" valign="middle" class="gray"><a
										href="javascript:$('#edit_${status.count }').toggle();void(0);">修改</a></td>
									<td width="6%" align="center" valign="middle"><a
										href="javascript:if(window.confirm('确认删除？')){del('${item.id }');}void(0);">删除</a></td>
								</tr>
							</table>
							<table id='edit_${status.count }' style='DISPLAY: none' width="100%"
								border="0" align="center" cellpadding="0" cellspacing="1"
								bgcolor="#C9DEFA">
								<tr bgcolor="#f0f0f0">
									<td width="12%" bgcolor="#E4EDF9" class="nzcms_table_top">&nbsp;&nbsp;<a
										href="javascript:$('#edit_${status.count }').toggle();void(0);">关闭窗口</a></td>
								</tr>
								<tr align="center" bgcolor="#FFFFFF">
									<td colspan="2" align="left" valign="top">
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td width="89" height="30" align="center" scope="col">名称：</td>
												<td width="658" height="30" scope="col">
													<input type="text" id="mc_0_${status.count }" value="${item.mc }" /></td>
											</tr>
											<tr>
												<td width="89" height="30" align="center" scope="row">顺序：</td>
												<td height="30"><input type="text" id="px_0_${status.count }"
													value="${item.px }" /></td>
											</tr>
											<tr>
												<td height="30" align="center" scope="row">&nbsp;</td>
												<td height="30">
												<input type="hidden" id="id_0_${status.count }" value="${item.id }" />
												<input type="hidden" id="parentId_0_${status.count }" value="${item.parentId }" />
												<input type="button"
													class="button" value=" 修 改 " onclick="go('0','${status.count}','update');" /> <input name="Submit"
													type="reset" class="button" value=" 重 置 " /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</c:otherwise>
					</c:choose>
				</c:forEach></td>
		</tr>
	</table>
</body>
</html>