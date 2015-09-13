//手机验证
jQuery.validator.addMethod("isMobile", function(value, element) {
	var length = value.length;
	var mobile = /^1\d{10}$/;
	return (length == 11 && mobile.exec(value)) ? true : false;
}, "请正确填写您的手机号码");
// 邮编验证
jQuery.validator.addMethod("isZipCode", function(value, element) {
	var tel = /^[0-9]{6}$/;
	return (tel.exec(value)) ? true : false;
}, "请正确填写您的邮编");
// 长度验证
jQuery.validator.addMethod("textLength", function(value, element, param) {
	return value.length == param ? true : false;
}, "长度必须为${0}位");