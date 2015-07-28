<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script charset="utf-8" src="editor/kindeditor-min.js"></script>
<script charset="utf-8" src="editor/lang/zh_CN.js"></script>
<script>
	var editor;
	$(function() {
		editor = KindEditor.create('textarea[name="organization.description"]', {
			cssPath : 'editor/plugins/code/prettify.css',
			uploadJson : 'upload_json.jsp',
			fileManagerJson : 'file_manager_json.jsp',
			allowFileManager : true
		});
	});
	function check() {
		var dwmc = $("#dwmc");
		var px = $("#px");
		var description = $("#description");
		if (dwmc.val() == "") {
			alert("名称不能为空！");
			dwmc.focus();
			return;
		}
		if (px.val() == "") {
			alert("顺序不能为空！");
			px.focus();
			return;
		}
		if (isNaN(px.val())) {
			alert("顺序请输入数字！");
			px.select();
			return;
		}
		description.val(editor.html());
		$("#myform").submit();
	}
</script>
</head>
<body>
<form name="myform" id="myform" action="organization_insert.action" method="post">
<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="100%"  border="1" align="center" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
    <tr bgcolor="#D2E8F6">
      <td height="40" align="center" class="nzcms_table_top" ><a href="javascript:$('#news').toggle();void(0);">说明书<img src="images/help.png" alt="问" border="0" /></a></td>
      <td height="40" align="center" class="nzcms_table_top" >添加新的信息内容</td>
    </tr>
    <tr bgcolor="#D2E8F6">
      <td height="40" colspan="2" align="left" class="zfb"  id='news' style='DISPLAY:none '>
       <strong>添加说明书：</strong><br /><ol> <li>在此页面添加机构设置一级分类，添加的信息会展示在首页机构设置模块下；</li>
       <li>在首页中点击机构设置中的一级分类时，将展示二级分类和该类别的描述；</li>
      </ol></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >名称：</td>
      <td height="30" class="gray"><input name="organization.dwmc" type="text" id="dwmc" size="20" maxlength="20"/>
          <font color="red">*</font>组织机构名称
    </tr>
    <c:if test="${!empty parentId }">
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#E4EDF9" >上级单位：</td>
      <td height="30" valign="middle" class="gray" >
      <select name="organization.parentId">
      	<c:forEach items="${list }" var="item">
      		<option value="${item.id }" <c:if test="${item.id == parentId }">selected</c:if>>${item.dwmc }</option>
      	</c:forEach>
      </select>
      该单位的上级管理单位</td>
    </tr>
    </c:if>
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#E4EDF9" >顺序：</td>
      <td height="30" valign="middle" class="gray" ><input name="organization.px" type="text" id="px" size="8" maxlength="10" />
      顺序数字越小越排前</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >描述：</td>
      <td height="30" valign="top">
      	<textarea name="organization.description" id="description" cols="100" rows="8" style="width:700px;height:370px;visibility:hidden;"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="10%" height="30" bgcolor="#E4EDF9" >&nbsp;</td>
      <td height="30"><input type="button" class="button" value=" 提 交 " onclick="check();">
          <input type="reset" class="button" value=" 重 来 ">
          <input type="button" class="button" onClick="history.go(-1);" value=" 返 回 "></td>
    </tr>
</table>
</form>
</body>
</html>