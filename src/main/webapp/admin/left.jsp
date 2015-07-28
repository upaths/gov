<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%String lb = request.getParameter("lb"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<table border="0" width="200" height="100%" cellpadding="0" cellspacing="0" bgcolor="#C9DEFA">
<tr><td valign="top">
<%if (lb == null || "".equals(lb) || "0".equals(lb)) { %>
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/nzsoft_14.gif" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">Welcome</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0">
<tr>
  <td align="center"><img src="images/nzcms_ad.jpg"></td>
</tr>
</table>
<%} %>
<%if ("1".equals(lb)) { %>
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/nzsoft_14.gif" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">站点设置</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td><a href="config_query.action" class="left3" target="right_frame">站点基本设置</a></td>
  </tr>
</table>
<%} %>
<%if ("2".equals(lb)) { %>
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/nzsoft_14.gif" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">用户管理</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td><a href="user_query.action" class="left3" target="right_frame">管理用户</a></td>
  </tr>
  <tr>
    <td><a href="user_toAdd.action" class="left3" target="right_frame">添加新用户</a></td>
  </tr>
</table>
<%} %>
<%if ("3".equals(lb)) { %>
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/nzsoft_14.gif" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">机构设置</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td><a href="organization_query.action" class="left3" target="right_frame">管理机构信息</a></td>
  </tr>
  <tr>
    <td><a href="organization_toAdd.action" class="left3" target="right_frame">添加一级分类</a></td>
  </tr>
</table>
<%} %>
<%if ("4".equals(lb)) { %>
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/nzsoft_14.gif" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">信息管理</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td><a href="category_query.action" class="left3" target="right_frame">信息类别管理</a></td>
  </tr>
  <tr>
    <td><a href="article_toAdd.action" class="left3" target="right_frame">添加新信息</a></td>
  </tr>
  <tr>
    <td><a href="article_query.action" class="left3" target="right_frame">管理网站信息</a></td>
  </tr>
</table>
<%} %>
<%if ("5".equals(lb)) { %>
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/nzsoft_14.gif" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">友情链接</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td><a href="links_query.action" class="left3" target="right_frame">管理文字链接</a></td>
  </tr>
</table>
<%} %>
<%if ("6".equals(lb)) { %>
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/nzsoft_14.gif" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">登录日志</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td><a href="log_query.action" class="left3" target="right_frame">查看登录日志</a></td>
  </tr>
</table>
<%} %>
<%if ("7".equals(lb)) { %>
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/nzsoft_14.gif" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">投诉建议</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td><a href="msg_query.action" class="left3" target="right_frame">查看投诉建议</a></td>
  </tr>
</table>
<%} %>
</td></tr>
</table>
</body>
</html>