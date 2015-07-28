<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="top" executeResult="true" ignoreContextParams="true" />

<table width="1004" border="0" align="center" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
  <tr>
    <td align="center" valign="top" class="bg_qc"><script> 
function z(v){ 
var z=document.getElementById("z") 
if (v=="b") 
{ 
z.style.fontSize="18px" 
} 
if (v=="m") 
{ 
z.style.fontSize="14px" 
} 
if (v=="s") 
{ 
z.style.fontSize="12px" 
} 

} 
        </script>
      <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" class="p24"><table height="25" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td></td>
                </tr>
              </table>
            ${article.bt }
            <table height="25" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td></td>
                </tr>
            </table></td>
        </tr>
      </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F6F6F6" class="dx">
        <tr>
          <td height="20" align="center">信息来源：${article.xxly }&nbsp;&nbsp;&nbsp;&nbsp;发稿作者：${article.gg }&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${article.lrrq }&nbsp;&nbsp;&nbsp;查看${article.ydcs }次&nbsp;&nbsp; 字体：[<a href="#" onClick="z('b')" style="font-size: 18px;">大</a>]   [<a href="#" onClick="z('m')" style="font-size: 14px;">中</a>]   [<a href="#" onClick="z('s')" style="font-size: 12px;">小</a>]</td>
        </tr>
      </table>
      <table height="15" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left"><div class="z" id="z">
          ${article.nr }
          </div></td>
        </tr>
      </table>
      <table width="98%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="middle">


<input type=button onclick="window.location='javascript:window.print()'" value="打印此页">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type=button onclick="window.location='#'" value="返回顶部">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" onClick="jscript:window.external.AddFavorite(document.location.href,document.title);" value="收藏本页" />
&nbsp;&nbsp;&nbsp;&nbsp;
<input type=button onclick="window.location='javascript:window.close();'" value="关闭窗口">


</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<s:action name="bottom" executeResult="true" ignoreContextParams="true" />