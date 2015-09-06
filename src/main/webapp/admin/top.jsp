<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String username = (String)session.getAttribute("user"); %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript">
	var cur_resource = "home";
	function selectResource(id) {
      if (id == "home") {
        parent.left_frame.location.href = "left_home.jsp";
        parent.right_frame.location.href = "resource_right.action";
      }else {
        parent.left_frame.location.href = "resource_left.action?resourceId="+id;
      }
      $("#resource_"+cur_resource).attr("class","top_link");
      $("#resource_"+id).attr("class","top_hover");
      cur_resource = id;
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
        <td width="70" id="resource_home" align="center" class="top_hover" onclick="javascript:selectResource('home');void(0);">后台首页</td>
        <c:forEach items="${resourceList}" var="item" varStatus="status">
          <td width="70" id="resource_${item.id}" align="center" class="top_link" onclick="javascript:selectResource('${item.id}');void(0);">${item.name}</td>
        </c:forEach>
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