<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
<script type="text/javascript">
function getChild(dl_val) {
	$.post("article_getChildList.action", {"cateId": dl_val },
		function (data, textStatus){
			$("#ejid").empty();
			$("<option value=''>全部</option>").appendTo("#ejid");
			for (var i = 0; i < data.length; i++) {
				var str = "<option value='"+data[i].id+"'";
				if (data[i].id == "${ejid}") {
					str += " selected";
				}
				str += ">"+data[i].mc+"</option>";
				$(str).appendTo("#ejid");
			}
		}, "json");
}
$(document).ready(function() {
	getChild($("#yjid").val());
});
</script>
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
					<form action="article_query.action" method="post">
						<tr>
							<td align="right">
							<strong>站内搜索</strong>
							&nbsp;所属大类：
							<select name="yjid" id="yjid" style="width: 100px;" onChange="getChild(this.value);">
								<option value="">全部</option>
					      		<c:forEach items="${cateList }" var="item">
					            <option value="${item.id }" <c:if test="${item.id == yjid }">selected</c:if>>${item.mc }</option>
					            </c:forEach>
					        </select>
					        &nbsp;所属小类：
       						<select name="ejid" id="ejid" style="width: 100px;"></select>
       						&nbsp;标题：
							<input name="bt" type="text" id="bt" size="15" value="${bt }" /> 
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
						<td width="50" class="nzcms_table_top2">状态</td>
						<td class="nzcms_table_top2">标题</td>
						<td width="100" class="nzcms_table_top2">所属大类</td>
						<td width="100" class="nzcms_table_top2">所属小类</td>
						<td width="75" class="nzcms_table_top2">作者</td>
						<td width="150" class="nzcms_table_top2">时间</td>
						<td width="50" align="center" class="nzcms_table_top2">推荐</td>
						<td width="50" class="nzcms_table_top2">显示</td>
						<td width="50" class="nzcms_table_top2">修改</td>
						<td width="50" class="nzcms_table_top2">删除</td>
					</tr>
					<c:forEach items="${list }" var="item">
					<tr onMouseOver="this.bgColor='#E4EDF9';"
						onMouseOut="this.bgColor='#FFFFFF';" bgcolor="#ffffff">
						<td height="30" align="center"><font class="sidebarblock">
						<c:choose>
							<c:when test="${item.sfxs }">
								<img src="images/dui.png" alt="显示" />
							</c:when>
							<c:otherwise>
								<img src="images/no.png" alt="不显示" />
							</c:otherwise>
						</c:choose>
						</font></td>
						<td>
						<a href="../showNews.action?article.id=${item.id }" target="_blank">${item.bt }</a>
						<c:if test="${item.sfyt > 0 }">
							<img src="../images/type_img.png" alt="图" />
						</c:if>
						</td>
						<td align="center">${item.yjmc }</td>
						<td align="center">${item.ejmc }</td>
						<td align="center">${item.gg }</td>
						<td align="center">${item.lrrq }</td>
						<td align="center">
						<c:choose>
							<c:when test="${item.sftj }">
								<a href="javascript:if(confirm('确定取消推荐？')){window.location.href='article_updateTjXs.action?article.id=${item.id }&article.sftj=false';}void(0);">
								<font class="red">已荐</font>
								</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:if(confirm('确定推荐？')){window.location.href='article_updateTjXs.action?article.id=${item.id }&article.sftj=true';}void(0);">未荐</a>
							</c:otherwise>
						</c:choose>
						</td>
						<td align="center">
						<c:choose>
							<c:when test="${item.sfxs }">
								<a href="javascript:if(confirm('确定取消显示？')){window.location.href='article_updateTjXs.action?article.id=${item.id }&article.sfxs=false';}void(0);"><font class="book_hf">显示</font></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:if(confirm('确定显示？')){window.location.href='article_updateTjXs.action?article.id=${item.id }&article.sfxs=true';}void(0);">不显示</a>
							</c:otherwise>
						</c:choose>
						</td>
						<td align="center"><a
							href="javascript:window.location.href='article_toUpdate.action?article.id=${item.id }';void(0);">修改</a></td>
						<td align="center">
							<a href="javascript:if(confirm('确定删除？')){window.location.href='article_delete.action?article.id=${item.id }';}void(0);">删除</a>
						</td>
					</tr>
					</c:forEach>
					<tr align="center">
						<td height="25" colspan="11" class="nzcms_table_top">
							<page:pagination pageBean="${pageBean}" url="article_query.action" cssClass="txt_page"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>