	//打开新窗口方法
	function OpenWindow(src,num) {

		var loadpos = src; 
		
		var WWidth=800,   WHeight=window.screen.availHeight-200;
		
		if(num == 0){
			WWidth = 600,WHeight=window.screen.availHeight-400;
		}
		
		var WinOP;
		
		var   WLeft   =   Math.ceil((window.screen.width   -   WWidth)   /   2   );   
		var   WTop   =   Math.ceil((window.screen.height   -   WHeight)   /   2   );   
		
		var   features   = 
		'width= '     +   WWidth     +   'px, '   + 
		'height= '   +   WHeight     +   'px, '   + 
		'left= '       +   WLeft     +   'px, '   + 
		'top= '         +   WTop     +   'px, '   + 
		'menubar=no,toolbar=no,location=no,directories=no,status=yes,scrollbars=yes, resizable=yes '; 
		WinOP   =   window.open(loadpos,   "_blank",   features); 
		WinOP.focus();   

	
	}
	
	//控制textarea长度
	function checklength(obj, len) {
        if(len == null || len == "" || len == undefined) {
            return;
        }
        if(obj.value.length > len) {
            alert("请不要超过最大长度:" + len);
            obj.value = obj.value.substring(0, len);
            return;
        }
    }
	
	
	//打开新窗口方法
	function OpenWindowOpinionHistory(src,num) {
		
		var loadpos = src; 
		var WWidth=600,   WHeight=window.screen.availHeight-300;
		var WinOP;
		
		var   WLeft   =   Math.ceil((window.screen.width   -   WWidth)   /   2   );   
		var   WTop   =   Math.ceil((window.screen.height   -   WHeight)   /   2   );   
		var   features   = 
		'width= '     +   WWidth     +   'px, '   + 
		'height= '   +   WHeight     +   'px, '   + 
		'left= '       +   WLeft     +   'px, '   + 
		'top= '         +   WTop     +   'px, '   + 
		'menubar=no,toolbar=no,location=no,directories=no,status=yes,scrollbars=yes, resizable=yes '; 
		WinOP = window.open(loadpos, "_blank", features);
		WinOP.focus();
	}
	
	function OpenWindowFull(src) {
		var w = screen.availWidth - 10;
		var h = screen.availHeight - 20;
		var l = 0;
		var t = 0;
		var name = (document.all?'':'');
		return window.open(src,'',"menubar=no,toolbar=no,location=no,directories=no,status=yes,scrollbars=yes,width="+w+",height="+h+",left="+l+",top="+t+",resizable=yes");
	}
	
	//全屏打开新窗口
	function OpenWindow(src) {
		var w = screen.availWidth-10
		var h = screen.availHeight-20
		var l = 0;  
		var t = 0;
		var name = (document.all?'':'');
		return window.open(src,'',"menubar=no,toolbar=no,location=no,directories=no,status=yes,scrollbars=yes,width="+w+",height="+h+",left="+l+",top="+t+",resizable=yes");
	}
	
	
	//打开新窗口方法
	function openProcessWin(_url) {
		var w = screen.availWidth - 10;
		var h = screen.availHeight - 20;
		if(screen.availWidth > 800) {
			w = 850;
		} else {
			w = screen.width;
		}
		var str = "height=" + h + ",innerHeight=" + h;
		str += ",width=" + w + ",innerWidth=" + w;
		if(window.screen) {
			var ah = screen.availHeight - 50;
			var aw = screen.availWidth - 10;
			var xc = (aw - w) / 2;
			var yc = (ah - h) / 2;
			str += ",left=" + xc + ",screenX=" + xc;
			str += ",top=" + yc + ",screenY=" + yc;
		}
    	var wnd = window.open(_url, "_blank", str+",toolbar=0,location=0,directories=0,resizable=1,scrollbars=1");
	}
	
	//将一个变量转换为对象
	function var_to_obj(val) {
		this.value=val;
	}
	
	//判断是否大于某个数
	function is_greater(field,crit,limit) {
		var Ret = (is_numeric(field,-1) ) ? (field.value > limit )  : false;
		if(!Ret)
			doCritCode(field,crit,"Value must be greater than "+limit);
		return(Ret);
	}
	
	//判断是否小于某个数
	function is_less(field,crit,limit) {
		var Ret = (is_numeric(field,-1) ) ? (field.value < limit )  : false;
		if(!Ret)
			doCritCode(field,crit,"Value must be less than "+limit);
		return(Ret);
	}
	
	//判断是否是整数
	function is_int(field) {
		var Ret = true;
		var NumStr = "0123456789";
		var chr;
		for(i = 0; i < field.length; ++i) {
			chr = field.charAt(i);
			if(NumStr.indexOf(chr,0) == -1) {
				Ret = false;
			}
		}
    	if(Number(field) > 2147483647) {
        	Ret = false;
    	}
		return(Ret);
	}
	
	//比较两个日期的大小，Num1>Num2 return:true;Num1<=Num2 return:false
	function Compare_Date(Num1,Num2) {
		var pos1,pos2,end;
		var para1,para2,para3,para4,para5,para6;
		end=Num1.length;
		pos1=Num1.indexOf("-",0);
		pos2=Num1.indexOf("-",pos1+1);
		para1=Num1.substring(0,pos1);
		para2=Num1.substring(pos1+1,pos2);
		para3=Num1.substring(pos2+1,end);
		para1=parseFloat(para1);
		para2=parseFloat(para2);
		para3=parseFloat(para3);
		end=Num2.length;
		pos1=Num2.indexOf("-",0);
		pos2=Num2.indexOf("-",pos1+1);
		para4=Num2.substring(0,pos1);
		para5=Num2.substring(pos1+1,pos2);
		para6=Num2.substring(pos2+1,end);
		para4=parseFloat(para4);
		para5=parseFloat(para5);
		para6=parseFloat(para6);
		if(para1>para4) {
			return true;
		} else if(para1==para4) {
			if(para2>para5) {
				return true;
			} else if(para2==para5) {
				if(para3>para6) {
					return true;
				}
			}
		}
		return false;
	}
	
	function FloatFormat(expr,decplaces) {
        var str = "" + Math.round(eval(expr)*Math.pow(10,decplaces));
        while(str.length <= decplaces) {
                str = "0" + str;
        }
        var decpoint = str.length - decplaces;
        return str.substring(0,decpoint) + "." + str.substring(decpoint,str.length);
	}
	
	function is_numeric(field,crit,msg) {
		var Ret = true;
		var NumStr="0123456789";
		var decUsed=false;
		var chr;
		for(i = 0; i < field.value.length; ++i) {
			chr = field.value.charAt(i);
			if(NumStr.indexOf(chr,0) == -1) {
				if((!decUsed) && chr == ".") {
					decUsed=true;
				} else {
					Ret = false;
				}
			}
		}
		if(!Ret)
			doCritCode(field,crit,msg);
		return(Ret);
	}
	
 	//判断是否是价格
	function is_price(field,crit,msg) {
		var Ret = true;
		var NumStr="0123456789";
		var decUsed=false;
		var chr;
		for(i = 0; i < field.value.length; ++i) {
			chr = field.value.charAt(i);
			if(NumStr.indexOf(chr,0) == -1) {
				if((!decUsed) && chr == ".") {
					decUsed = true;
				} else {
					Ret = false;
				}
			}
		}
		if(Ret) {
			if(decUsed&&(field.value.length-field.value.indexOf('.') < 4))
			;
			else if(decUsed)
				Ret = false;
		}
		if(!Ret)
			doCritCode(field,crit,msg);
		return(Ret);
	}
 // 判断是否是空 true:空 false:非空
