<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
</head>
<body>
	<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td></td>
		</tr>
	</table>
	<table width="100%" border="1" align="center" cellpadding="0"
		cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
		<tr bgcolor="#f0f0f0">
			<td align="center" bgcolor="#f0f0f0" class="nzcms_table_top"><table
					width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<form action="article_review.action" method="post">
						<tr>
							<td align="left" style="padding-left: 10px;">
							<strong>内容审核</strong>
       						&nbsp;标题：
								<input name="title" type="text" id="title" size="15" value="${title }" />
								<input type="submit" name="Submit2" value="搜索" id="Submit" />
							</td>
						</tr>
					</form>
				</table></td>
		</tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td height="35" colspan="6" align="left" valign="top">
				<table width="100%" border="1" align="center" cellpadding="0"
					cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<tr align="center" bgcolor="#C9DEFA">
						<td class="nzcms_table_top2" nowrap>状态</td>
						<td class="nzcms_table_top2" nowrap>标题</td>
						<td class="nzcms_table_top2" nowrap>短标题</td>
						<td class="nzcms_table_top2" nowrap>所属栏目</td>
						<td class="nzcms_table_top2" nowrap>来源</td>
						<td class="nzcms_table_top2" nowrap>时间</td>
						<td class="nzcms_table_top2" nowrap>序号</td>
						<td class="nzcms_table_top2" nowrap>操作</td>
					</tr>
					<c:forEach items="${list }" var="item">
					<tr onMouseOver="this.bgColor='#E4EDF9';"
						onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
						<td height="30" align="center"><font class="sidebarblock">
						<c:choose>
							<c:when test="${item.display }">
								<img src="images/dui.png" alt="已审核" />
							</c:when>
							<c:otherwise>
								<img src="images/no.png" alt="未审核" />
							</c:otherwise>
						</c:choose>
						</font></td>
						<td>
							&nbsp;<a href="<c:url value="${pageContext.request.contextPath}/content.action?id=${item.id }"/>" target="_blank">${item.title }</a>
							<c:if test="${!(empty item.thumb) }">
								<img src="../images/type_img.png" alt="图" />
							</c:if>
						</td>
						<td>&nbsp;${item.short_title }</td>
						<td align="center" nowrap>&nbsp;${item.cat_name }</td>
						<td align="center">&nbsp;${item.source }</td>
						<td align="center">&nbsp;<fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td align="center">&nbsp;${item.sort }</td>
						<td align="center" nowrap>
							<c:choose>
								<c:when test="${item.sfxs }">
									<a href="javascript:if(confirm('确定撤销审核？')){window.location.href='article_updateReview.action?article.id=${item.id }&article.display=false';}void(0);"><font class="red">撤销</font></a>
								</c:when>
								<c:otherwise>
									<a href="javascript:window.location.href='article_updateReview.action?article.id=${item.id }&article.display=true';void(0);">审核</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					</c:forEach>
					<tr align="center">
						<td height="25" colspan="8" class="nzcms_table_top">
							<page:pagination pageBean="${pageBean}" url="article_review.action" cssClass="txt_page"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>