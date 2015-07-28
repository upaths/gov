<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="top" executeResult="true" ignoreContextParams="true" />

<table width="1004" border="0" align="center" cellpadding="0"
	cellspacing="8" bgcolor="#FFFFFF">
	<tr valign="top">
		<td width="280" align="center" valign="top"><table
				width="100%" height="2" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="#990000"></td>
				</tr>
			</table>
			<table width="100%" height="35" border="0" cellpadding="0"
				cellspacing="0" bgcolor="#399BEE">
				<tr>
					<td width="15%" height="35" align="center"><img
						src="images/word.gif" alt="分类" width="16" height="16"></td>
					<td align="left" class="white14">
						机构设置</td>
				</tr>
				<tr>
					<td height="1" colspan="2" align="center" bgcolor="FFFFFF"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellpadding="0" cellspacing="10" bgcolor="#D9EBFF">
				<c:forEach items="${list }" var="item">
				<tr>
					<td align=left><a
						href="org.action?id=${item.id }" class="left2"> <img
							src="images/news_14.gif" alt="nzcms" border="0" />&nbsp;&nbsp;${item.dwmc }
					</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			</td>
			<td align="center">
			<table width="99%" border="1" cellpadding="0" cellspacing="0"
				bordercolor="#FFFFFF" class="kk">
				<tr>
					<td width="22%" height="35" align="center" valign="middle"
						background="images/nzcms.2011_48.gif" class="white14">${organization.dwmc }</td>
					<td align="right" valign="middle" background="images/left_bg1.jpg">
					&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" valign="top" height="300">
						${organization.description }
					</td>
				</tr>
			</table>

		</td>
	</tr>
</table>
<s:action name="bottom" executeResult="true" ignoreContextParams="true" />