function Is_Null(field,crit,msg)
{
	Text=""+Trim(field.value);

	if(Text.length)
	{
		for(var i=0;i<Text.length;i++)
		if(Text.charAt(i)!=" ")
		break;
		if(i>=Text.length)
			Ret=true;
		else
			Ret=false;
	}
	else
		Ret=true;
	if (Ret)
		doCritCode(field,crit,msg);
	return(Ret);
}
//确认是否可以为空true:可以false：不可以
function Null_Ok(field,crit,msg1,msg2)
{
	Text=""+Trim(field.value);

	if(Text.length)
	{
		for(var i=0;i < Text.length;i++)
			if(Text.charAt(i)!=" ")
				break;
		if(i>=Text.length)

			Ret=true;
		else
			Ret=false;
	}else{
		Ret=true;
	}
	if(Ret)
	{
		if(!confirm(msg2))
			doCritCode(field,crit,msg1);
		else
			Ret = false;
	}
	return(Ret);
}

function IsSpace(field)
{
	var Text=""+field.value;
	if(Text.length)
	{
		for(var i=0;i<Text.length;i++)
			if(Text.charAt(i)!=" ")
				break;
		if(i>=Text.length)
			field.value="";
	}
}

function doCritCode(field,crit,msg)
{
	if ( (-1!=crit) )
	{
		alert(msg)
		if (crit==1)
		{
			field.focus();  // focus does not work on certain netscape versions
			field.select();
		}
	}
}
// 判断是否是整数true:是整数，false:不是整数
function Is_Int(field,crit,msg){
	var Ret = true;
	var NumStr="0123456789";
	var chr;

	for (i=0;i<field.value.length;i++)
	{
		chr=field.value.charAt(i);
		if (NumStr.indexOf(chr,0)==-1)
		{
			Ret=false;
		}
	}
	if (!Ret)
		doCritCode(field,crit,msg);
	return(Ret);
}
// 判断是否是日期 不是date返回false 是date返回true
function is_date(field,crit,msg){
	var Ret = false;
	var mark1;
	var mark2;
	var days

	if(field.value=="")
		return true;
	cd=new Date();

	if ( (mark1 = field.value.indexOf('-'))==-1)
		mark1=field.value.indexOf('-')
	if (mark1>-1)
	{
		if ( (mark2 = field.value.indexOf('-',mark1+1)) ==-1)
			mark2=field.value.indexOf('-',mark1+1);
		if ((mark2>-1)&&(mark2+1<field.value.length) )
		{
			year = new var_to_obj(field.value.substring(0,mark1));
			month = new var_to_obj(field.value.substring(mark1+1,mark2));
			day = new var_to_obj(field.value.substring(mark2+1,field.value.length));
			days = getDaysInMonth(month.value,year.value) + 1

			if (
				(is_greater(day,-1,0))&&(is_less(day,-1,days))&&
				(is_greater(month,-1,0))&&(is_less(month,-1,13))&&
				(is_greater(year,-1,1900))&&(is_less(year,-1,2500))
				)
				Ret=true;
		}
	}
	if (!Ret) doCritCode(field,crit,msg);

	return(Ret);
}

function is_date2(tmpy,tmpm,tmpd)
{
	year=new String (tmpy);
	month=new String (tmpm);
	day=new String (tmpd)
	if ((tmpy.length!=4) || (tmpm.length>2) || (tmpd.length>2))
	{
		return false;
	}
	if (!((1<=month) && (12>=month) && (31>=day) && (1<=day)) )
	{
		return false;
	}
	if (!( ((year % 4)==0) && ((year % 400)==0) ) && (month==2) && (day==29))
	{
		return false;
	}
	if ((month<=7) && ((month % 2)==0) && (day>=31))
	{
		return false;

	}
	if ((month>=8) && ((month % 2)==1) && (day>=31))
	{
		return false;
	}
	if ((month==2) && (day==30))
	{
		return false;
	}

	return true;
}


function doCrit(field,crit,msg)
{
	if ( (-1!=crit) )
	{
		alert(msg);
		if (crit==1)
		{
			field.focus();  // focus does not work on certain netscape versions
		}
	}
}
// 判断是否有有效数据被选中
function IsSelected(field,crit,msg)
{
	value=""+field.options[field.selectedIndex].value;
	if(value=="0")
		Ret=true;
	else
		Ret=false;
	if (Ret)
		doCrit(field,crit,msg);
	return(Ret);
}
//检测是否有radio被选中 field:form1.appid
function IsChecked(field,msg)
{
       l = field.length;
       if(l==undefined){
	 if(!field.checked){
	  alert(msg);
	  return false
	 }
	 else{
	  return true
	 }
       }
       else{
         flag=0;
         for(i=0;i<l;i++){
	   if(field[i].checked==true){
	   flag++;
	   }
         }

         if(flag==0){
	   alert(msg);
	   return false
         }
         else{
	   return true
         }
       }
}



// 检查是否是字符
// cCharacter：输入值
function isCharacter( cCharacter )
{
	var sFormat = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

	if( sFormat.indexOf( cCharacter, 0 ) == -1 )
	{
		return false;
	}

	return true;
}

// 检查是否是其它可以作名称的字符
// cCharacter：输入值
function isOtherNameCharacter( cCharacter )
{
	var sFormat = "_";

	if( sFormat.indexOf( cCharacter, 0 ) == -1 )
	{
		return false;
	}

	return true;
}

// 检查是否是可以作名称的字符
// sValue：输入值
function isNameCharacter( sValue )
{
	if( sValue == null )
	{
		return false;
	}

	for( i = 0; i < sValue.length; i ++ )
	{
		var cCharacter = sValue.charAt( i );
		if( isDigital( cCharacter ) == false && isCharacter( cCharacter ) == false && isOtherNameCharacter( cCharacter ) == false )
		{
			return false;
		}
	}

	return true;
}

// 检查是否是Email
// sValue：输入值，合法格式为a@b.c.d此类形式
function isEmail( sValue )
{
	var iFirstIndex = 0;
	var iSecondIndex = sValue.indexOf( '@' );
	if( iSecondIndex == -1 )
	{
		return false;
	}

	var sTemp = sValue.substring( iFirstIndex, iSecondIndex );
	if( isNameCharacter( sTemp ) == false )
	{
		return false;
	}

	iSecondIndex = sValue.indexOf( '.' );
	if( iSecondIndex == -1 || sValue.substring( sValue.length-1, sValue.length ) == '.' )
	{
		return false;
	}
	else if(  sTemp.length == sValue.length - 2 )	// The last two characters are '@' and '.'
	{
		return false;
	}
	else
	{
		var sTempValue = sValue;
		iSecondIndex = sValue.indexOf( '@' );
		while( iSecondIndex != -1 )
		{
			iFirstIndex = iSecondIndex + 1;
			sTempValue = sTempValue.substring( iFirstIndex, sTempValue.length );	// The right section of value
			iSecondIndex = sTempValue.indexOf( '.' );
			//document.write( "sTempValue=" + sTempValue + "<br>" );
			sTemp = sTempValue.substring( 0, iSecondIndex );
			//document.write( "sTemp=" + sTemp + "<br>" );
			if( isNameCharacter( sTemp ) == false )
			{
				return false;
			}
		}

		if( isNameCharacter( sTempValue ) == false )
		{
			return false;
		}
	}

	return true;
}

