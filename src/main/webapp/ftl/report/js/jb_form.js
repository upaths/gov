//举报信主要问题最大长度
var max_len = 6000;
$(document).ready(function(){
    //主要问题文字个数提示
    $("#tip").text(max_len);

    var obj = document.getElementById("problem");
    $("#problem").keyup(function(){
        if(obj.value.length > max_len) {
            alert("请不要超过最大长度:" + max_len);
            obj.value = obj.value.substring(0, max_len);
        }
        $("#tip").text(max_len - obj.value.length);
    });
    //问题类别，下拉列表改变时，修改细类
    $("#problemType").change(function(){
        changeProblemType($("#problemType").find("option:selected").text());
    });
});

function myTrim(str){
    str = str.replace(/^ +/,''); //将开头的N个空格替换成''（空）；
    str = str.replace(/ +$/,''); //将末尾的N个空格替换为''（空）；
    return str;
}

function changeProblemType(v) {
    var selected  = document.getElementById('problemTypeDetail');
    selected.options.length = 0;
    if(v == '' || v =='==请选择==') {
        selected.options.length = 0;
        var option = new Option('==请选择==', '');
        selected.options.add(option);
    } else {
        var objItemValue;
        var opText;
        if(v == '违反政治纪律行为') {
            objItemValue = '1|发表散布有严重政治问题的言论,2|不执行党和国家方针政策部署决定,3|违反党和国家民族宗教政策,4|造谣传播丑化党和国家形象,5|其他违反政治纪律行为';
        } else if(v == '违反组织人事纪律行为') {
            objItemValue = '6|违反民主集中制,7|违反干部选拔任用规定,8|违反干部人事劳动规定谋取利益,9|其他违反组织人事纪律行为';
        } else if(v == '违反廉洁自律规定行为') {
            objItemValue = '10|非法占有或占用,11|接受礼品礼金宴请,12|违规从事营利活动,13|挥霍浪费公共财产,14|违反住房规定,15|其他违反廉洁自律规定行为';
        } else if(v == '贪污贿赂行为') {
            objItemValue = '16|贪污,17|贿赂,18|挪用公款,19|巨额财产来源不明,20|其他贪污贿赂行为';
        } else if(v == '破坏社会主义经济秩序行为') {
            objItemValue = '21|单位挪用资金,22|非法经营同类业务,23|企事业单位人员为亲友非法牟利,24|违反金融税收法律法规,25|违反土地管理法律法规,26|其他破坏社会主义经济秩序行为';
        } else if(v == '违反财经纪律行为') {
            objItemValue = '27|骗取国家拨款,28|违规造成国有资产流失,29|违反政府采购和招投标法律法规,30|其他违反财经纪律行为';
        } else if(v == '失职渎职行为') {
            objItemValue = '31|生产经营管理失职渎职,32|执纪执法司法失职渎职,33|安全责任事故,34|其他失职渎职行为';
        } else if(v == '侵犯党员权利公民权利行为') {
            objItemValue = '35|侵犯民主权利,36|侵犯人身权利,37|打击报复,38|其他侵犯党员权利公民权利行为';
        } else if(v == '严重违反社会主义道德行为') {
            objItemValue = '39|弄虚作假骗取荣誉,40|通奸重婚包养,41|其他严重违反社会主义道德行为';
        } else if(v == '妨害社会管理秩序行为') {
            objItemValue = '42|色情嫖娼淫秽活动,43|违反人口与计划生育法律法规,44|包庇违纪违法犯罪,45|其他妨害社会管理秩序行为';
        } else if(v == '其他违纪行为') {
            objItemValue = '46|其他违纪行为';
        }
        opText = objItemValue.split(',');
        var option = new Option('==请选择==', '');
        if(v != '其他违纪行为') {
            selected.options.add(option);
        }
        for(var i = 0; i < opText.length; i++) {
            var item = new Option(opText[i].split('|')[1], selected);
            selected.options.add(item);
            //值和显示的内容
            item.value = opText[i].split('|')[1];
            item.text = opText[i].split('|')[1];
        }
    }
}