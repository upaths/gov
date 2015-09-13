<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript" src="../script/script.js"></script>
<script src="../My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function check() {
	var title = $("#title");
	var content = $("#content");
    var month = $("#month");
	if (title.val() == "") {
		alert("标题不能为空！");
        title.focus();
		return false;
	}
	if (content.val() == "") {
		alert("内容不能为空！");
        content.focus();
		return false;
	}
    if (month.val() == "") {
        alert("月份不能为空！");
        month.focus();
        return false;
    }
	return true;
}
</script>
</head>
<body>
  <form action="topic_add.action" method="post" name="form1" id="form1" onsubmit="return check()">
<table width="100%"  border="1" align="center" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
    <tr bgcolor="#D2E8F6">
      <td height="40" align="center" class="nzcms_table_top" ><a href="javascript:$('#news').toggle();void(0);">说明书<img src="images/help.png" alt="问" border="0" /></a></td>
      <td height="40" align="center" class="nzcms_table_top" >添加话题</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" colspan="2" align="left" bgcolor="#E4EDF9" class="zfb" id='news' style='DISPLAY:none '><ol>
        <li>新增话题；</li>
        </ol>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="81" height="30" align="center" bgcolor="#E4EDF9">标题：</td>
      <td height="30"><input name="topic.title" type="text" id="title" maxlength="20" size="40" />
          </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#E4EDF9">内容：</td>
      <td height="30">
          <textarea name="topic.content" id="content" rows="4" cols="50"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="30" align="center" bgcolor="#E4EDF9">年月：</td>
        <td height="30"><input name="topic.month" id="month" value="${month}" size="15" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" align="center" bgcolor="#E4EDF9">&nbsp;</td>
      <td height="30">&nbsp;
          <input name="Submit22" type="submit" class="button" value=" 提 交 " />
        &nbsp;&nbsp;&nbsp;
        <input name="Submit22" type="reset" class="button" value=" 重 置 " /></td>
    </tr>
</table>
</form>
</body>
</html>
