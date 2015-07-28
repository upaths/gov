<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript" src="../script/script.js"></script>
</head>
<body>
	<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td></td>
		</tr>
	</table>
	<table width="100%" border="1" align="center" cellpadding="0"
		cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED" id="2">
		<tr>
			<td height="40" align="center" valign="middle"
				class="nzcms_table_top" bgcolor="#FFFFFF">以下是登入后台日志（日志数据建议7天清除一次以保持节约空间）</td>
		</tr>
		<tr>
			<td align="left" valign="top" bgcolor="#FFFFFF" class="z">
				<table width="100%" border="1" cellpadding="0" cellspacing="1"
					bordercolor="#FFFFFF" bgcolor="#C9DEFA">
					<form action="log_delChk.action" name="form1" id="form1">
						<tr align="center" bgcolor="#C9DEFA">
							<td width="5%" class="nzcms_table_top2">选择</td>
							<td class="nzcms_table_top2">IP地址</td>
							<td class="nzcms_table_top2">登录用户</td>
							<td class="nzcms_table_top2">时间</td>
							<td class="nzcms_table_top2">是否成功</td>
							<td width="10%" class="nzcms_table_top2">删除</td>
						</tr>
						<c:forEach items="${list }" var="item">
							<tr onMouseOver="this.bgColor='#E4EDF9';"
								onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
								<td height="30" align="center"><input name="id"
									type="checkbox" value="${item.id }" /></td>
								<td align="center">${item.ip }</td>
								<td align="center">${item.user }</td>
								<td align="center">
									<fmt:formatDate value="${item.drsj}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td align="center">
									<c:if test="${item.sfcg }">成功</c:if>
									<c:if test="${!item.sfcg }">失败</c:if>
								</td>
								<td align="center">
									<a href="log_delete.action?log.id=${item.id }" onclick="return confirm('确定删除？')">删除</a>
								</td>
							</tr>
						</c:forEach>
					<tr bgcolor="#FFFFFF">
						<td height="30" colspan="6"><table width="100%" border="0"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="69%" align="left">&nbsp;&nbsp; <input
										name="button" type="button" class="button"
										onClick="selectAll(document.form1)" value="全选本页数据" /> <input
										name="button" type="button" class="button"
										onClick="selectOther(document.form1)" value="反选" /> <input
										name="reset" type="reset" class="button" value="全部取消" />
									<td width="21%" align="center">&nbsp;&nbsp;</td>
									<td width="10%" align="center"><input name="Submit3"
										type="submit" class="button" value="删除选中的信息"
										onClick="return confirm('您确定要删除吗？删除后将无法恢复，请谨慎操作！');" /></td>
								</tr>
							</table></td>
					</tr>
					</form>
					<tr align="center">
						<td height="25" colspan="6" class="nzcms_table_top">
							<page:pagination pageBean="${pageBean}" url="log_query.action" cssClass="txt_page" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>