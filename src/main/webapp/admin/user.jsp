<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript" src="../script/script.js"></script>
<script type="text/javascript">
	function check(form) {
		var realname = form["user.realname"];
        if (realname.value == "") {
            alert("真实姓名不能为空！");
            realname.focus();
            return false;
        }
		return true;
	}
</script>
</head>
<body>
<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED" id="2">
  <tr>
    <td height="40" align="center" valign="middle" class="nzcms_table_top" bgcolor="#FFFFFF" >后台管理员管理</td>
  </tr>
  <tr>
    <td align="left" valign="top" bgcolor="#FFFFFF">
        <table width="100%" border="1" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C9DEFA">
          <tr align="center" bgcolor="#C9DEFA">
          	<td width="5%" class="nzcms_table_top2">序号</td>
            <td class="nzcms_table_top2">用户名</td>
            <td class="nzcms_table_top2">真实姓名</td>
            <td class="nzcms_table_top2">角色</td>
            <td class="nzcms_table_top2">最后登录IP</td>
            <td class="nzcms_table_top2">最后登录时间</td>
            <td width="10%" class="nzcms_table_top2">修改</td>
            <td width="10%" class="nzcms_table_top2">删除</td>
          </tr>
                <c:forEach items="${list }" var="item" varStatus="status">
                <tr onmouseover="this.bgColor='#E4EDF9';" onmouseout="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
                  <td height="35" align="center" class="xux">${status.count }</td>
                  <td height="35" align="center" class="xux">${item.username }</td>
                  <td height="35" align="center" class="xux">${item.realname }</td>
                  <td height="35" align="center" class="xux">${item.role_name }</td>
                  <td height="35" align="center" class="xux">${item.ip }</td>
                  <td height="35" align="center" class="xux">
                      <fmt:formatDate value="${item.login_time}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
                  </td>
                  <td align="center" class="xux"><a href="javascript:$('#chg_pwd_${status.count }').toggle();void(0);">修改</a></td>
                  <td align="center" class="xux"><a href="javascript:window.location.href='user_del.action?user.username=${item.username }'" onclick="return confirm('您确定要删除吗？');">删除</a></td>
                </tr>
                <tr id='chg_pwd_${status.count }' style='DISPLAY:none '>
                  <td colspan="8" align="center"><table width="100%" border="1" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E4F1FC" class="bg_q">
                      <tr>
                        <td class="nzcms_table_top"><a href="javascript:$('#chg_pwd_${status.count }').toggle();;void(0);">关闭窗口</a></td>
                      </tr>
                      <tr>
                        <td width="50%" valign="top" bgcolor="#F1F7FE">
                        <form action="user_upt.action" method="post" onSubmit="return check(this);">
                        	<table width="100%" height="100%"  border="0" cellpadding="3" cellspacing="0">
                              <tr>
                                <td width="87" height="30" align="center">用户名： </td>
                                <td height="30" align="left"><input name="user.username" type="text" id="username" value="${item.username }" readonly="readonly" /></td>
                              </tr>
                              <tr>
                                <td height="30" align="center">新密码：</td>
                                <td height="30" align="left"><input name="user.password" /><span style="color: red;"> 如果不修改密码，此处留空</span></td>
                              </tr>
                              <tr>
                                  <td height="30" align="center">真实姓名：</td>
                                  <td height="30" align="left"><input name="user.realname" value="${item.realname}" /></td>
                              </tr>
                              <tr>
                                  <td height="30" align="center">角色：</td>
                                  <td height="30" align="left">
                                      <select name="roleId">
                                          <c:forEach items="${roleList}" var="role">
                                              <option value="${role.id}" <c:if test="${role.id == item.role_id}">selected</c:if>>${role.roleName}</option>
                                          </c:forEach>
                                      </select>
                                  </td>
                              </tr>
                              <tr>
                                <td height="30" align="center">&nbsp;</td>
                                <td height="30" align="left"><input type="submit" name="Submit" value="修改" class="button" /></td>
                              </tr>
                        	</table>
                        </form>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                </c:forEach>
            </table></td>
          </tr>
      </table>
</body>
</html>