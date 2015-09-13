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
            > 列表
            <!--当前  end-->
        </div>

        <div class="content-e-ti">
            <@topicTag id=id; topic>
            <div class="banner">
                 <h2>${topic.month}</h2>
            </div>
            <div class="e-ti">
                <div class="e-ti-top"></div>
                <div class="e-ti-content">
                    <div class="e-ti-t">
                        <h3>${topic.title}</h3>
                        <p>${topic.content}</p>
                    </div>
            </@topicTag>
                    <div class="e-ti-l">
                        <div class="e-ti-blk1 blkz">
                            <div class="e-ti-title">
                                <h4>栏目简介</h4>
                            </div>
                            <p>每月e题是以留言板的形式，每月发布一个与党风廉政建设和反腐败工作相关的主题，并邀请广大网民就这一主题发表评论。</p>
                        </div>

                        <div class="e-ti-blk2 blkz">
                            <div class="e-ti-title">
                                <h4><a href="#">往期回顾</a></h4>
                            </div>
                            <ul>
                            <@topicListTag sort="month desc"; list>
                                <#list list as topic>
                                    <#if topic.id != id>
                                        <li>
                                            <span>${topic.month}</span>
                                            <a href="<@c.url value="${contextPath}/topic.action?catid=${catid}&id=${topic.id}&page=1"/>">${topic.title}</a>
                                        </li>
                                    </#if>
                                </#list>
                            </@topicListTag>
                            </ul>
                        </div>

                        <div class="e-ti-blk3 blkz">
                            <div class="e-ti-title">
                                <h4>留言须知</h4>
                            </div>
                            <div class="xz">
                                <p>遵守中华人民共和国有关法律、法规，所发内容不得含有《互联网新闻信息服务管理规定》第十九条所列内容。</p>
                                <p>尊重社会公德，承担一切因您的留言直接或间接引起的法律责任。</p>
                                <p>本网站拥有管理留言的一切权力，包括审核、发布、引用和删除您的留言及其他管理权力。</p>
                                <p>参与本网站留言即表明您已经阅读并接受上述条款。</p>
                                <p>每月e题开放时间为工作日9:00—16:00</p>
                            </div>
                        </div>
                    </div>
                    <div class="e-ti-r">
                        <div class="e-ti-blk4 blkz">
                            <div class="e-ti-title">
                                <h4>最新留言</h4>
                            </div>
                        <@topicCommentListTag topid=id sort="date desc" page=page size=4; list,currentPage,totalPage>
                            <ul>
                            <#list list as comment>
                                <li>
                                    <span>网友：<em>${comment.netName}</em> ${comment.date?string("yyyy/MM/dd HH:mm:ss")}</span>
                                    <p>${comment.comment}</p>
                                </li>
                            </#list>
                            </ul>
                            <div class="page">
                                <#if currentPage=1>
                                    <a href="javascript:void(0)">上一页</a>
                                <#else>
                                    <a href="<@c.url value="${contextPath}/topic.action?catid=${catid}&id=${id}&page=${currentPage-1}"/>">上一页</a>
                                </#if>
                                <@repeat count=totalPage; cnt>
                                    <a href="<@c.url value="${contextPath}/topic.action?catid=${catid}&id=${id}&page=${cnt}"/>">${cnt}</a>
                                </@repeat>
                                <#if currentPage=totalPage>
                                    <a href="javascript:void(0)">下一页</a>
                                <#else>
                                    <a href="<@c.url value="${contextPath}/topic.action?catid=${catid}&id=${id}&page=${currentPage+1}"/>">下一页</a>
                                </#if>
                                <div class="clear"></div>
                            </div>
                        </@topicCommentListTag>
                        </div>
                        <div class="e-ti-blk5 blkz">
                            <div class="e-ti-title">
                                <h4>我要留言<span>（*为必填）</span></h4>
                            </div>
                            <div class="forms">
                                <form action="${contextPath}/comment/" id="comment_form" method="post">
                                    <input type="hidden" name="topicComment.topicId" value="${id}" />
                                    <p><label for="">昵称：</label><input type="text" name="topicComment.netName" /></p>
                                    <p><label for="">电话：</label><input type="text" name="topicComment.telephone" /></p>
                                    <p><label for=""><span>*</span> 内容：</label><textarea name="topicComment.comment" rows="5" cols="30"></textarea></p>
                                    <p class="btn"><input type="submit" value="提交" class="btn-l" /><input type="reset" value="重置" class="btn-r" /></p>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!--列表、内容页面代码  end-->
    </div>
<script type="text/javascript">
    $(function() {
        jQuery.extend(jQuery.validator.messages, {
            required: "必填"
        });
        $("#comment_form").validate({
            rules: {
                "topicComment.comment": {required: true}
            }
        });
    });
</script>
<#include "bottom.ftl">