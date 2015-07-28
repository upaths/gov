<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table width="96%" height="220" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" background="images/bg/01.gif" class="kk22">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="90" height="28" align="center" background="images/nzcms.2011_48.gif" class="white14">热点文章</td>
        <td align="right"><img src="images/HOT.gif" /></td>
      </tr>
    </table>
        <table width="98%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
        <c:forEach items="${rdxwList }" var="item">
          <tr>
            <td height="25" align="left" valign="middle" >&nbsp;<img src="images/biao.gif" />
            <a href="showNews.action?article.id=${item.id }" target="_blank" title="标题：${item.bt }">
              ${item.bt }
            </a> </td>
          </tr>
        </c:forEach>
      </table></td>
  </tr>
</table>
