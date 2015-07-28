<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="top" executeResult="true" ignoreContextParams="true" />

<table width="1004" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="300" align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="3" cellspacing="0" class="kk">
      <tr>
        <td align="center">
<script type="text/javascript">
				var swf_width=300;
				var swf_height=230;
				var config='3|ffffff|0x990000|90|0xffffff|0xff0000|0x990000';
				//-- config 参数设置 -- 自动播放时间(秒)|文字颜色|文字背景色|文字背景透明度|按键数字颜色|当前按键颜色|普通按键色彩 --
				var files='',links='', texts='';
				<c:forEach items="${tpxwList}" var="item">
				files+='|${item.image}';
				links+='|showNews.action?article.id=${item.id}';
				texts+='|<c:choose><c:when test="${fn:length(item.bt) > 15 }">${fn:substring(item.bt,0, 15) }...</c:when><c:otherwise>${item.bt }</c:otherwise></c:choose>';  
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
    <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" height="237" border="0" cellpadding="1" cellspacing="0" background="images/bg/01.gif" class="kk">
      <tr>
        <td align="center" valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="right_kq">
          
          <tr>
            <td width="20" height="27" align="center" background="images/nzcms.2011_48.gif"><img src="images/laba.gif"></td>
            <td width="80" align="left" background="images/nzcms.2011_48.gif" class="white12">质监新闻</td>
            <td align="right" background="images/left_bg1.jpg"><a href="cat2.action?ejid=${syxw.id }">更多&gt;&gt;&gt;</a></td>
            </tr>
        </table>
          <table width="98%" height="58" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="25" align="center" valign="middle" ><a href="showNews.action?article.id=${syxwList[0].id }" target="_blank" title="${syxwList[0].bt }">
              <font class="red14"><c:choose><c:when test="${fn:length(syxwList[0].bt) > 15 }">${fn:substring(syxwList[0].bt,0, 15) }...</c:when><c:otherwise>${syxwList[0].bt }</c:otherwise></c:choose></font>
              </a></td>
              </tr>
          </table>
          <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
            <c:if test="${fn:length(syxwList) > 1 }">
              <td width="20" align="center" valign="top" background="images/123.gif">&nbsp;</td>
            </c:if>
              <td align="center" valign="top">
                  <TABLE width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  	<c:forEach items="${syxwList }" var="item" varStatus="status">
                  	<c:if test="${!status.first }">
                    <tr>
                      <td align=center height=25><table width="98%"  border="0" cellpadding="0" cellspacing="0">
                          <tr align="center">
                            <td height="25" align="left"><a href="showNews.action?article.id=${item.id }" target="_blank" title=标题：${item.bt }">
                            <c:choose><c:when test="${fn:length(item.bt) > 20 }">${fn:substring(item.bt,0, 20) }...</c:when><c:otherwise>${item.bt }</c:otherwise></c:choose>
                            </a></td>
                            <td width="100" align="right"><font class="gray">${item.lrrq }</font></td>
                          </tr>
                      </table></td>
                    </tr>
                    </c:if>
                    </c:forEach>
                  </TABLE></td></tr>
          </table></td>
      </tr>
    </table></td>
    <td width="250" align="center" valign="top"><table width="100%" height="236" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" background="images/bg/01.gif" class="kk">
      <tr>
        <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="right_kq">
          
          <tr>
            <td width="20" height="27" align="center" background="images/nzcms.2011_48.gif"><img src="images/laba.gif"></td>
            <td width="80" align="left" background="images/nzcms.2011_48.gif" class="white12">通知通告</td>
            <td align="right" background="images/left_bg1.jpg"><a href="cat2.action?ejid=${tzgg.id }">更多&gt;&gt;&gt;</a></td>
            </tr>
        </table>
	    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <c:forEach items="${tzggList }" var="item" varStatus="status">
          <tr>
            <td height="25" align="left" valign="middle" >&nbsp;<img src="images/biao.gif" /><a href="showNews.action?article.id=${item.id }" target="_blank" title=标题：${item.bt }>
              <c:choose><c:when test="${fn:length(item.bt) > 15 }">${fn:substring(item.bt,0, 15) }...</c:when><c:otherwise>${item.bt }</c:otherwise></c:choose>
            </a></td>
          </tr>
          </c:forEach>
        </table>
        <table height="6" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
      </td>
  </tr>
</table>
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center">
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="990" height="90">
        <param name="movie" value="flash/ad1/ad1.swf" />
        <param name="quality" value="high" />
        <param name="wmode" value="transparent" />
        <embed src="flash/ad1/ad1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="990" height="90"></embed>
      </object>
    </td>
  </tr>
