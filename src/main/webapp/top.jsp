<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>${config.wzbt }</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Keywords" content="${config.gjzc }" />
<meta name="Description" content="${config.wzms }" />
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/date.js"></script>
<script type="text/javascript" src="script/menu.js"></script>
</head>
<body <c:if test="${config.ffzgn }">onselectstart="return false" oncut="return false;" oncopy="return false;" onpaste="return false"</c:if>> 

<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="images/top_bg.jpg" bgcolor="#FFFFFF">
  <tr>
    <td height="28" valign="middle" style="padding-left:20px;">今天是:
        <SCRIPT language=JavaScript>RunGLNL();</SCRIPT>
      &nbsp;时间:
      <SCRIPT>setInterval("time.innerHTML=new Date().getHours()+':'+new Date().getMinutes()+':'+new Date().getSeconds()",1000);</SCRIPT>
    <SPAN id=time></SPAN></td>
	<td width="10"></td>
    <td width="60" align="center"><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage(document.location.href);" href="#">设为首页</a> 
	<td width="60" align="center"><a  href="javascript:window.external.AddFavorite(document.location.href,document.title);">收藏本站</a></td>
  </tr>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0" background="flash/top/nzgov_06.jpg" bgcolor="#FFFFFF">
  <tr>
    <td align="center"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="1005" height="167">
      <param name="movie" value="flash/top/top.swf" />
      <param name="quality" value="high" />
      <param name="wmode" value="transparent" />
      <embed src="flash/top/top.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="1004" height="167"></embed>
    </object></td>
  </tr>
</table>

<div id=menuDiv style='Z-INDEX: 2; VISIBILITY: hidden; WIDTH: 0px; POSITION: absolute; HEIGHT: 0px; BACKGROUND-COLOR:'></div>		  
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="images/nzcms_top01.gif"  class="top">
  <tr>
    <td width="95" height="38" align="center" valign="middle" background="images/nzcms.2011_07.gif" class="white"><a href="index.action" class="left">本站主页</a></td>
    <td width="95" align="center" valign="middle" background="images/nzcms.2011_07.gif" class="white"><a href="org.action" onMouseOver='ShowMenu(jgsz)' class="left">机构设置</a></td>
    <script type="text/javascript">
    var jgsz = "";
    <c:if test="${!empty orgList}">
    	jgsz += '<img src="images/top03.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="top01"><tr>';
    </c:if>
    <c:forEach items="${orgList }" var="item">
    	jgsz += '<td align=center><table width="100%" height="30" border="0" cellpadding="5" ><tr><td align="left"><img src="images/biao.gif" border="0">&nbsp;<a href="org.action?id=${item.id}">${item.dwmc}</a></td></tr></table></td>';
    </c:forEach>
    <c:if test="${!empty orgList}">
		jgsz += '</tr></table>';
	</c:if>
    </script>
    <c:forEach items="${catMap }" var="item">
    <td width="95" align="center" valign="middle" background="images/nzcms.2011_07.gif" class="white"><a href="cat1.action?yjid=${item.key.id}" onMouseOver='ShowMenu(menu${item.key.id})' class="left">${item.key.mc }</a></td>
    <script type="text/javascript">
    var menu${item.key.id} = "";
    <c:if test="${!empty item.value}">
    	menu${item.key.id} += '<img src="images/top03.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="top01"><tr>';
    </c:if>
    <c:forEach items="${item.value }" var="cat">
    	menu${item.key.id} += '<td align=center><table width="100%" height="30" border="0" cellpadding="5" ><tr><td align="left"><img src="images/biao.gif" border="0">&nbsp;<a href="cat2.action?ejid=${cat.id}">${cat.mc}</a></td></tr></table></td>';
    </c:forEach>
    <c:if test="${!empty item.value}">
    	menu${item.key.id} += '</tr></table>';
	</c:if>
    </script>
    </c:forEach>
    <td align="center" valign="middle">&nbsp;</td>
  </tr>
</table>
<table width="1004" height="63"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" background="images/nzcms.topso_bg.gif" bgcolor="#FFFFFF" class="dx">
  <tr>
    <td><table width="98%" border="0" cellspacing="0" cellpadding="5">
      <form name="form1" method="post" action="search.action">
        <tr>
          <td align="left"><strong style="position: relative;top: -3px;">搜索：</strong>
            <select name="yjid" id="big_sort_id">
              <option value="" style="BACKGROUND-COLOR: #F2F2F2">&nbsp;请选择所在类别&nbsp;</option>
              <c:forEach items="${catMap }" var="item">
			  <option value="${item.key.id }" <c:if test="${yjid == item.key.id }">selected</c:if>>${item.key.mc }</option>
			  </c:forEach>
            </select>
            
            <input name="bt" type="text"  id="keyword" size="25" style="color: gray;" value="${bt }" />
            <input name="Submit2" type="submit" value="搜索一下">
            </td>
          </tr>
      </form>
    </table></td>
    <td align="center">${config.tqyb }</td>
  </tr>
</table>