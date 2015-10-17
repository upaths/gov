<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #000000;
	word-spacing: 1px;
	letter-spacing: 1px;
}
body {
	background-color: #2A33A8;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a:link {
	color: #333333;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #333333;
}
a:hover {
	text-decoration: none;
	color: #333333;
}
a:active {
	text-decoration: none;
	color: #333333;
}
.white18 {
	font-size: 20px;
	font-weight: bold;
	color: #FFFFFF;
	font-family: "华文仿宋";
}
.white {
	font-size: 12px;
	color: #FFFFFF;
}
.tite {
	font-size: 18px;
	font-family: Arial, Helvetica, sans-serif;
	color: #FF3300;
	height: 28px;
	width: 150px;
	font-weight: bold;
}
.nzcms {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #2A33A8;
}
.zx {
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #7495E4;
}
.BG {	background-color: #F6FBFF;
	border: 1px solid #B3DDFF;
}
-->
</style>
<script type="text/javascript">
	function check() {
		var username = document.getElementById("username");
		var password = document.getElementById("password");
		var rand = document.getElementById("rand");
		if (username.value == "") {
			alert("帐号不能为空！");
			username.focus();
			return false;
		}
		if (password.value == "") {
			alert("密码不能为空！");
			password.focus();
			return false;
		}
		if (rand.value == "") {
			alert("验证码不能为空！");
			rand.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0> 
<form name="form" method="post" action="${pageContext.request.contextPath}/admin/login.action" onSubmit="return check();">
<table width="100%" height="90"  border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="#00309C">
  <tr>
    <td align="left" valign="bottom"><img src="${pageContext.request.contextPath}/admin/images/nzcms_admin.jpg"></td>
    <td align="center" valign="middle">&nbsp;</td>
  </tr>
</table>
<table width="100%" height="5"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#C6DCFE">
  <tr>
    <td align="center" valign="middle"></td>
  </tr>
</table>
<table width="100%" height="1"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#00309C">
  <tr>
    <td align="center" valign="middle"></td>
  </tr>
</table>
<table width="100%" height="62%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#5A7EDC">
  <tr>
    <td width="10%" align="left" valign="top" ><img src="${pageContext.request.contextPath}/admin/images/nz_05.gif" width="100" height="100"></td>
    <td width="35%" align="right" valign="middle" class="zx"><table border="0" cellpadding="0" cellspacing="50">
      <tr>
        <td width="67" height="67" align="center" valign="middle" background="${pageContext.request.contextPath}/admin/images/www.ningzhi.net.jpg" bgcolor="#FFFFFF"><img src="${pageContext.request.contextPath}/admin/images/nz.gif" border="0"></td>
      </tr>
    </table></td>
    <td align="left" valign="middle"><table width="375" border="0" cellpadding="5" cellspacing="0" >
      <tr>
        <td width="140" align="right" class="white">输入帐号：</td>
        <td height="40" colspan="2" align="left"><input name="username" type="text" class="tite" id="username" value="" size="20"></td>
      </tr>
      <tr>
        <td width="140" align="right"><span class="white">输入密码：</span></td>
        <td height="40" colspan="2" align="left"><input name="password" type="password" class="tite" id="password" value="" size="20"></td>
      </tr>
      <tr>
        <td width="140" align="right"><span class="white">输入验证：</span></td>
        <td height="40" align="left"><input name="rand" type=text class="tite" id="rand" value="" size=6 maxlength=6></td>
        <td width="50" align="center"><table width="62" height="28" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/admin/images/yzm.gif" bgcolor="#FFFFFF">
          <tr>
            <td width="15">&nbsp;</td>
            <td><img src="${pageContext.request.contextPath}/open/rand.action?d=<%=new java.util.Date() %>" alt="看不清？点击换一个" onclick="this.src='${pageContext.request.contextPath}/open/rand.action?d='+new Date()"></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="120" align="right">&nbsp;</td>
        <td height="40" colspan="2" align="left"><input name="Submit" type="submit" value="登录后台">
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" value="重置"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="3"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F99737">
  <tr>
    <td align="center" valign="middle"></td>
  </tr>
</table>
</form>
</body>
</html>