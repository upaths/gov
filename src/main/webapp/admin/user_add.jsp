<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript" src="../script/script.js"></script>
<script type="text/javascript">
function check() {
	var username = $("#username");
	var password = $("#password");
	if (username.val() == "") {
		alert("帐号不能为空！");
		username.focus();
		return;
	}
	if (password.val() == "") {
		alert("密码不能为空！");
		password.focus();
		return;
	}
	$.post("user_check.action",{"user.username":username.val()},function(result) {
		if (result == "0") {
			$("#form1").submit();
		}else {
			alert("用户名已存在！");
		}
	});
}
</script>
</head>
<body>
  <form action="user_add.action" method="post" name="form1" id="form1">
<table width="100%"  border="1" align="center" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
    <tr bgcolor="#D2E8F6">
      <td height="40" align="center" class="nzcms_table_top" ><a href="javascript:$('#news').toggle();void(0);">说明书<img src="images/help.png" alt="问" border="0" /></a></td>
      <td height="40" align="center" class="nzcms_table_top" >添加管理员</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" colspan="2" align="left" bgcolor="#E4EDF9" class="zfb" id='news' style='DISPLAY:none '><ol>
        <li>新增管理员用户，并设置登录后台密码；</li>
        </ol>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="81" height="30" align="center" bgcolor="#E4EDF9">帐号：</td>
      <td height="30"><input name="user.username" type="text" id="username" maxlength="20" />
          <font color="red">*提醒：用户名可以使用中文姓名！</font></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#E4EDF9">密码：</td>
      <td height="30"><input name="user.password" id="password" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#E4EDF9">&nbsp;</td>
      <td height="30">&nbsp;
          <input name="Submit22" type="button" class="button" value=" 提 交 " onclick="check();" />
        &nbsp;&nbsp;&nbsp;
        <input name="Submit22" type="reset" class="button" value=" 重 置 " /></td>
    </tr>
</table>
</form>
</body>
</html>
