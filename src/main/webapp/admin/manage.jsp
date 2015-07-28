<%@ page language="java" pageEncoding="UTF-8"%>
<%String username = (String)session.getAttribute("user"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>《&nbsp;admin&nbsp;》
管理员 ，您好！欢迎您登录后台管理</title>
</head>
<frameset rows="78,*,30" frameborder="no" border="0">
	<frame name="top_frame" src="top.jsp" scrolling="no" />
	<frameset cols="210,*" frameborder="no" border="0">
		<frame name="left_frame" src="left.jsp" scrolling="no" />
		<frame name="right_frame" src="right.jsp" scrolling="yes" />
	</frameset>
	<frame src="bottom.jsp" scrolling="no" />
</frameset>
</html>