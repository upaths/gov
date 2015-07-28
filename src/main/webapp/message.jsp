<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="script/jquery-1.4.min.js"></script>
<script type="text/javascript" src="script/script.js"></script>
<style type="text/css">
<!--
body,td,th {
	font-family: "微软雅黑";
	font-size: 11px;
	color: #666666;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(../images/bg/01.gif);
	background-repeat: repeat-x;
	background-attachment: scroll;
	background-position: top;
}

.red {
	color: #FF3300;
}
-->
</style>
<script type="text/javascript">
	function check() {
		var bt = $("#bt");
		var nr = $("#nr");
		if (bt.val() == "") {
			alert("标题不能为空！");
			return false;
		}
		if (nr.val() == "") {
			alert("内容不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="msg_insert.action" method="post" onsubmit="return check();" style="margin: 0;">
		<table width="100%" border="0" cellpadding="3" cellspacing="0">
			<tr>
				<td>标题：<input name="message.bt" id="bt" type="text" maxlength="50" style="width: 180px;" /></td>
			</tr>
			<tr>
				<td>内容：<textarea name="message.nr" id="nr" rows="6" cols="22"></textarea></td>
			</tr>
			<tr>
				<td style="text-align: right; padding-right: 12px;"><input
					type="submit" value=" 提交 " /></td>
			</tr>
		</table>
	</form>
</body>
</html>