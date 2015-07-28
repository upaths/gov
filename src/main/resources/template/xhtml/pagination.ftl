<#if parameters.pageBean?exists>
<table<#rt/>
<#if parameters.cssStyle?exists>
 style="${parameters.cssStyle}"<#rt/>
</#if>
<#if parameters.cssClass?exists>
 class="${parameters.cssClass}"<#rt/>
</#if>>
<#assign tmp=parameters.pageBean/>
<form name="pages" method="post" action="${parameters.url}"><#rt/>
  <tr><td>
   <#if parameters.pageBean.params?exists>
    <#assign paramMap=parameters.pageBean.params/>
    <#assign entrys=paramMap.entrySet()/>
    <#list entrys as entry>
    <input type='hidden' name='${entry.key}' value="${entry.value}"/>
	</#list>
   </#if>
   每页${tmp.pageSize}条/共${tmp.totalRows}条 第${tmp.currentPage}页/共${tmp.totalPages}页<#rt/>
   <#if (tmp.firstPage)>
       第一页 上一页
   <#else>
       <a href="" onclick="submitPage('1');return false">第一页</a>
       <a href="" onclick="submitPage('${tmp.currentPage- 1}');return false">上一页</a>
   </#if>
   <#if (tmp.lastPage)>
       下一页 最后一页
   <#else>
       <a href="" onclick="submitPage('${tmp.currentPage+ 1}');return false">下一页</a>
       <a href="" onclick="submitPage('${tmp.totalPages}');return false">最后一页</a>
   </#if>
      每页<input type="text" name="pageBean.pageSize" size="4" value="${tmp.pageSize}">条
      转到<input type="text" name="goPage" size="4" value="${tmp.currentPage}">页
      <input type="hidden" name="pageBean.currentPage" value="${tmp.currentPage}"/>
      <input type="button" name="go" value="GO" onclick="submitPage(document.all.goPage.value)">
  </td></tr>
</form>    
</table>
    <script type="text/javascript">
        function submitPage(page) {
              document.all["pageBean.currentPage"].value = page;
              document.all.pages.submit();
        }
    </script>
</#if>