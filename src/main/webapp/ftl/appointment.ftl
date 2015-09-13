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

        <div class="ffcl">
            <div class="banner"></div>
            <div class="main">
                <div class="main-l">
                <@categoryTag id=id; cat>
                    <div class="ffcl-title">
                        <h4>最新消息</h4>
                    </div>
                    <div class="ffcl-blk">
                    <@articleListTag catid=id size=18; list>
                        <#list list as article>
                            <#if article_index%6==0>
                            <ul>
                            </#if>
                            <li>
                                <#if cat.categoryType=="4">
                                <a href="http://${article.url}" target="_blank">
                                <#elseif cat.categoryType=="5">
                                <a href="${contextPath}${article.doc}" target="_blank">
                                <#else>
                                <a href="<@c.url value="${contextPath}/content.action?id=${article.id}"/>" target="_blank">
                                </#if>
                                <#if article.shortTitle?? && article.shortTitle!="">${article.shortTitle}<#else>${article.title}</#if>
                                </a>
                            </li>
                            <#if (article_index+1)%6==0 || !article_has_next>
                            </ul>
                            </#if>
                        </#list>
                    </@articleListTag>
                    </div>
                </@categoryTag>
                </div>
                <div class="main-r">
                    <div class="ffcl-title">
                        <h4>东营市廉政教育中心 参观登记</h4>
                    </div>
                    <div class="ffcl-blk">
                        <div class="forms">
                            <form action="${contextPath}/appoint/" id="appointment_form" method="post">
                                <p><label for=""><span>*</span>单位名称：</label><input type="text" name="appointment.orgName" /></p>
                                <p><label for=""><span>*</span>领队姓名：</label><input type="text" name="appointment.leaderName" /></p>
                                <p><label for=""><span>*</span>职　　务：</label><input type="text" name="appointment.post" /></p>
                                <p><label for=""><span>*</span>联系人姓名：</label><input type="text" name="appointment.contactPerson" /></p>
                                <p><label for=""><span>*</span>联系方式：</label><input type="text" name="appointment.contactInfo" /></p>
                                <p><label for=""><span>*</span>参观人数：</label><input type="text" name="appointment.number" /></p>
                                <p><label for=""><span>*</span> 参观时间：</label><input type="text" name="appointment.date" class="Wdate" onfocus="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" /></p>
                                <p><label for=""><span>*</span> 内容：</label><textarea name="appointment.content" rows="4" cols="30" style="width:250px;"></textarea></p>
                                <p class="btn"><input type="submit" value="提交" class="btn-l" /><input type="reset" value="重置" class="btn-r" /></p>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!--列表、内容页面代码  end-->
    </div>
<script type="text/javascript">
    $(function() {
        jQuery.extend(jQuery.validator.messages, {
            required: "必填",
            date: "请输入合法的日期",
            number: "请输入合法的数字",
            digits: "只能输入整数",
            maxlength: jQuery.validator.format("最多可输入 {0} 个字符")
        });
        $("#appointment_form").validate({
            rules: {
                "appointment.orgName": {required: true, maxlength:45},
                "appointment.leaderName": {required: true, maxlength:45},
                "appointment.post": {required: true, maxlength:45},
                "appointment.contactPerson": {required: true, maxlength:45},
                "appointment.contactInfo": {required: true, maxlength:45},
                "appointment.number": {required: true, digits:true},
                "appointment.date": {required: true, date:true},
                "appointment.content": {required: true, maxlength:200}
            }
        });
    });
</script>
<#include "bottom.ftl">
