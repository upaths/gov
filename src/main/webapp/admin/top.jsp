<%@ page language="java" pageEncoding="UTF-8"%>
<%String username = (String)session.getAttribute("user"); %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript">
	var cur_lb = "lb_0";
	function chgLb(left_url, right_url, id) {
		parent.left_frame.location.href = left_url;
		if (right_url != "") {
			parent.right_frame.location.href = right_url;
		}
        $("#"+cur_lb).attr("class","top_link");
        $("#"+id).attr("class","top_hover");
		cur_lb = id;
	}
</script>
</head>
<body>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" background="images/ad_02.gif" bgcolor="#2A4A87">
  <tr>
    <td valign="top"><img src="images/logo.jpg" alt="后台标识" border="0"></td>
    <td align="right" valign="bottom" class="white"><table width="300" height="20" border="0" cellpadding="5" cellspacing="0" background="images/top_bg.png">
      <tr>
        <td align="right" class="white">（&nbsp;<%=username %>&nbsp;）用户&nbsp;&nbsp;‖&nbsp;&nbsp;<a href="../index.action" target="_top"><font class="white">前台主页</font></a>&nbsp;&nbsp;‖&nbsp;&nbsp;<a href="out.jsp" target="_top" onClick="return confirm('您确定要退出是吗？');"><font class="white">安全退出</font></a></td>
      </tr>
    </table>
      <table height="15" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table height="30" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="70" id="lb_0" align="center" class="top_hover" onclick="javascript:chgLb('left.jsp?lb=0', 'right.jsp', 'lb_0');void(0);">后台首页</td>
        <td width="70" id="lb_1" align="center" class="top_link" onclick="javascript:chgLb('left.jsp?lb=1', 'config_query.action', 'lb_1');void(0);">站点设置</td>
        <td width="70" id="lb_2" align="center" class="top_link" onclick="javascript:chgLb('left.jsp?lb=2', 'user_query.action', 'lb_2');void(0);">用户管理</td>
        <td width="70" id="lb_3" align="center" class="top_link" onclick="javascript:chgLb('left.jsp?lb=3', 'organization_query.action', 'lb_3');void(0);">机构设置</td>
        <td width="70" id="lb_4" align="center" class="top_link" onclick="javascript:chgLb('left.jsp?lb=4', 'category_query.action', 'lb_4');void(0);">信息管理</td>
        <td width="70" id="lb_5" align="center" class="top_link" onclick="javascript:chgLb('left.jsp?lb=5', 'links_query.action', 'lb_5');void(0);">友情链接</td>
        <td width="70" id="lb_7" align="center" class="top_link" onclick="javascript:chgLb('left.jsp?lb=7', 'msg_query.action', 'lb_7');void(0);">投诉建议</td>
        <td width="70" id="lb_6" align="center" class="top_link" onclick="javascript:chgLb('left.jsp?lb=6', 'log_query.action', 'lb_6');void(0);">登录日志</td>
        <td width="70" align="center">&nbsp;</td>
        <td width="70" align="center"><img src="images/help.gif" alt="帮助" border="0"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="5" border="0" cellpadding="5" cellspacing="0" bgcolor="#09659F">
  <tr>
    <td align="right"></td>
  </tr>
</table>
</body>
</html>