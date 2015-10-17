<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="${pageContext.request.contextPath}/css/admin_css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery-1.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/script/script.js"></script>
    <script type="text/javascript">
        function check() {
            var team = $("#team");
            var organization = $("#organization");
            var sort = $("#sort");
            if (team.val() == "") {
                alert("组别不能为空！");
                team.focus();
                return false;
            }
            if (organization.val() == "") {
                alert("巡视单位不能为空！");
                organization.focus();
                return false;
            }
            if (sort.val() == "") {
                alert("序号不能为空！");
                sort.focus();
                return false;
            }
            if (isNaN(sort.val())) {
                alert("顺序请输入数字！");
                sort.select();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
  <form action="inspection_add.action" method="post" name="form1" id="form1" onsubmit="return check()">
<table width="100%"  border="1" align="center" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
    <tr bgcolor="#D2E8F6">
      <td height="40" align="center" class="nzcms_table_top" ><a href="javascript:$('#news').toggle();void(0);">说明书<img src="${pageContext.request.contextPath}/admin/images/help.png" alt="问" border="0" /></a></td>
      <td height="40" align="center" class="nzcms_table_top" >添加巡视组</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="30" colspan="2" align="left" bgcolor="#E4EDF9" class="zfb" id='news' style='DISPLAY:none '><ol>
        <li>新增巡视组；</li>
        </ol>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="81" height="30" align="center" bgcolor="#E4EDF9">组别：</td>
      <td height="30"><input name="inspection.team" type="text" id="team" maxlength="45" size="40" />
          </td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td width="81" height="30" align="center" bgcolor="#E4EDF9">巡视单位：</td>
        <td height="30"><input name="inspection.organization" type="text" id="organization" maxlength="45" size="40" />
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td width="81" height="30" align="center" bgcolor="#E4EDF9">序号：</td>
        <td height="30"><input name="inspection.sort" type="text" id="sort" />
        </td>
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