</table>
<table width="1004" border="0" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            
            <td align=center valign="top"><table width="363" height="200" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="kk">
                <tr>
                  <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                      <tr>
                        <td width="110" height="26" align="center" background="images/nzcms.2011_48.gif" class="white12">政策法规</td>
                        <td align="right" background="images/left_bg1.jpg" class="white"><a href="cat2.action?ejid=${zcfg.id }">+更多&gt;&gt;</a>&nbsp;</td>
                      </tr>
                    </table>
                      <table width="99%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                        <c:forEach items="${zcfgList }" var="item" varStatus="status">
                        <tr>
                          <td height="24" align="left" valign="middle" ><a href="showNews.action?article.id=${item.id }" target="_blank" title=标题：${item.bt };&#13;&#13;发布时间：${item.lrrq }>·<c:choose><c:when test="${fn:length(item.bt) > 15 }">${fn:substring(item.bt,0, 15) }...</c:when><c:otherwise>${item.bt }</c:otherwise></c:choose></a></td>
                          <td width="100" align="center" valign="middle" ><font class="gray">${item.lrrq }</font></td>
                        </tr>
                        </c:forEach>
                  </table></td>
                </tr>
              </table>
                <table height="5" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
            
            <td align=center valign="top"><table width="363" height="200" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="kk">
                <tr>
                  <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                      <tr>
                        <td width="110" height="26" align="center" background="images/nzcms.2011_48.gif" class="white12">政务公开</td>
                        <td align="right" background="images/left_bg1.jpg" class="white"><a href="cat2.action?ejid=${zwgk.id }">+更多&gt;&gt;</a>&nbsp;</td>
                      </tr>
                    </table>
                      <table width="99%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                        <c:forEach items="${zwgkList }" var="item" varStatus="status">
                        <tr>
                          <td height="24" align="left" valign="middle" ><a href="showNews.action?article.id=${item.id }" target="_blank" title=标题：${item.bt };&#13;&#13;发布时间：${item.lrrq }>·<c:choose><c:when test="${fn:length(item.bt) > 15 }">${fn:substring(item.bt,0, 15) }...</c:when><c:otherwise>${item.bt }</c:otherwise></c:choose></a></td>
                          <td width="100" align="center" valign="middle" ><font class="gray">${item.lrrq }</font></td>
                        </tr>
                        </c:forEach>
                  </table></td>
                </tr>
              </table>
                <table height="5" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
          </tr>
    </table>
    </td>
    <td width="250" align="center" valign="top"><table height="5" border="0" cellpadding="0" cellspacing="0">
    </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="kk">
        <tr>
          <td height="25" align="center" background="images/nzcms.2011_48.gif" class="white">::&nbsp;&nbsp;<span class="white12">投诉建议</span>&nbsp;&nbsp;::</td>
        </tr>
        <tr>
          <td><iframe src="message.jsp" name="sina_roll" width="100%" marginwidth="0" height="170" marginheight="0" scrolling="no" frameborder="No" id="sina_roll" border="0"></iframe></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center"><table width="99%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F1F9FE" class="kk">
      <tr>
        <td width="25" align="center" valign="middle" background="images/tu2.jpg" bgcolor="#0066CC" class="white"><a href="picNews.action"><img src="images/tu.jpg" border="0"></a></td>
        <td align="center" valign="top" bgcolor="#FFFFFF"><table width="10" height="5"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td></td>
            </tr>
          </table>
          

<div id="marquee_demo" style="overflow:hidden;width:950px;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id="marquee_product1">
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
        
          <c:forEach items="${tpList }" var="item" varStatus="status">
          <td align="center" valign="top"><table border="5" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#333333" class="bgkk2">
              <tr>
                <td valign="bottom"><a href="showNews.action?article.id=${item.id }" target="_blank"><img src="${item.image }" alt="${item.bt }" name="" width="120" height="100" border="0"></a></td>
              </tr>
          </table></td>
          </c:forEach>
          
        </tr>
      </table></td>
      <td id="marquee_product2"></td>
    </tr>
  </table>
</div>
<script>
var speed=30;
var marquee_demo=document.getElementById("marquee_demo");
var marquee_product1=document.getElementById("marquee_product1");
var marquee_product2=document.getElementById("marquee_product2");
marquee_product2.innerHTML=marquee_product1.innerHTML;
function Marquee(){
	if(marquee_product2.offsetWidth-marquee_demo.scrollLeft<=0){
		marquee_demo.scrollLeft-=marquee_product1.offsetWidth;
	}else{
		marquee_demo.scrollLeft++;
	}
}
var MyMar=setInterval(Marquee,speed);
marquee_demo.onmouseover=function(){clearInterval(MyMar);}
marquee_demo.onmouseout=function(){MyMar=setInterval(Marquee,speed);}
</script>

		  
		  
		  
		  </td>
      </tr>
    </table>
      <table width="10" height="6"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table></td>
  </tr>
</table>
<s:action name="bottom" executeResult="true" ignoreContextParams="true" />