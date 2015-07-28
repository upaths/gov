<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
<s:action name="top" executeResult="true" ignoreContextParams="true" />

<table width="1004" border="0" align="center" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
  <tr>
    <td width="285" align="center" valign="top" bgcolor="#D9EBFF"><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css">
<table height="5" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<s:action name="slide" executeResult="true" ignoreContextParams="true" />
<table height="10" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<s:action name="hot" executeResult="true" ignoreContextParams="true" />
<table height="5" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
    </td>
    <td align="center" valign="top">
<table width="99%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="kk">
      <tr>
        <td width="22%" height="35" align="center" valign="middle" background="images/nzcms.2011_48.gif" class="white14">
 ${category.mc }</td>
        <td align="right" valign="middle" background="images/left_bg1.jpg">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="center" valign="top">
        	<c:forEach items="${list }" var="item">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="25" height="30" align="center"><img src="images/nzshu.gif" alt="图标" /></td>
                <td align="left"><a href="showNews.action?article.id=${item.id }" target="_blank">
                <font class="p114">${item.bt }</font>
                </a></td>
                <td width="100" align="center" class="gray">浏览：${item.ydcs }次</td>
                <td width="130" align="center" class="gray">发稿：${item.lrrq }</td>
              </tr>
            </table>
            </c:forEach>
        </td>
      </tr>
      <tr align="center">
		<td height="25" colspan="11" class="nzcms_table_top">
			<page:pagination pageBean="${pageBean}" url="cat2.action" cssClass="txt_page"/>
		</td>
	  </tr>
    </table>
	</td>
  </tr>
</table>
<s:action name="bottom" executeResult="true" ignoreContextParams="true" />