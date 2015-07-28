<%@ page language="java" pageEncoding="UTF-8"%>
<%String username = (String)session.getAttribute("user"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="100%" height="30" border="0" align="center" cellpadding="5" cellspacing="0" bordercolor="#FFFFFF" class="nzcms_end">
  <tr>
    <td align="left">（&nbsp;<%=username %>&nbsp;）
用户 ，您好！</td>
    <td align="right"></td>
  </tr>
</table>
</body>
</html>