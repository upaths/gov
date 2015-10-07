<#include "../top.ftl">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/public.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/xz.css">
<script type="text/javascript">
    var intervalProcess = null, i = 15;
    $(document).ready(function(){
        $("input[type='button'][title='署名举报']").bind('click',function(){
            window.location="<@c.url value="${contextPath}/report_form.action?org=${org}&flag=1"/>";
        })
        $("input[type='button'][title='匿名举报']").bind('click',function(){
            window.location="<@c.url value="${contextPath}/report_form.action?org=${org}&flag=0"/>";
        })
        acceptLicense();
    });
    function waiteTime() {
        i--;
        $("input[type='button'][title='署名举报']").each(function(o) {
            $(this).val($(this).attr("title")+"("+i+")");
            if(i <= 0) {
                $(this).val($(this).attr("title"));
                $(this).attr("disabled", false);
            }
        });
        $("input[type='button'][title='匿名举报']").each(function(o) {
            //$(this).val($(this).attr("title")+"("+i+")");
            if(i <= 0) {
                $(this).val($(this).attr("title"));
                $(this).attr("disabled", false);
            }
        });
        if(i <= 0) {
            clearInterval(intervalProcess);
        }
    }

    function acceptLicense(){
        var acceptCheck = document.getElementById("acceptCheckbox");
        if(acceptCheck.checked == true){
            document.getElementById("sm").disabled="";
            document.getElementById("nm").disabled="";
            document.getElementById("sm").className="button_sm";
            document.getElementById("nm").className="button_nm";
        } else {
            document.getElementById("sm").disabled="disabled";
            document.getElementById("nm").disabled="disabled";
            document.getElementById("sm").className="button_sm_grey";
            document.getElementById("nm").className="button_nm_grey";
        }
    }
</script>
<div class="page_main">
    <div class="page_main_bg">
        <div class="page_main_con">
            <div class="xz_tit">
                <div class="left xz_tit_con">
                </div>
            </div>
            <div class="page_main_text" style="width: 680px; margin-left: 20px;">
                <div style="text-indent: 30pt; width: 680px; line-height: 40px;">
							<span style="FONT-SIZE: 16pt;"><font face="宋体">一、纪检监察机关举报网站受理范围：
                            </font> </span>
                </div>
                <div style="text-indent: 30pt; width: 680px; line-height: 40px;">
							<span style="FONT-SIZE: 16pt;"><font face="宋体">1.针对党组织、党员和监察对象违反党纪政纪问题的检举、控告；
                            </font> </span>
                </div>
                <div style="text-indent: 30pt; width: 680px; line-height: 40px;">
							<span style="FONT-SIZE: 16pt;"><font face="宋体">2.依法应由纪检监察机关受理的党组织、党员和监察对象不服党纪政纪处分和其他处理的申诉；
                            </font> </span>
                </div>
                <div style="text-indent: 30pt; width: 680px; line-height: 40px;">
							<span style="FONT-SIZE: 16pt;"><font face="宋体">3.对党风廉政建设和纪检监察工作的批评、建议。
                                <span lang="EN-US"><o:p></o:p> </span>
                            </font></span><font face="宋体">
                </font></div><font face="宋体">

                <div style="text-indent: 30pt; width: 680px; line-height: 40px;">
							<span style="font-size: 16pt;">二、举报人应对所举报的问题真实性负责。对借举报故意捏造事实、诬告陷害他人的或者以举报为名制造事端，干扰纪检监察机关正常工作的，依照有关规定严肃处理，构成犯罪的，移送司法机关依法处理。
								<span lang="EN-US"><o:p></o:p> </span> </span>
                </div>

                <div style="text-indent: 30pt; width: 680px; line-height: 40px;">
							<span style="font-size: 16pt; ">三、纪检监察机关提倡署名举报，特别鼓励署真实姓名和准确联系方式的实名举报。对认定为实名举报的，优先办理，及时回复。
							</span><span lang="EN-US" style="font-size: 18pt; font-family: 仿宋_GB2312;"><o:p></o:p>
							</span>
                </div>

                <div style="text-indent: 30pt; width: 680px; line-height: 40px;">
							<span style="font-size: 16pt; ">四、反映纪检监察机关受理范围外的问题，请向相关部门提出。<!--（<a
								href="./wordPage.html" target="_blank">请查看详情</a>）--> </span><span lang="EN-US" style="font-size: 18pt; font-family: 仿宋_GB2312;"><o:p></o:p>
							</span>
                </div>

                <div class="left xz_con_list" style=" font-weight: bolder; font-size: 16pt; margin-top: 5px; margin-left: 20px;">
                    <input type="checkbox" name="acceptCheckbox" id="acceptCheckbox" onclick="acceptLicense()">
                    我已阅读以上条款
                </div>
            </div>
            <div class="page_main_tit" style="margin-top: 50px;">
                <input type="button" title="署名举报" id="sm" class="button_sm_grey" disabled="">
                <input type="button" title="匿名举报" id="nm" class="button_nm_grey" disabled="" style="margin-left: 20px;">
            </div>
        </div>
    </div>
</div>
<#include "../bottom.ftl">