<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function check(form) {
	var name = form["links.name"];
	var url = form["links.url"];
	var sort = form["links.sort"];
	if (name.value == "") {
		alert("网站名称不能为空！");
		return false;
	}
	if (url.value == "") {
		alert("网站地址不能为空！");
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
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED" class="tableBorder">
  <form action="links_insert.action" method="post" id="form0" onsubmit="return check(this)">
    <tr>
      <td height="40" colspan="5" align="center" class="nzcms_table_top" >
        <input type="button" value="链接类型管理" style="float: right;position:relative;right:20px;padding:0 10px;color:red;" onclick="window.location.href='link_cat_query.action'">
        添加文字链接
      </td>
    </tr>
    <tr bgcolor="#F9F9F9">
      <td height="20" align="center" class="nzcms_table_top2">网站名称 </td>
      <td align="center" bgcolor="#F9F9F9" class="nzcms_table_top2">链接类型 </td>
      <td align="center" bgcolor="#F9F9F9" class="nzcms_table_top2">网站地址 </td>
      <td width="7%" align="center" class="nzcms_table_top2">排 序 </td>
      <td width="15%" align="center" class="nzcms_table_top2">操 作 </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#FFFFFF">
      	<input name="links.name" type="text" id="name" />
      </td>
      <td align="center" bgcolor="#FFFFFF">
        <select name="links.lb">
          <c:forEach items="${linkCategoryList}" var="lb">
            <option value="${lb.id}">${lb.name}</option>
          </c:forEach>
        </select>
      </td>
      <td align="center" bgcolor="#FFFFFF">
        <input name="links.url" type="text" id="url" size="50" />
      </td>
      <td align="center" bgcolor="#FFFFFF">
      	<input name="links.sort" type="text" id="sort" value="${sort }" size="3" />
      </td>
      <td align="center" bgcolor="#FFFFFF">
      	<input name="Submit2" type="submit" class="button" value="添加" />
      </td>
    </tr>
  </form>
</table>
<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<c:if test="${!empty list }">
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED" class="tableBorder" id="2">
  <tr>
    <td height="40" colspan="6" align="center" class="nzcms_table_top" >文字链接列表</td>
  </tr>
  <tr bgcolor="#f9f9f9">
    <td align="center" class="nzcms_table_top2">网站名称</td>
    <td align="center" bgcolor="#F9F9F9" class="nzcms_table_top2">链接类型 </td>
    <td align="center" bgcolor="#f9f9f9" class="nzcms_table_top2">网站地址</td>
    <td width="7%" align="center" class="nzcms_table_top2">排 序</td>
    <td width="7%" align="center" class="nzcms_table_top2">修改</td>
    <td width="8%" align="center" class="nzcms_table_top2">删除</td>
  </tr>
  <c:forEach items="${list }" var="item" varStatus="status">
  <tr bgcolor="#f0f0f0">
    <form method="post" action="links_update.action" onsubmit="return check(this)">
      <td height="40" align="center" bgcolor="#FFFFFF">
      	<input name="links.id" type="hidden" value="${item.id }">
      	<input name="links.name" type="text" value="${item.name }">
      </td>
      <td align="center" bgcolor="#FFFFFF">
        <select name="links.catId">
          <c:forEach items="${linkCategoryList}" var="cat">
            <option value="${cat.id}" <c:if test="${item.catId == cat.id}">selected</c:if>>${cat.name}</option>
          </c:forEach>
        </select>
      </td>
      <td align="center" bgcolor="#FFFFFF"><input name="links.url" type="text" value="${item.url }" size="50"></td>
      <td height="40" align="center" bgcolor="#FFFFFF"><input name="links.sort" type="text" value="${item.sort }" size="3"></td>
      <td height="40" align="center" bgcolor="#FFFFFF"><input name="Submit" type="submit" class="button" value="修改"></td>
      <td height="40" align="center" bgcolor="#FFFFFF"><a href="links_delete.action?links.id=${item.id }" onclick="return confirm('确定删除？')"><font color="#FF0000">删除</font></a></td>
    </form>
  </tr>
  </c:forEach>
</table>
</c:if>
</body>
</html>