// 检查是否是邮编
// sValue：输入值，合法格式为六位整数
function isZIP( sValue )
{
	if( sValue == null )
	{
		return false;
	}

	if( sValue.length != 6 )
	{
		return false;
	}
	else
	{
		for( i = 0; i < 6; i ++ )
		{
			if( isDigital( sValue.charAt( i ) ) == false )
			{
				return false;
			}
		}
	}

	return true;
}

// 检查是否是数字字符串
// sValue：输入值
function isDigitalString( sValue )
{
	if( sValue == null )
	{
		return false;
	}

	for( i = 0; i < sValue.length; i ++ )
	{
		if( isDigital( sValue.charAt( i ) ) == false )
		{
			return false;
		}
	}
}


//IsEmpty函数判断一个字符串是否为空
function IsEmpty(his)
{
   flag = true;
   for(var i=0;i<his.length;i++)
   {
      if(his.charAt(i)!=" ")
      {
         flag = false;
         break;
      }
   }
   return flag;
}

	//Trim函数去掉一字符串两边的空格
	function Trim(his) {
   		//找到字符串开始位置
   		Pos_Start = -1;
   		for(var i = 0; i < his.length; i++) {
    	 	if(his.charAt(i) != " ") {
         		Pos_Start = i;
         		break;
      		}
   		}
   		//找到字符串结束位置
   		Pos_End = -1;
   		for(var i = his.length - 1; i >= 0; i--) {
     		if(his.charAt(i) != " ") {
         		Pos_End = i;
         		break;
      		}
   		}
   		//返回的字符串
   		Str_Return = ""
   		if(Pos_Start!=-1 && Pos_End != -1) {
			for(var i = Pos_Start; i <= Pos_End; i++) {
			   Str_Return = Str_Return + his.charAt(i);
			}
  	 	}
   		return Str_Return;
	}
//IsDigital函数判断一个字符串是否由数字(int or long)组成
function isDigital(str)
{
  for(ilen=0;ilen<str.length;ilen++)
  {
    if(str.charAt(ilen) < '0' || str.charAt(ilen) > '9' )
    {
       return false;
    }
  }
  return true;
}
//IsFloat函数判断一个字符串是否由数字(int or long or float)组成
function IsFloat(str)
{
  flag_Dec = 0
  for(ilen=0;ilen<str.length;ilen++)
  {
    if(str.charAt(ilen) == '.')
    {
       flag_Dec++;
	   if(flag_Dec > 1)
          return false;
       else
          continue;
    }
    if(str.charAt(ilen) < '0' || str.charAt(ilen) > '9' )
    {
       return false;
    }
  }
  return true;
}
//IsTelephone函数判断一个字符串是否由数字或'-','*','()'组成
function IsTelephone(str)
{
  for(ilen=0;ilen<str.length;ilen++)
  {
    if(str.charAt(ilen) < '0' || str.charAt(ilen) > '9' )
    {
		if((str.charAt(ilen)!='-')&&(str.charAt(ilen)!='*')&&(str.charAt(ilen)!=';')&&(str.charAt(ilen)!='(')&&(str.charAt(ilen)!=')'))
        return false;
    }
  }
  return true;
}
//日期格式转化2/18/2000 ----2000-2-18
	function dateTransfer(strdate)
	{

		var pos1,pos2,end;
		var para1,para2,para3;
		var newdate;
		newdate="";
		//para1:月
		//para2:日
		//para3:年
		if(Trim(strdate)=="")
		{
			return(newdate);
		}
		end=strdate.length;
		pos1=strdate.indexOf("/",0);
		pos2=strdate.indexOf("/",pos1+1);
		para1=strdate.substring(0,pos1);
		para2=strdate.substring(pos1+1,pos2);
		para3=strdate.substring(pos2+1,end);
		newdate=para3+"-"+para1+"-"+para2;
		return(newdate);
	}
//转化日期2000-10-20 ---->10/20/2000
function transferDate(str)
{
  var m=4;
  var strlen=str.length
  var n=strlen-1;
  if(Trim(str)=="")
  {
		return(str);
  }
  while (n>=strlen-2)
  {
   if(str.charAt(n)=="-")
    {
      break;
    }
   n=n-1
  }
  trimstr=str.substring(m+1,n)+"/"+ str.substring(n+1,strlen)+"/"+str.substring(0,m)
  return(trimstr);
}

//检查是否是密码
function ispassword( sValue )
{
	if( sValue == null )
	{
		return false;
	}

	for( i = 0; i < sValue.length; i ++ )
	{
		var cCharacter = sValue.charAt( i );
		if( isDigital( cCharacter ) == false && isCharacter( cCharacter ) == false && isOtherNameCharacter( cCharacter ) == false)
		{
			return false;
		}
	}

	return true;
}

//判断是否为润年的函数
//参数说明：Year--年份
//          返回值:如果是润年，返回true；否则返回false.

function isLeapYear (Year) {
if (((Year % 4)==0) && ((Year % 100)!=0) || ((Year % 400)==0)) {
return (true);
} else { return (false); }
}

//取得每月天数的函数
//参数说明：month--月;year--年
//          返回值：days--天数
function getDaysInMonth(month,year)  {
var days;
if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12)  days=31;
else if (month==4 || month==6 || month==9 || month==11) days=30;
else if (month==2)  {
if (isLeapYear(year)) { days=29; }
else { days=28; }
}
return (days);
}




  function ratifyTime(str){

		  var Ret = false;
		  //小时分割符

          var str1=str.value.substring(3,2);
		  //分钟分割符
		  var str2=str.value.substring(6,5);
			var phour;
		  var pmin;
		  var psec;

          if(str1!=":"||str2!=":")
		  {
			alert("时间的格式应为：01:01:01");
		    str.focus();
			return(false);
		  };


		  phour=parseFloat(str.value.substring(2,0));//小时
		  pmin=parseFloat(str.value.substring(5,3));//分钟
		  psec=parseFloat(str.value.substring(8,6));//秒

		  if(phour>23||phour<0){
			alert("时间的小时位不能超过23，不能小于0");
			str.focus();
			return(false);
		  };
          if(pmin>59||pmin<0){
			alert("时间的分钟位不能超过59，不能小于0");
			str.focus();
			return(false);
		  };
		  if(psec>59||psec<0){
			alert("时间的秒位不能超过59，不能小于0");
			str.focus();
			return(false);
		  };


	      return(true);
		}



		//时间比较大小，如果相等返回0，大于返回1，小于返回2
		function compareTime(str1,str2){
		  var phour1;
		  var pmin1;
		  var psec1;

		  var phour2;
		  var pmin2;
		  var psec2;

		  phour1=parseFloat(str1.value.substring(2,0));//小时
		  pmin1=parseFloat(str1.value.substring(5,3));//分钟
		  psec1=parseFloat(str1.value.substring(8,6));//秒


		  phour2=parseFloat(str2.value.substring(2,0));//小时
		  pmin2=parseFloat(str2.value.substring(5,3));//分钟
		  psec2=parseFloat(str2.value.substring(8,6));//秒

		  if(phour1==phour2)
		  {
		    if(pmin1==pmin2)
			{
			  if(psec1==psec2)
			  {
			    return(0);
			  }
			  else
			  {
			    if(psec1>psec2)
				{
			      return(1);
                }
				else
				{
				  return(2);
				};
			  };
			}
			else
			{
			  if(pmin1>pmin2)
			  {
			    return(1);
			  }
			  else
			  {
			    return(2);
			  };
			};
		  }
		  else
		  {
		    if(phour1>phour2)
			{
			  return(1);
			}
			else
			{
			  return(2);
			};
		  };
		}
