<#include "top.ftl">
    <div class="content">
        <!--列表、内容页面代码  start-->
        <!--列表、内容页面的css请写在content.css文件中的 content container 注释下面-->
        <div class="theCurrent">
            <!--当前  start-->
            所在位置：
            <a href="<@c.url value="${contextPath}/index.action"/>">首页</a>
            >
            <a href="<@c.url value="${contextPath}inspection.action"/>">巡查信箱</a>
            > 举报
            <!--当前  end-->
        </div>
        <!--巡查信箱-->
        <div class="content-tijiao">
            <div class="forms">
                <form action="${contextPath}/inspect_report_insert/" id="report_form" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="inspectReport.inspectId" value="${id}" />
                    <p class="jbfs">
                        <input  name="jubao" type="radio"  value="0" checked />实名举报
                        <input type="radio" name="jubao"  value="1"   />匿名举报</p>
                    <div class="form-show">
                        <p class="f-bt">反映人信息</p>
                        <p><label for="">姓名：</label><input type="text" name="inspectReport.reportName" maxlength="50" /></p>
                        <p><label for="">联系电话：</label><input type="text" name="inspectReport.reportContact" maxlength="50" /></p>
                        <p><label for="">工作单位（住址）及职务：</label><input type="text" name="inspectReport.reportCondition" maxlength="100"  style="width:460px;" /></p>
                        <div class="line"></div>
                    </div>
                    <p class="f-bt">被反映人信息</p>
                    <p><label for="">姓名：</label><input type="text" name="inspectReport.reportedName" maxlength="50" /></p>
                    <p><label for="">工作单位（住址）及职务：</label><input type="text" name="inspectReport.reportedCondition" maxlength="100"  style="width:460px;" /></p>
                    <div class="line"></div>
                    <p class="f-bt">反映问题内容</p>
                    <p><label for="">标题（最多50字）</label><textarea name="inspectReport.title" rows="1" cols="30" maxlength="50"></textarea></p>
                    <p><label for="">主要问题（1000字以内）：</label><textarea name="inspectReport.problem" rows="5" cols="30" maxlength="1000"></textarea></p>
                    <p>附件：提示！上传的文件大小不超过1M，类型仅限后缀为.doc、.xls、.pdf、.jpg、.bmp、.gif、.jpeg、.tiff、.rar、.zip文件，禁止exe、bat等格式文件上传！</p>
                    <p><input type="file" name="doc" /></p>
                    <table>
                        <tr>
                            <td>验证码：</td>
                            <td><input type="text" name="rand" /></td>
                            <td><img id="rand_img" src="${contextPath}/open/rand.action?d=<%=new java.util.Date() %>"></td>
                            <td><a href="javascript:document.getElementById('rand_img').src='${contextPath}/open/rand.action?d='+new Date();void(0);">看不清，换一张</a></td>
                        </tr>
                    </table>
                    <p class="btn"><input type="submit" value="提交" class="btn-l" /><input type="reset" value="重置" class="btn-r" /></p>
                </form>
            </div>
        </div>
        <div class="clear"></div>
        <!--列表、内容页面代码  end-->
    </div>
<script type="text/javascript">
    $(".header-banner").slide({mainCell:".site-slider ul",autoPlay:true,interTime:4000});
    $(".form-show").show();
    $("input[name=jubao]").click(function(){
        var j=$("input[name='jubao']:checked").val();
        if(j==0){
            $(".form-show").show();
        }else{
            $(".form-show").hide();
        }
    })

    $(function() {
        jQuery.extend(jQuery.validator.messages, {
            required: "必填",
            maxlength: jQuery.validator.format("最多可输入 {0} 个字符")
        });
        $("#report_form").validate({
            rules: {
                "inspectReport.reportedName": {required: true, maxlength:50},
                "inspectReport.reportedCondition": {required: true, maxlength:100},
                "inspectReport.title": {required: true, maxlength:50},
                "inspectReport.problem": {required: true, maxlength:1000},
                "rand": {required: true}
            }
        });
    });
</script>
<#include "bottom.ftl">