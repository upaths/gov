<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="form1" method="post" action="config_upt.action" style="margin: 0;">
<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="98%" border="1" align="left" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
    <tr bgcolor="#D2E8F6">
      <td height="40" colspan="2" align="center" class="nzcms_table_top" >站点设置</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" colspan="2" align="left"><input name="Submit2" type="submit" class="button" value=" 提交 " />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input name="Submit22" type="reset" class="button" value=" 重置 " /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="25" align="right">站点名：</td>
        <td>
            <textarea name="config.zdm" cols="70" rows="3">${config.zdm }</textarea>
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="25" align="right">域名：</td>
        <td>
            <textarea name="config.ym" cols="70" rows="3">${config.ym }</textarea>
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="25" align="right">备案号：</td>
        <td>
            <textarea name="config.bah" cols="70" rows="3">${config.bah }</textarea>
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="25" align="right">版权信息：</td>
        <td>
            <textarea name="config.bqxx" cols="70" rows="3">${config.bqxx }</textarea>
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="right">网站标题：</td>
      <td>
          <textarea name="config.wzbt" cols="70" rows="3" id="title">${config.wzbt }</textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="right">关键字词：<br /></td>
      <td><textarea name="config.gjzc" cols="70" rows="3" id="keywords">${config.gjzc }</textarea>
          <span class="red">字符请用, 分隔开</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25" align="right">网站描述：<br />      </td>
      <td><textarea name="config.wzms" cols="70" rows="3" id="description">${config.wzms }</textarea>
          <span class="red">字符请用,分隔开</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td width="12%" height="40" align="right">防复制功能：</td>
        <td><input name="config.ffzgn" type="checkbox" id="fz" value="true" <c:if test="${config.ffzgn }">checked</c:if> />
            打了√开启网站防复制功能，不打则用户可以复制网站内容。</td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="25" align="right">开启/关闭：</td>
        <td>
            <input name="config.zdkqgb" type="checkbox" id="zdkqgb" value="true" <c:if test="${config.zdkqgb }">checked</c:if> />
            打了√关闭站点访问，用户访问时提示关闭信息。
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
        <td height="25" align="right">关闭信息：</td>
        <td>
            <textarea name="config.gbtsxx" cols="70" rows="3">${config.gbtsxx }</textarea>
        </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">&nbsp;</td>
      <td width="878"><input name="Submit" type="submit" class="button" value=" 提交 ">
          <input name="Submit" type="reset" class="button" value=" 重置 "></td>
    </tr>
</table>
</form>
</body>
</html>