//选中select已选定项
function selectItem(formItem,itemValue)
{
	n = parseFloat(formItem.length);
	for(i=0;i<n;i++){
		if(formItem.options[i].value == itemValue){
			formItem.options[i].selected = true;
			formItem.options[i].defaultSelected = true;
		}
	}
}
//选中radio以选项
function radioItem(formItem,itemValue)
{
	n = parseFloat(formItem.length);
	for(i=0;i<n;i++){
		if(formItem[i].value == itemValue){
			formItem[i].checked = true;
		}
	}
}
//formid表示:你的form是第几个form或者form名字 from表示:包含可选择项目的select对象名字
//to表示:列出可选择项目的select对象名字 limit表示:不能选的值,NotremoveFrom是否删除from中
//的值,NotAddTo不把值加到to中
//被选择元素得textname不能重名
function copyToList(formid,from,to,limit,NotRemoveFrom,NotAddTo)
{

	fromList = eval('document.forms[' + formid + '].' + from);
	toList = eval('document.forms[' + formid + '].' + to);
//	if(toList.options.length > 0 && toList.options[0].value == '0')
//	{
//		toList.options.length = 0;
//	}
	var sel = false;
	for (i=0;i<fromList.options.length;i++)
	{
		var current = fromList.options[i];
		if(current.selected)
		{
			sel = true;
			if(current.value == '0' || current.value == limit)
			{
				alert (current.text+"不能选！");
//				return;
			}
			else
			{
				txt = current.text;
				val = current.value;
        addFlag = true;
        for(m=0;m<toList.options.length;m++)
        {
          if(txt == toList.options[m].text)
          {
            addFlag = false;
            break;
          }
        }
        if(addFlag)
  				if(!NotAddTo) toList.options[toList.length] = new Option(txt,val);
  				if(!NotRemoveFrom){
  					fromList.options[i] = null;
					i--;
				}
			}
		}
	}
	if(!sel) alert ('请选择添加元素！');
}
//formid表示:form名称或顺序 from表示:需要删元素的对象
//to表示:删除对象的回收站 limit表示:删除元素value满足的条件
function deleteFromList(formid,from,to,limit)
{
	fromList = eval('document.forms[' + formid + '].' + from);
	toList = eval('document.forms[' + formid + '].' + to);
	for (i=0;i<fromList.options.length;i++)
	{
		if(fromList.options[i].value == limit){
			var current = fromList.options[i];
			sel = true;
			txt = current.text;
			val = current.value;
			toList.options[toList.length] = new Option(txt,val);
			fromList.options[i] = null;
			i--;
		}
	}
}
//这是当用户按下提交按钮时，对列出选择的select对象执行全选工作，让递交至的后台程序能取得相关数据
//formid表示:form名称; item表示:select元素名称; pro表示:返回的字符串值的来源value或text;
function allSelect(formid,item,pro,sign)
{
	List = eval('document.forms[' + formid + '].' + item);
	str = "";
//	if (List.length && List.options[0].value == '0') return;
	for (i=0;i<List.length;i++)
	{
		if(List.options[i].value!=0)
		{
			List.options[i].selected = true;
			str += sign + eval('List.options[i].' + pro) + sign + ',';
		}
		else
		{
			List.options[i].selected = false;
		}
	}
	if(str.length > 0)
		str = str.substring(0,str.length-1);
	return str;
}
//选中所有选中的元素
function allSelected(formid,item,pro,sign)
{
	List = eval('document.forms[' + formid + '].' + item);
	str = "";
	for (i=0;i<List.length;i++)
	{
		if(List.options[i].value != 0 & List.options[i].selected)
		{
			List.options[i].selected = true;
			str += sign + eval('List.options[i].' + pro) + sign + ',';
		}
		else
		{
			List.options[i].selected = false;
		}
	}
	if(str.length > 0)
		str = str.substring(0,str.length-1);
	return str;
}
//for layers found object
function findObj(n, d) { //v3.0
	var p,i,x;
	if(!d) d=document;
	if((p=n.indexOf("?"))>0&&parent.frames.length){
		d=parent.frames[n.substring(p+1)].document;
		n=n.substring(0,p);
	}
	if(!(x=d[n])&&d.all) x=d.all[n];
	for(i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	return x;
}
//hide or show layers
function showHideLayers() { //v3.0
	var i,p,v,obj,args=showHideLayers.arguments;
	for (i=0; i<(args.length-2); i+=3){
		if((obj=findObj(args[i]))!=null){
			v=args[i+2];
			if (obj.style) {
				obj=obj.style;
				v=(v=='show')?'visible':(v='hide')?'hidden':v;
			}
		obj.visibility=v;
		}
	}
}
//send value from child windows to parent windows without reload
//parentform表示:form名称 par1表示:parent要付值的form的属性名
//childform表示:form名称  par2表示:child提供值的form的属性名
//function childToParent(parentform,par1,childform,par2){
//	var parentitem = "window.opener.document." + parentform + "." + par1;
//	var childitem = eval("window.document." + childform + "." + par2);
//	eval(parentitem) = eval(childitem);
//	alert(eval(parentitem));
//}
function datecheck(dates){
//alert(dates)
    ymd1=dates.value.split("-");
    month1=ymd1[1]-1
    var Date1 = new Date(ymd1[0],month1,ymd1[2]);
if (Date1.getMonth()+1!=ymd1[1]||Date1.getDate()!=ymd1[2]||Date1.getFullYear()!=ymd1[0]||ymd1[0].length!=4){
  //  alert(Date1);
       alert("非法日期,请依【YYYY-MM-DD】格式输入");
       return false;
    }
return true;
}
//length:小数位数
function checkDiscount(obj,length,msg)
{
	var val=obj.value;
	var par=parseFloat(val);
	var len=0;
	if(val.indexOf(".")!=-1)
		len=parseInt(val.length)-parseInt(val.indexOf("."))-1;
	if(par==val&par<=1&len<=length)
	{
		return true;
	}
	else
	{
		alert(msg);
		obj.focus();
		return false;
	}
}
function checkFluctuate(obj,length,msg)
{
	var val=obj.value;
	var par=parseFloat(val);
	var len=0;
	if(val.indexOf(".")!=-1)
		len=parseInt(val.length)-parseInt(val.indexOf("."))-1;
	if(par==val&par<=8.9&len<=length)
	{
		return true;
	}
	else
	{
		alert(msg);
		obj.focus();
		return false;
	}
}
function checkHour(obj,msg)
{
	var val=obj.value;
	var par=parseInt(val);
	if(par==val&par<=24)
	{
		return true;
	}
	else
	{
		alert(msg);
		obj.focus();
		return false;
	}
}
function checkMinute(obj,msg)
{
	var val=obj.value;
	var par=parseInt(val);
	if(par==val&par<60)
	{
		return true;
	}
	else
	{
		alert(msg);
		obj.focus();
		return false;
	}
}
function checkURL(obj,msg)
{
	var val=obj.value;
	if(parseInt(val.length) > 7)
	{
		sub=val.substring(0,7);
		if(sub=="http://" & val.indexOf(".")!=-1)
		{
			return true;
		}
		else
		{
			alert(msg);
			obj.focus();
			return false;
		}
	}
	else
	{
		alert(msg);
		obj.focus();
		return false;
	}
}
//将单选列表框中的元素进行上移,formid为页面中的id号码,movename为列表框的名称字符串
function upmove(formid,movename)
{
 movelist = eval('document.forms[' + formid + '].' + movename);
 var sel = false;
	for (i=0;i<movelist.options.length;i++)
	{
		var current = movelist.options[i];
		if(current.selected)
		{
		sel = true;
		if(i==1 || movelist.options[i].value=="0")
		{
			alert ('不能向上移动！');
			return;
		}
		txt = current.text;
		val = current.value;
		uptxt=movelist.options[i-1].text;
		upval=movelist.options[i-1].value;
		movelist.options[i-1].value = val;
		movelist.options[i-1].text=txt;
		movelist.options[i].value=upval;
		movelist.options[i].text=uptxt;
		movelist.options[i-1].selected=true;
		movelist.options[i].selected=false;

		}
	}
	if(!sel) alert ('请选择要移动的元素！');
}
//将单选列表框中的元素进行下移,formid为页面中的id号码,movename为列表框的名称字符串
function downmove(formid,movename)
{
 movelist = eval('document.forms[' + formid + '].' + movename);
 var sel = false;
	for (i=(movelist.options.length-1);i>=0;i--)
	{
		var current = movelist.options[i];
		if(current.selected)
		{
		sel = true;
		if(i==(movelist.options.length-1) || movelist.options[i].value=="0")
		{
			alert ('不能向下移动！');
			return;
		}
		txt = current.text;
		val = current.value;
		downtxt=movelist.options[i+1].text;
		downval=movelist.options[i+1].value;
		movelist.options[i+1].value = val;
		movelist.options[i+1].text=txt;
		movelist.options[i].value=downval;
		movelist.options[i].text=downtxt;
		movelist.options[i+1].selected=true;
		movelist.options[i].selected=false;
		}
	}
	if(!sel) alert ('请选择要移动的元素！');
}

//获得页面中中英文混合字符串的实际长度，str为字符串的值
function getLength(str)
{
l=str.length
all=0;
for(i=0;i<l;i++){
  aim=str.charAt(i);
  aim=escape(aim);
  if ((aim.length==3)||(aim.length==1)){
   all=all+1;
  }
  if (aim.length==6){
   all=all+2;
  }
}
return all
}

// Compare two date
// 如果_Date2大于_Date1，返回true
function _compareTwoDate(_Date1, _Date2) {
     vDate1 = _Date1.value.split("-")
	 vDate2 = _Date2.value.split("-")
	 
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}

function _compareTwoDate_ex(_Date1, _Hour1, _Min1, _Date2, _Hour2, _Min2) {
     vDate1 = _Date1.value.split("-")
	 vDate2 = _Date2.value.split("-")
	 
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     H1 = parseInt(_Hour1.value-0)
	 H2 = parseInt(_Hour2.value-0)
	 M1 = parseInt(_Min1.value-0)
     M2 = parseInt(_Min2.value-0)
	 
	 if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 == _Day2) && (H1>H2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 == _Day2) && (H1 == H2) && (M1>M2) ) {
	    return false
	 }

	 return true
}


