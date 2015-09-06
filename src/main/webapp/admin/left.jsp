<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<table border="0" width="200" height="100%" cellpadding="0" cellspacing="0" bgcolor="#C9DEFA">
<tr><td valign="top">

<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/left_top.jpg">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="left_top">${resource.name}</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0" align="center">
  <c:forEach items="${resourceList}" var="item" varStatus="status">
    <tr>
      <td><a href="${item.url}" class="left3" target="right_frame">${item.name}</a></td>
    </tr>
  </c:forEach>
</table>

</td></tr>
</table>
</body>
</html>