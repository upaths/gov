<#include "top.ftl">
    <div class="content">
        <!--列表、内容页面代码  start-->
        <!--列表、内容页面的css请写在content.css文件中的 content container 注释下面-->
        <div class="theCurrent">
            <!--当前  start-->
            所在位置：
            <a href="<@c.url value="${contextPath}/index.action"/>">首页</a>
            >
            <@categoryTag id=pid; cat>
                <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>">${cat.name}</a>
            </@categoryTag>
            <#if id!=pid>
                >
                <@categoryTag id=id; cat>
                    <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>">${cat.name}</a>
                </@categoryTag>
            </#if>
            > 列表
            <!--当前  end-->
        </div>
        <div class="content-left">
            <div class="blk1">
                <div class="title">
                <@categoryTag id=pid; cat>
                    <h2>${cat.name}</h2>
                </@categoryTag>
                </div>
                <ul>
                <@categoryListTag pid=pid; list>
                    <#list list as cat>
                        <li>
                        <#if cat.templet?? && cat.templet!="">
                            <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>"<#if cat.id=id> class="hover"</#if>>${cat.name}</a>
                        <#elseif cat.url?? && cat.url!="">
                            <a href="http://${cat.url}" target="_blank" <#if cat.id=id> class="hover"</#if>>${cat.name}</a>
                        <#else>
                            <a href="javascript:void(0)"<#if cat.id=id> class="hover"</#if>>${cat.name}</a>
                        </#if>
                        </li>
                    </#list>
                </@categoryListTag>
                </ul>
            </div>
            <div class="blk2">
                <div class="title">
                    <h2>热门关注</h2>
                </div>
                <ul>
                <@articleListTag size=10 sort="read_time desc"; list>
                    <#list list as article>
                        <li><a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                            <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                        </a></li>
                    </#list>
                </@articleListTag>
                </ul>
            </div>
        </div>
        <div class="content-right">
        <@categoryTag id=id; cat>
            <div class="title">
                <h2>${cat.name}</h2>
            </div>
            <@articleListTag catid=id size=10 page=page; list,currentPage,totalPage>
            <ul class="text-list">
                <#list list as article>
                    <li>
                        <h3>
                            <span>${article.date?string("yyyy-MM-dd")}</span>
                            <#if cat.categoryType=="4">
                                <a href="http://${article.url}" target="_blank">
                            <#elseif cat.categoryType=="5">
                                <a href="${contextPath}${article.doc}" target="_blank">
                            <#else>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                            </#if>
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
                    <a href="<@c.url value="${contextPath}/list.action?id=${id}&page=${currentPage-1}"/>">上一页</a>
                </#if>
                <@repeat count=totalPage; cnt>
                    <a href="<@c.url value="${contextPath}/list.action?id=${id}&page=${cnt}"/>">${cnt}</a>
                </@repeat>
                <#if currentPage=totalPage>
                    <a href="javascript:void(0)">下一页</a>
                <#else>
                    <a href="<@c.url value="${contextPath}/list.action?id=${id}&page=${currentPage+1}"/>">下一页</a>
                </#if>
                <div class="clear"></div>
            </div>
            </@articleListTag>
        </@categoryTag>
        </div>
        <div class="clear"></div>
        <!--列表、内容页面代码  end-->
    </div>
<#include "bottom.ftl">