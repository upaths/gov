<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld"%>
<s:action name="top" executeResult="true" ignoreContextParams="true" />

<table width="1004" border="0" align="center" cellpadding="0"
	cellspacing="5" bgcolor="#FFFFFF">
	<tr>
		<td width="285" align="center" valign="top" bgcolor="#D9EBFF"><meta
				http-equiv="Content-Type" content="text/html; charset=gb2312">
			<link href="css/css.css" rel="stylesheet" type="text/css">
			<table height="5" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td></td>
				</tr>
			</table> <s:action name="slide" executeResult="true"
				ignoreContextParams="true" />
			<table height="10" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td></td>
				</tr>
			</table> <s:action name="hot" executeResult="true" ignoreContextParams="true" />
			<table height="5" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td></td>
				</tr>
			</table></td>
		<td valign="top"><table width="100%" border="1" cellpadding="0"
				cellspacing="0" bordercolor="#FFFFFF" class="kk">
				<tr>
					<td width="22%" height="35" align="center" valign="middle"
						background="images/nzcms.2011_48.gif" class="white14">图片新闻</td>
					<td align="right" valign="middle" background="images/left_bg1.jpg">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" valign="top">

						<table height="20" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td></td>
							</tr>
						</table>
						<table border="0" align="center" cellpadding="0" cellspacing="0"
							bordercolor="#FF9900">
							<c:forEach items="${list }" var="item" varStatus="status">
							<c:if test="${status.index % 3 == 0 }">
							<tr>
							</c:if>
								<td align="center" valign="top" whith="200"><table
										width="170" height="150" border="1" cellpadding="0"
										cellspacing="3" bordercolor="#FFFFFF" bgcolor="#F5F5F5"
										class="bg_qc">
										<tr>
											<td align="center" valign="middle" bgcolor="#FFFFFF"><a
												href="showNews.action?article.id=${item.id }" target="_blank"><img
													src="${item.image }" width="190"
													height="160" border="0"></a></td>
										</tr>
									</table>
									<table width="220" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td height="35" align="center"><a
												href="showNews.action?article.id=${item.id }" target="_blank">
												<c:choose>
					                            	<c:when test="${fn:length(item.bt) > 15 }">
					                            		${fn:substring(item.bt,0, 15) }...
					                            	</c:when>
					                            	<c:otherwise>
					                            		${item.bt }
					                            	</c:otherwise>
					                            </c:choose>
											</a></td>
										</tr>
									</table></td>
							<c:if test="${status.count % 3 == 0 }">
							</tr>
							</c:if>
							</c:forEach>
							<tr align="center">
								<td height="25" colspan="11" class="nzcms_table_top"><page:pagination
										pageBean="${pageBean}" url="cat2.action" cssClass="txt_page" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table></td>
	</tr>
</table>
<s:action name="bottom" executeResult="true" ignoreContextParams="true" />