function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}

// get current date
function _getCurrentDate() {
     _newDate = new Date()
	 _Year = _newDate.getYear()
	 _Month = 1 + _newDate.getMonth()
	 _Day = _newDate.getDate()

	 if (_Month.toString().length == 1) {
	     _Month = "0" + _Month;
     }

	 if (_Day.toString().length == 1) {
	     _Day = "0" + _Day;
	 }

	 _sDate = _Year + "-" + _Month + "-" + _Day
	 return _sDate
     }

// compare date with current date
function _biggerThanToday(_Date2) {
     vDate1 = _getCurrentDate().split("-")
	 vDate2 = _Date2.value.split("-")

	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

         if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 >= _Day2)) {
	    return false
	 }

	 return true

}

// compare date with current year&&month
function _biggerThanTodayMonth(_Date2) {
     vDate1 = _getCurrentDate().split("-")
	 vDate2 = _Date2.value.split("-")

	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

         if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

     return true

}

function _getDate(periodType, year, period) {

	var dates = new Array(_getCurrentDate(), _getCurrentDate());

	// Validate
	if (periodType != 0 && periodType != 1) {
		// Error period type
		alert("Error period type.\nPeriod type(0-1):" + periodType);
		return dates;
	}

	var intYear = 2000;
	if (isNaN(year) == true) {
		alert("Invalid year.\nYear:" + year);
		return dates;
	}
	intYear = parseInt(year);
	if (intYear < 1900 || intYear > 2100) {
		alert("Invalid year.\nYear(1900-2100):" + year);
		return dates;
	}

	var intPeriod = 1;
	if (isNaN(period) == true) {
	    alert("Invalid period.\nPeriod:" + period);
		return dates;
    }
	intPeriod = parseInt(period);
	if (periodType == 0) {
		// Season
		if (intPeriod < 1 || intPeriod > 4) {
			alert("Invalid season.\nSeason(1-4):" + period);
			return dates;
		}
	} else {
		// Month
		if (intPeriod < 1 || intPeriod > 12) {
			alert("Invalid month.\nMonth(1-12):" + period);
			return dates;
		}
	}

	if (periodType == 0) {
		// Season
		switch (intPeriod) {
			case 1 :
				dates[0] = year + "-1-1";
				dates[1] = year + "-3-31";
				break;
			case 2 :
				dates[0] = year + "-4-1";
				dates[1] = year + "-6-30";
				break;
			case 3 :
				dates[0] = year + "-7-1";
				dates[1] = year + "-9-30";
				break;
			case 4 :
				dates[0] = year + "-10-1";
				dates[1] = year + "-12-31";
				break;
		}
	} else {
		// Month
		switch (intPeriod) {
			case 1 :
				dates[0] = year + "-1-1";
				dates[1] = year + "-1-31";
				break;
			case 2 :
				dates[0] = year + "-2-1";
				if ((intYear % 400 == 0) || ((intYear % 4 == 0) && (intYear % 100 != 0))) {
					dates[1] = year + "-2-29";
				} else {
					dates[1] = year + "-2-28";
				}
				break;
			case 3 :
				dates[0] = year + "-3-1";
				dates[1] = year + "-3-31";
				break;
			case 4 :
				dates[0] = year + "-4-1";
				dates[1] = year + "-4-30";
				break;
			case 5 :
				dates[0] = year + "-5-1";
				dates[1] = year + "-5-31";
				break;
			case 6 :
				dates[0] = year + "-6-1";
				dates[1] = year + "-6-30";
				break;
			case 7 :
				dates[0] = year + "-7-1";
				dates[1] = year + "-7-31";
				break;
			case 8 :
				dates[0] = year + "-8-1";
				dates[1] = year + "-8-31";
				break;
			case 9 :
				dates[0] = year + "-9-1";
				dates[1] = year + "-9-30";
				break;
			case 10 :
				dates[0] = year + "-10-1";
				dates[1] = year + "-10-31";
				break;
			case 11 :
				dates[0] = year + "-11-1";
				dates[1] = year + "-11-30";
				break;
			case 12 :
				dates[0] = year + "-12-1";
				dates[1] = year + "-12-31";
				break;
		}
	}

	// Return
	return dates;
}

