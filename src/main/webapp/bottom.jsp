<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table width="1004" border="0" align="center" cellpadding="0"
	cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td><table width="99%" border="0" align="center" cellpadding="0"
				cellspacing="0" bgcolor="#F1F9FE" class="kk">
				<tr>
					<td height="27" align="left" background="images/left_bg1.jpg"
						bgcolor="#FFFFFF" class="z14">&nbsp;&nbsp;友情链接</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF"><table width="10"
							height="5" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td></td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%; text-align: center;">
							<c:forEach items="${list }" var="item" varStatus="status">
								<c:if test="${status.index%10==0 }">
									<tr>
								</c:if>
								<td height="20" width="10%"><a href="http://${item.url }"
									target="_blank">${item.mc }</a></td>
								<c:if test="${status.count%10==0 || status.last }">
									</tr>
								</c:if>
							</c:forEach>
						</table></td>
				</tr>
			</table></td>
	</tr>
</table>
<table width="1004" border="0" align="center" cellpadding="0"
	cellspacing="0" background="images/nzcms.2011_48.gif" bgcolor="#0A3F83">
	<tr>
		<td height="22" align="center" class="nzcms_end">
			${config.wydb }
		</td>
		<td width="80" align="center" class="nzcms_end"><a href="#"><font
				class="white">返回顶部</font></a></td>
	</tr>
</table>
<table width="1004" border="0" align="center" cellpadding="0"
	cellspacing="0" background="images/bg/01.gif" bgcolor="#FFFFFF">
	<tr>
		<td align="center" valign="top" class="end"><table width="10"
				height="15" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td></td>
				</tr>
			</table>
			主办单位：中国山东省东营市广饶县质量监督局主办&nbsp;&nbsp;&nbsp;&nbsp;技术支持：王勇&nbsp;&nbsp;&nbsp;&nbsp;QQ：395498124<br />
			最佳效果：1024*768分辨率/建议使用微软公司浏览器IE6.0以上<br />
			<table border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center"><a href="admin">后台管理</a></td>
				</tr>
			</table>
			<table width="10" height="15" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td class="nzcms">&copy;.nzcms.2011<sup class="tm">TM</sup></td>
				</tr>
			</table></td>
	</tr>
</table>
</body>
</html>