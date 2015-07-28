<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  	<c:forEach items="${rsMap }" var="item" varStatus="status">
		  	<c:if test="${status.index % 2 == 0 }">
              <tr>
            </c:if>
                <td align="left" valign="top"><table width="345" height="210" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="kk">
                    <tr>
                      <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="right_kq">
                        <tr>
                          <td width="110" height="27" align="center" background="images/nzcms.2011_48.gif" bgcolor="#0676DD" class="white12">${item.key.mc }</td>
                          <td align="right" background="images/left_bg1.jpg"><a href="cat2.action?ejid=${item.key.id }">+更多&gt;&gt;</a>&nbsp;&nbsp;</td>
                        </tr>
                      </table>
                        <table width="99%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                        <c:choose>
                        <c:when test="${!empty item.value }">
                          <c:forEach items="${item.value }" var="v_item">
                          <tr>
                            <td height="25" align="left" valign="middle" ><a href="showNews.action?article.id=${v_item.id }" target="_blank" title="标题：${v_item.bt }">
                            <c:choose>
                            	<c:when test="${fn:length(v_item.bt) > 15 }">
                            		·${fn:substring(v_item.bt,0, 15) }...
                            	</c:when>
                            	<c:otherwise>
                            		·${v_item.bt }
                            	</c:otherwise>
                            </c:choose>
                            </a></td>
                            <td width="25%" align="center" valign="middle" ><font class="gray">${v_item.lrrq }</font></td>
                          </tr>
                          </c:forEach>
                        </c:when>
                        <c:otherwise>
                          <tr>
                            <td height="25" align="left" valign="middle" >
                        	<br><font class="gray">！本栏目还没有添加信息...</font>
                            </td>
                          </tr>
                        </c:otherwise>
                        </c:choose>
                        </table></td>
                    </tr>
                  </table>
                    <table height="10" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td></td>
                      </tr>
                  </table></td>
              <c:if test="${status.count % 2 == 0 }">
              </tr>
              </c:if>
              </c:forEach>
            </table>
            <table height="5" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td></td>
              </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<s:action name="bottom" executeResult="true" ignoreContextParams="true" />