function _getFinanceDate(financeDay, periodType, year, period) {

	var dates = new Array(_getCurrentDate(), _getCurrentDate());

	// Validate
	if (financeDay < 0 || financeDay > 28) {
		// Error finance type
		alert("Error finance day.\nFinance type(0-28):" + financeDay);
		return dates;
	}

	if (periodType != 0 && periodType != 1) {
		// Error period type
		alert("Error period type.\nPeriod type(0-1):" + periodType);
		return dates;
	}

	var intYear = 2000;
	if (isNaN(year) == true) {
	    alert("Invalid year.\nYear:" + year);
		return dates;
	}
	intYear = parseInt(year);
	if (intYear < 1900 || intYear > 2100) {
	    alert("Invalid year.\nYear(1900-2100):" + year);
		return dates;
	}

	var intPeriod = 1;
	if (isNaN(period) == true) {
	    alert("Invalid period.\nPeriod:" + period);
		return dates;
	}
	intPeriod = parseInt(period);
	if (periodType == 0) {
		// Season
		if (intPeriod < 1 || intPeriod > 4) {
		    alert("Invalid season.\nSeason(1-4):" + period);
			return dates;
		}
	} else {
		// Month
		if (intPeriod < 1 || intPeriod > 12) {
		    alert("Invalid month.\nMonth(1-12):" + period);
			return dates;
		}
	}

	if (financeDay == 0) {
		return _getDate(periodType, year, period);
	}

	if (periodType == 0) {
		// Season
		switch (intPeriod) {
			case 1 :
				dates[0] = year + "-1-1";
				dates[1] = year + "-3-" + financeDay;
				break;
			case 2 :
				dates[0] = year + "-3-" + (financeDay + 1);
				dates[1] = year + "-6-" + financeDay;
				break;
			case 3 :
				dates[0] = year + "-6-" + (financeDay + 1);
				dates[1] = year + "-9-" + financeDay;
				break;
			case 4 :
				dates[0] = year + "-9-" + (financeDay + 1);
				dates[1] = year + "-12-31";
				break;
		}
	} else {
		// Month
		switch (intPeriod) {
			case 1 :
				dates[0] = year + "-1-1";
				dates[1] = year + "-1-" + financeDay;
				break;
			case 2 :
				dates[0] = year + "-1-" + (financeDay + 1);
				dates[1] = year + "-2-" + financeDay;
				break;
			case 3 :
				if (((intYear % 400 == 0) || ((intYear % 4 == 0) && (intYear % 100 != 0)))
					&& (financeDay == 28)) {
					dates[0] = year + "-2-" + (financeDay + 1);
				} else {
					dates[0] = year + "-3-1";
				}
				dates[1] = year + "-3-" + financeDay;
				break;
			case 4 :
				dates[0] = year + "-3-" + (financeDay + 1);
				dates[1] = year + "-4-" + financeDay;
				break;
			case 5 :
				dates[0] = year + "-4-" + (financeDay + 1);
				dates[1] = year + "-5-" + financeDay;
				break;
			case 6 :
				dates[0] = year + "-5-" + (financeDay + 1);
				dates[1] = year + "-6-" + financeDay;
				break;
			case 7 :
				dates[0] = year + "-6-" + (financeDay + 1);
				dates[1] = year + "-7-" + financeDay;
				break;
			case 8 :
				dates[0] = year + "-7-" + (financeDay + 1);
				dates[1] = year + "-8-" + financeDay;
				break;
			case 9 :
				dates[0] = year + "-8-" + (financeDay + 1);
				dates[1] = year + "-9-" + financeDay;
				break;
			case 10 :
				dates[0] = year + "-9-" + (financeDay + 1);
				dates[1] = year + "-10-" + financeDay;
				break;
			case 11 :
				dates[0] = year + "-10-" + (financeDay + 1);
				dates[1] = year + "-11-" + financeDay;
				break;
			case 12 :
				dates[0] = year + "-11-" + (financeDay + 1);
				dates[1] = year + "-12-31";
				break;
		}
	}

	// Return
	return dates;
}


function _formatNumber(myField){
    if ( myField.value != "") {
    	if ( myField.value.indexOf(".") == -1) {
    	    myField.value = myField.value + ".000";	
    	} else if ( (myField.value.length-myField.value.indexOf("."))<4 )  {
    	    for (var i=0;i<4-(myField.value.length-myField.value.indexOf("."));i++) {
    	    	alert(i);
    	    	myField.value += "0";
    	    }    	
    	}
    }
}
	
function _compareDate(sDate1, sDate2) {

     var vDate1 = sDate1.split("-")
	 var vDate2 = sDate2.split("-")
	 
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

	var date1 = new Date(_Year1, _Month1, _Day1);
	var date2 = new Date(_Year2, _Month2, _Day2);

	var dif = 0;

	var lDate2 = date2.getTime();
	var lDate1 = date1.getTime();

	dif = (lDate2 - lDate1) / 1000 / 60 / 60 / 24;

	return dif;
}

/**
 * Format number
 * parameter:
 *     _express: double
 *     iSize:    int
 *
 * _changeNumber(12.3456, 3) = 12.346
 */
function _changeNumber(_express, iSize) {
	_express = _express - 1 + 1;
	iSize = iSize - 1 + 1;
	
	iKey1 = Math.pow(10, 12);
	dTemp = Math.round(_express * iKey1);
	sTemp = "" + dTemp;
	iEndNum = sTemp.substring(sTemp.length - 1, sTemp.length) - 1 + 1
	if (iEndNum = 9) {
		dTemp = dTemp + 1;
	} else {
		dTemp = dTemp + 2;
	}
	
	dTemp = dTemp / iKey1;

	iKey = Math.pow(10, iSize);
	dTemp = Math.round(dTemp * iKey);
	
	return dTemp / iKey;
}

//format float data as:*****.**
//decplaces:小数位数
function FloatFormat(expr,decplaces) {

	// judge if it is a valid number
	if (isNaN(expr)) {
		alert("Invalid number:" + expr);
		return 0;
	}

	// change to number
	nExpr = Number(expr);

	// multiple
	nExpr = nExpr * Math.pow(10, decplaces);

	// round
	nExpr = Math.round(nExpr);

	// division
	nExpr = nExpr / Math.pow(10, decplaces);

	var sExpr = nExpr.toString();

	// decimal point location
	var pointIndex = sExpr.indexOf('.');

	// patch zero
	var loop;
	if (pointIndex == -1) {
		sExpr = sExpr + ".";
		loop = decplaces - 1;
	} else {
		loop = decplaces - (sExpr.length - pointIndex);
	}
	for (var i=0;i<=loop;i++)	{
		sExpr = sExpr + "0";
	}

	// return
	return sExpr;
}

//格式化查询时间
function getFormatTime(iYear, sTime, iKey) {
    //iYear---2001
    //sTime---1,2,3,4
	//iKey---1:季度;2:月份

	var _str = null;
    var aTime = new Array();
	var iFlag = true;
	aTime = sTime.split(",")

	if (aTime.length < 2) {
	    iFlag = false;
	} else {
		for (i = 0; i < aTime.length - 1; i++) {
			 iPre = aTime[i] - 1 + 1;
			 iLast = aTime[i + 1] - 1 + 1;
			 if (iLast - iPre != 1) {
				 iFlag = false;
				 break;
			 }
		}
	}
	if (iFlag == true){
	    _str = iYear + "年" + aTime[0] + "-" + aTime[aTime.length - 1];
	} else {
	    _str = iYear + "年" + sTime;
	}

	if (iKey == 1) {
	    _str = _str + "季度";
	} else {
	    _str = _str + "月";
	}

	return _str;
}

