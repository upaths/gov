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
            <#if catid??&&catid!=pid>
                >
                <@categoryTag id=catid; cat>
                    <a href="<@c.url value="${contextPath}/list.action?id=${cat.id}&page=1"/>">${cat.name}</a>
                </@categoryTag>
            </#if>
            > 正文
            <!--当前  end-->
        </div>
        <@articleTag id=id; article>
        <div class="content-content">
            <div class="headings">
                <h3>${article.title}</h3>
                    <span>来源：${article.source}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                <span>发布时间：${article.date?string("yyyy-MM-dd")}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                <span>浏览次数： ${article.readTime}</span>
            </div>
            <div class="article">
                ${article.content}
            </div>
        </div>
        </@articleTag>
        <div class="clear"></div>
        <!--列表、内容页面代码  end-->
    </div>
<#include "bottom.ftl">