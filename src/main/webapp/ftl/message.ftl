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
            <div class="title">
                <h2>交流互动</h2>
            </div>
            <div class="forms">
                <h4>我要留言<span>（*为必填）</span></h4>
                <form action="${contextPath}/message/" id="message_form" method="post">
                    <p><label for="">昵称：</label><input type="text" name="message.netName" /></p>
                    <p><label for="">电话：</label><input type="text" name="message.telephone" /></p>
                    <p><label for=""><span>*</span> 标题：</label><input type="text" name="message.title"  style="width:460px;" /></p>
                    <p><label for=""><span>*</span> 内容：</label><textarea name="message.content" rows="5" cols="30"></textarea></p>
                    <p class="btn"><input type="submit" value="提交" class="btn-l" /><input type="reset" value="重置" class="btn-r" /></p>
                </form>
            </div>
            <@messageListTag page=page size=6; list,currentPage,totalPage>
            <div class="hudong-list">
                <h4>网友留言</h4>
                <ul>
                <#list list as msg>
                    <li>
                        <h3>
                            ${msg.title}
                        </h3>
                        <p>${msg.content}</p>
                        <span><#if msg.netName?? && msg.netName!="">网友：${msg.netName}</#if>   发表时间：${msg.date?string("yyyy-MM-dd")}</span>
                        <div class="clear"></div>
                    </li>
                </#list>
                </ul>
            </div>
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
            </@messageListTag>
        </div>
        <div class="clear"></div>
        <!--列表、内容页面代码  end-->
    </div>
<script type="text/javascript">
    $(function() {
        jQuery.extend(jQuery.validator.messages, {
            required: "必填"
        });
        $("#message_form").validate({
            rules: {
                "message.title": {required: true, maxlength:100},
                "message.content": {required: true}
            }
        });
    });
</script>
<#include "bottom.ftl">