// 弹出窗口
function windowOpener(url, title, width, height)
{       
	window.open(url,title,"toolbar,resizable,scrollbars,dependent,width=" + var_to_obj(width) + ",height=" + var_to_obj(height));
}
function windowOpener(url, title)
{       
	window.open(url,title,"toobar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=no,copyhistory=no,width=400,height=280");
}

//检测是否有radio被选中 field:form1.appid
function IsChecked(field,msg)
{
       l = field.length;
       if(l == null){
	 if(!field.checked){
	  alert(msg);
	  return false
	 }
	 else{
	  return true
	 }
       }
       else{
         flag=0;
         for(i=0;i<l;i++){
	   if(field[i].checked==true){
	   flag++;
	   }
         }

         if(flag==0){
	   alert(msg);
	   return false
         }
         else{
	   return true
         }
       }
}

//选中select已选定项
function selectItem(formItem,itemValue)
{
	n = parseFloat(formItem.length);
	for(i=0;i<n;i++){
		if(formItem.options[i].value == itemValue){
			formItem.options[i].selected = true;
			formItem.options[i].defaultSelected = true;
		}
	}
}

//选中radio以选项
function radioItem(formItem,itemValue)
{
	n = parseFloat(formItem.length);
	for(i=0;i<n;i++){
		if(formItem[i].value == itemValue){
			formItem[i].checked = true;
		}
	}
}

//formid表示:你的form是第几个form或者form名字 from表示:包含可选择项目的select对象名字
//to表示:列出可选择项目的select对象名字 limit表示:不能选的值,NotremoveFrom是否删除from中
//的值,NotAddTo不把值加到to中
//被选择元素得textname不能重名
function copyToList(formid,from,to,limit,NotRemoveFrom,NotAddTo)
{

	fromList = eval('document.forms[' + formid + '].' + from);
	toList = eval('document.forms[' + formid + '].' + to);
//	if(toList.options.length > 0 && toList.options[0].value == '0')
//	{
//		toList.options.length = 0;
//	}
	var sel = false;
	for (i=0;i<fromList.options.length;i++)
	{
		var current = fromList.options[i];
		if(current.selected)
		{
			sel = true;
			if(current.value == '0' || current.value == limit)
			{
				alert (current.text+" can not be selected!");
//				return;
			}
			else
			{
				txt = current.text;
				val = current.value;
        addFlag = true;
        for(m=0;m<toList.options.length;m++)
        {
          if(txt == toList.options[m].text)
          {
            addFlag = false;
            break;
          }
        }
        if(addFlag)
  				if(!NotAddTo) toList.options[toList.length] = new Option(txt,val);
  				if(!NotRemoveFrom){
  					fromList.options[i] = null;
					i--;
				}
			}
		}
	}
	if(!sel) alert ('Please select at least an item first!');
}

//formid表示:form名称或顺序 from表示:需要删元素的对象
//to表示:删除对象的回收站 limit表示:删除元素value满足的条件
function deleteFromList(formid,from,to,limit)
{
	fromList = eval('document.forms[' + formid + '].' + from);
	toList = eval('document.forms[' + formid + '].' + to);
	for (i=0;i<fromList.options.length;i++)
	{
		if(fromList.options[i].value == limit){
			var current = fromList.options[i];
			sel = true;
			txt = current.text;
			val = current.value;
			toList.options[toList.length] = new Option(txt,val);
			fromList.options[i] = null;
			i--;
		}
	}
}

//这是当用户按下提交按钮时，对列出选择的select对象执行全选工作，让递交至的后台程序能取得相关数据
//formid表示:form名称; item表示:select元素名称; pro表示:返回的字符串值的来源value或text;
function allSelect(formid,item,pro,sign)
{
	List = eval('document.forms[' + formid + '].' + item);
	str = "";
//	if (List.length && List.options[0].value == '0') return;
	for (i=0;i<List.length;i++)
	{
		if(List.options[i].value!=0)
		{
			List.options[i].selected = true;
			str += sign + eval('List.options[i].' + pro) + sign + ',';
		}
		else
		{
			List.options[i].selected = false;
		}
	}
	if(str.length > 0)
		str = str.substring(0,str.length-1);
	return str;
}

function allSelected(formid,item,pro,sign)
{
	List = eval('document.forms[' + formid + '].' + item);
	str = "";
//	if (List.length && List.options[0].value == '0') return;
	for (i=0;i<List.length;i++)
	{
		if(List.options[i].selected)
		{
			str += sign + eval('List.options[i].' + pro) + sign + ',';
		}
	}
	if(str.length > 0)
		str = str.substring(0,str.length-1);
	return str;
}

function deSelectAll(formid,item)
{
	List = eval('document.forms[' + formid + '].' + item);

	for (i=0;i<List.length;i++)
	{
		if(List.options[i].selected = true)
		{
			List.options[i].selected = false;
		}
	}
}

//将单选列表框中的元素进行上移,formid为页面中的id号码,movename为列表框的名称字符串
function upmove(formid,movename)
{
 movelist = eval('document.forms[' + formid + '].' + movename);
 var sel = false;
	for (i=0;i<movelist.options.length;i++)
	{
		var current = movelist.options[i];
		if(current.selected)
		{
    		sel = true;
    		if(i==0 || movelist.options[i].value=="0")
    		{
    			alert ('Can not move up!');
    			return;
    		}
    		txt = current.text;
    		val = current.value;
    		uptxt=movelist.options[i-1].text;
    		upval=movelist.options[i-1].value;
    		movelist.options[i-1].value = val;
    		movelist.options[i-1].text=txt;
    		movelist.options[i].value=upval;
    		movelist.options[i].text=uptxt;
    		movelist.options[i-1].selected=true;
    		movelist.options[i].selected=false;
		}
	}
	if(!sel) alert ('Please select one element.');
}
//将单选列表框中的元素进行下移,formid为页面中的id号码,movename为列表框的名称字符串
function downmove(formid,movename)
{
 movelist = eval('document.forms[' + formid + '].' + movename);
 var sel = false;
	for (i=(movelist.options.length-1);i>=0;i--)
	{
		var current = movelist.options[i];
		if(current.selected)
		{
    		sel = true;
    		if(i==(movelist.options.length-1) || movelist.options[i].value=="0")
    		{
    			alert ('Can not move down!');
    			return;
    		}
    		txt = current.text;
    		val = current.value;
    		downtxt=movelist.options[i+1].text;
    		downval=movelist.options[i+1].value;
    		movelist.options[i+1].value = val;
    		movelist.options[i+1].text=txt;
    		movelist.options[i].value=downval;
    		movelist.options[i].text=downtxt;
    		movelist.options[i+1].selected=true;
    		movelist.options[i].selected=false;
		}
	}
	if(!sel) alert ('Please select one element.');
}

function displayOrNot(disp){
    if(disp.style.display == "none"){
        disp.style.display = "";
    }else{
        disp.style.display = "none";
    }
}

