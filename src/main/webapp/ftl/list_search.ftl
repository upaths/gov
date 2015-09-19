<#include "top.ftl">
    <div class="content">
        <!--列表、内容页面代码  start-->
        <!--列表、内容页面的css请写在content.css文件中的 content container 注释下面-->
        <div class="theCurrent">
            <!--当前  start-->
            所在位置：
            <a href="<@c.url value="${contextPath}/index.action"/>">首页</a>
            > 搜索
            <!--当前  end-->
        </div>
        <@articleListTag title=title size=15 page=page; list,currentPage,totalPage,total>
        <!--list-search-->
        <div class="list-search">
            <div class="title">
                <p>搜索<span>“${title}”</span> 获得<span>${total}</span>条结果，以下是第<span> ${(page-1)*15+1}-${page*15}</span> 条。</p><h2>搜索结果</h2>
            </div>
            <ul class="text-list">
            <#list list as article>
                <li>
                    <h3>
                        <span>${article.date?string("yyyy-MM-dd")}</span>
                        <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                            <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                        </a>
                        <div class="clear"></div>
                    </h3>
                </li>
            </#list>
            </ul>
            <div class="page">
                <#if currentPage=1>
                    <a href="javascript:void(0)">上一页</a>
                <#else>
                    <a href="<@c.url value="${contextPath}/search.action?title=${title}&page=${currentPage-1}"/>">上一页</a>
                </#if>
                <@repeat count=totalPage; cnt>
                    <a href="<@c.url value="${contextPath}/search.action?title=${title}&page=${cnt}"/>">${cnt}</a>
                </@repeat>
                <#if currentPage=totalPage>
                    <a href="javascript:void(0)">下一页</a>
                <#else>
                    <a href="<@c.url value="${contextPath}/search.action?title=${title}&page=${currentPage+1}"/>">下一页</a>
                </#if>
                <div class="clear"></div>
            </div>
        </div>
        </@articleListTag>
        <!--列表、内容页面代码  end-->
    </div>
<#include "bottom.ftl">
