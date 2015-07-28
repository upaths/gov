<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<table width="96%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" class="kk22">
  <tr>
    <td valign="top"><table width="98%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">
			<script type="text/javascript">
				var swf_width=270;
				var swf_height=210;
				var config='3|ffffff|0x990000|90|0xffffff|0xff0000|0x990000';
				//-- config 参数设置 -- 自动播放时间(秒)|文字颜色|文字背景色|文字背景透明度|按键数字颜色|当前按键颜色|普通按键色彩 --
				var files='',links='', texts='';
				<c:forEach items="${tpxwList}" var="item">
				files+='|${item.image}';
				links+='|showNews.action?article.id=${item.id}';
				texts+='|${item.bt}';  
				</c:forEach>
				files=files.substring(1);links=links.substring(1);texts=texts.substring(1);
				document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
				document.write('<param name="movie" value="images/swfnews.swf" />');
				document.write('<param name="quality" value="high" />');
				document.write('<param name="menu" value="false" />');
				document.write('<param name=wmode value="opaque" />');
				document.write('<param name="FlashVars" value="config='+config+'&bcastr_flie='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'" />');
				document.write('<embed src="images/swfnews.swf" wmode="opaque" FlashVars="config='+config+'&bcastr_flie='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
				document.write('</object>');
			</script>
		</td>
	</tr>
    </table></td>
  </tr>
</table>