// facilitate validate
function validfield(field, limit, msg)  {
		if ( Trim(eval (field+".value")) =="no" ) {
					return true;
			}
   		if (limit == "NotNull" ) {
			var paras = [
						 ["T",field,"NotNull",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
   		if (limit == "IsEMail" ) {
			var paras = [
						 ["T",field,"IsEMail",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
			//如果处理的是确认某域为数字
   		if (limit == "IsNumber" ) {
			var paras = [
						 ["T",field,"IsNumber",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
			//如果处理的是确认某域为整型
   		if (limit == "IsInt" ) {
			var paras = [
						 ["T",field,"IsInt",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
			//如果处理的是确认某域为身份证号码
   		if (limit == "IsIDCard" ) {
			var paras = [
						 ["T",field,"IsIDCard",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}	
			//如果处理的是确认某域为日期
   		if (limit == "IsDate" ) {
			var paras = [
						 ["T",field,"IsDate",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
			//如果处理的是确认某域为数字
   		if (limit == "IsDigital" ) {
			var paras = [
						 ["T",field,"IsDigital",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
			
			//如果处理的是确认某域为邮政编码
   		if (limit == "IsZip" ) {
			var paras = [
						 ["T",field,"IsZip",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
			//如果处理的是确认某域为电话号码
   		if (limit == "IsTelephone" ) {
			var paras = [
						 ["T",field,"IsTelephone",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
   		if (limit == "IsFax" ) {
			var paras = [
						 ["T",field,"IsFax",msg]
				    ]
			if(!inputValidate(paras)) return false;
			}
		return true;
}

//获得页面中中英文混合字符串的实际长度，str为字符串的值
function getLength(str) {
    l=str.length
    all=0;
    for(i=0;i<l;i++){
        aim=str.charAt(i);
        aim=escape(aim);
        if ((aim.length==3)||(aim.length==1)){
            all=all+1;
        }
        if (aim.length==6){
            all=all+2;
        }
    }
    return all
}

// 确认验证
function _confirm(url, message)  {
	if(confirm(message))  {
		window.location.href=url;
	}
}

//全选checkbox
var checkflag = "false";
function check(field,select,deselcet) {
    if(field) {
    	if (checkflag == "false") {
    	    if(field.length) {
        		for (i = 0; i < field.length; i++) {
        			field[i].checked = true;
        		}
    	    }
    	    else {
    	        field.checked = true;
    	    }
    	    checkflag = "true";
        	return deselcet; 
    	}
    	else {
    	    if(field.length) {
        		for (i = 0; i < field.length; i++) {
        			field[i].checked = false; 
        		}
            }
            else {
                field.checked = false;
            }
    	    checkflag = "false";
    	    return select; 
    	}
    }
    else {
        return select;
    }
}

function Is_OverLength_ex(iLimition,field,crit,msg)
{
    Text = "" + field.value;
    if ( calcRealLength( Text ) > iLimition  ){
	    doMSG(field,crit,msg);  
	    return true;
	}
	return false;
}

// The following added by Zhenghao
// 2000-09-29
//求判断一个字符是否是ASCII值
//cValue：参数值
function isASCII( cValue )
{
	var sFormat = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	var iLocation = sFormat.indexOf( cValue );
	return( iLocation != -1 );
}

function doMSG(field,crit,msg)
{
	if ( (-1!=crit) )
	{
		alert(msg)
		if (crit==1)
		{
			field.focus();  // focus does not work on certain netscape versions
			field.select();
		}
	}
}

//将一个字符串中的汉字计为2个字符，以利于数据库中正确处理
//sString：待记数的字符串
function calcRealLength( sString )
{
	var iLength = 0;	// 真实长度记数器
	for( i = 0; i < sString.length; i ++ )
	{
		if( isASCII( sString.charAt( i ) ) )
		{
			iLength += 1;
		}
		else
		{
			iLength += 2;
		}
	}
	
	return( iLength );
}


function Is_InLengthMin(iLimition,Fieldvalue)
{	  	
	if( calcRealLength( Fieldvalue ) < iLimition )
		return false;
	return true;
}
window.undefined = window.undefined;
window.$E = function ($) {
	return (typeof ($) == "object" ? $ : document.getElementById($));
};
window.Z = {};
Z.html = {};
Z.html.Select = {clear:function ($) {
	$ = $E($);
	$.options.length = 0;
	return $;
}, bindData:function (F, G, E, D, _, B) {
	F = $E(F);
	if (!F || F.type.indexOf("select") == -1) {
		alert("\ufffd\ufffd\ufffd\ufffddrp\ufffd\ufffd\u0427!");
		return;
	}
	if (!G && G.length) {
		alert("\ufffd\ufffd\ufffd\ufffdobjectArray\ufffd\ufffd\u0427!");
		return;
	}
	if (!E) {
		alert("\ufffd\ufffd\ufffd\ufffdtextField\ufffd\ufffd\u0427!");
		return;
	}
	if (!D) {
		alert("\ufffd\ufffd\ufffd\ufffdvalueField\ufffd\ufffd\u0427!");
		return;
	}
	if (B) {
		F = this.clear(F);
	}
	if (_ || _ == "") {
		F.options.add(new Option(_, ""));
	}
	for (var H = 0; H < G.length; H++) {
		var $ = G[H][E], C = G[H][D], A = new Option($, C);
		F.options.add(A);
	}
}};

/**
 * 身份证号码验证
 *
 */
function isIdCardNo(num) {
 var factorArr = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
 var parityBit=new Array("1","0","X","9","8","7","6","5","4","3","2");
 var varArray = new Array();
 var intValue;
 var lngProduct = 0;
 var intCheckDigit;
 var intStrLen = num.length;
 var idNumber = num;
   // initialize
     if ((intStrLen != 18)) {
         return false;
     }
     // check and set value
     for(i=0;i<intStrLen;i++) {
         varArray[i] = idNumber.charAt(i);
         if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
             return false;
         } else if (i < 17) {
             varArray[i] = varArray[i] * factorArr[i];
         }
     }
     
     if (intStrLen == 18) {
         //check date
         var date8 = idNumber.substring(6,14);
         if (isDate8(date8) == false) {
            return false;
         }
         // calculate the sum of the products
         for(i=0;i<17;i++) {
             lngProduct = lngProduct + varArray[i];
         }
         // calculate the check digit
         intCheckDigit = parityBit[lngProduct % 11];
         // check last digit
         if (varArray[17] != intCheckDigit) {
             return false;
         }
     }
     else{        //length is 15
         //check date
         var date6 = idNumber.substring(6,12);
         if (isDate6(date6) == false) {

             return false;
         }
     }
     return true;
     
 }
/**
 * 判断是否为“YYYYMM”式的时期
 *
 */
function isDate6(sDate) {
   if(!/^[0-9]{6}$/.test(sDate)) {
      return false;
   }
   var year, month, day;
   year = sDate.substring(0, 4);
   month = sDate.substring(4, 6);
   if (year < 1700 || year > 2500) return false
   if (month < 1 || month > 12) return false
   return true
}
/**
 * 判断是否为“YYYYMMDD”式的时期
 *
 */
function isDate8(sDate) {
   if(!/^[0-9]{8}$/.test(sDate)) {
      return false;
   }
   var year, month, day;
   year = sDate.substring(0, 4);
   month = sDate.substring(4, 6);
   day = sDate.substring(6, 8);
   var iaMonthDays = [31,28,31,30,31,30,31,31,30,31,30,31]
   if (year < 1700 || year > 2500) return false
   if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1]=29;
   if (month < 1 || month > 12) return false
   if (day < 1 || day > iaMonthDays[month - 1]) return false
   return true
}
/**
 *
 *
**/
function isContactTel(value){
	var tel = /^((((\d{11})||((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{5}|\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{5}|\d{4}|\d{3}|\d{2}|\d{1})))[,;，；\s]{0,1}){0,10})$/;
	return tel.test(value);  
} 
/**
 *验证邮箱
 *
**/
function isEmail(value){
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	return myreg.test(value);
}

