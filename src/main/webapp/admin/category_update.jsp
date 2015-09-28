<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
<script type="text/javascript" src="../easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../easyui/easyloader.js"></script>
<script type="text/javascript">
    function check() {
		var name = $("#name");
		var sort = $("#sort");
        var categoryType = $("#categoryType");
		if (name.val() == "") {
			alert("栏目名称不能为空！");
			name.focus();
			return;
		}
        if (categoryType.val() == "") {
            alert("栏目类型不能为空！");
            categoryType.focus();
            return;
        }
		if (sort.val() == "") {
			alert("栏目序号不能为空！");
			sort.focus();
			return;
		}
        if (isNaN(sort.val())) {
            alert("顺序请输入数字！");
            sort.select();
            return;
        }
        if (categoryType.val == "4") {
            var url = $("#url");
            if (url.val() == "") {
                alert("外链地址不能为空！");
                url.focus();
                return;
            }
        }
        var parentId = $('#parentIdComboTree').combotree('getValue');
        $("#parentId").val(parentId)
		$("#myform").submit();
	}
</script>
</head>
<body>
<form name="myform" id="myform" action="category_update.action" method="post" enctype="multipart/form-data">
    <input type="hidden" name="category.id" id="id" value="${category.id}" />
    <input type="hidden" name="category.parentId" id="parentId" value="" />
    <table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td></td>
        </tr>
    </table>
    <table width="100%"  border="1" align="center" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
      <tr bgcolor="#D2E8F6">
        <td height="40" align="center" class="nzcms_table_top" ><a href="javascript:$('#news').toggle();void(0);">说明书<img src="images/help.png" alt="问" border="0" /></a></td>
        <td height="40" align="center" class="nzcms_table_top" >
          修改栏目
      </td>
    </tr>
    <tr bgcolor="#D2E8F6">
      <td height="40" colspan="2" align="left" class="zfb"  id='news' style='DISPLAY:none '>
       <strong>添加说明书：</strong><br /><ol> <li>在此页面修改栏目信息；</li>
      </ol></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >上级栏目：</td>
      <td height="30" class="gray">
          <input class="easyui-combotree" data-options="url:'category_queryFirstLevelCategoryTree.action',required:true" id="parentIdComboTree" style="width: 200px;" value="${category.parentId}" />
          <font color="red">*</font>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#E4EDF9" >栏目名称：</td>
      <td height="30" valign="middle" class="gray" ><input name="category.name" id="name" type="text" size="50" value="${category.name}">
      <font color="red">*</font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="30" align="center" bgcolor="#E4EDF9" >栏目类型：</td>
        <td height="30" valign="middle" class="gray" >
            <select name="category.categoryType" id="categoryType">
                <option value="1" <c:if test="${category.categoryType eq '1'}">selected</c:if>>栏目</option>
                <option value="2" <c:if test="${category.categoryType eq '2'}">selected</c:if>>单页</option>
                <option value="3" <c:if test="${category.categoryType eq '3'}">selected</c:if>>专题</option>
                <option value="4" <c:if test="${category.categoryType eq '4'}">selected</c:if>>外链</option>
                <option value="5" <c:if test="${category.categoryType eq '5'}">selected</c:if>>文件</option>
            </select>
            <font color="red">*</font>
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#E4EDF9" >栏目序号：</td>
      <td height="30"><input name="category.sort" id="sort" type="text" value="${category.sort}" />
          <font color="red">*</font>&nbsp;&nbsp;<font color="gray">根据栏目序号进行排序</font></td>
    </tr>
    <c:if test="${category.categoryType eq '4'}">
        <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#E4EDF9" >外链地址：</td>
            <td height="30" valign="middle" class="gray" ><input name="category.url" id="url" type="text" size="50" value="${category.url}">
                <font color="red">*</font></td>
        </tr>
    </c:if>
    <c:if test="${(category.categoryType eq '1') || (category.categoryType eq '2') || (category.categoryType eq '3')}">
        <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#E4EDF9" >模版页面：</td>
            <td height="30" valign="middle" class="gray" ><input name="category.templet" id="templet" type="text" size="50" value="${category.templet}">
                <font color="red">*</font></td>
        </tr>
    </c:if>
    <tr bgcolor="#FFFFFF">
      <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >是否显示：</td>
      <td height="30"><input name="category.display" type="checkbox" value="true" <c:if test="${category.display}">checked</c:if> style="vertical-align:middle; margin: 0 4px;">
          <font color="gray">(打&quot;√&quot;则会在网页上面显示，否则为隐藏在后台)</font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="30" align="center" bgcolor="#E4EDF9" >缩略图：</td>
        <td height="30" valign="middle" class="gray" >
            <input name="image" id="thumb" type="file" />
            <input type="hidden" name="category.thumb" value="${category.thumb}" />
            <c:if test="${!empty category.thumb }">
                <a href="${pageContext.request.contextPath }${category.thumb}" target="_blank">点击查看缩略图</a>
            </c:if>
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