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
            > 正文
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
                                <#if cat.url?substring(0,4)=="http">
                                    <a href="${cat.url}" target="_blank" <#if cat.id=id> class="hover"</#if>>${cat.name}</a>
                                <#else>
                                    <a href="${contextPath}/${cat.url}" target="_blank" <#if cat.id=id> class="hover"</#if>>${cat.name}</a>
                                </#if>
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
            <div class="danye">
            <@categoryTag id=id; cat>
                <h2>${cat.name}</h2>
            </@categoryTag>
            </div>
            <div  class="danye-list">
                <@articleTag catid=id; article>
                    ${(article.content)!''}
                </@articleTag>
            </div>
        </div>
        <div class="clear"></div>
        <!--列表、内容页面代码  end-->
    </div>
<#include "bottom.ftl">
