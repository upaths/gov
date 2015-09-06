<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    function selectResource(id) {
        parent.parent.top_frame.selectResource(id);
    }
</script>
</head>
<body>
<table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <table width="98%" border="1" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
        <tr>
          <td colspan="2" align="center" class="nzcms_table_top">站点提醒</td>
        </tr>
        <tr>
          <td width="10%" align="right" bgcolor="#E4EDF9">提醒信息</td>
          <td bgcolor="#FFFFFF">
登录成功，请谨慎操作，谢谢！
</td>
        </tr>
      </table>
      <table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="98%" border="1" cellpadding="10" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED" class="bg_q">

        <tr>
          <td height="90" align="center" bgcolor="#FFFFFF" >
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <c:forEach items="${resourceList}" var="item" varStatus="status">
                <c:if test="${status.index % 3 == 0}">
                  <tr>
                </c:if>
                <td align=left>
                    <table border="1" cellpadding="5" cellspacing="0" bordercolor="#FFFFFF"onMouseOver="this.style.borderColor='#5FBDDC';" onMouseOut="this.style.borderColor='#9FCDEC'" class="bg_q">
                    <tr>
                        <td align="center" onclick="selectResource('${item.id}');" style="width:176px; height:75px; cursor:hand; background-image: url(images/nzcms/home_${item.id}.jpg)">
                            <div style="font-weight: bold; padding-left: 30px;">${item.name}</div>
                        </td>
                    </tr>
                    </table>
                    <table width="0" height="15" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                </td>
                <c:if test="${status.count % 3 == 0 || status.last}">
                  </tr>
                </c:if>
              </c:forEach>
          </table></td>
        </tr>
      </table>
      <table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
</body>
</html>