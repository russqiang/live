/*手机失去焦点正则验证*/
$("#liphoneCheck").blur(function() {
	var num = $("#liphoneCheck").val();
	if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(num))) {
		// alert("不是完整的11位手机号或者正确的手机号前七位");
		$("#liphoneCheck").val("请输入有效的手机号");
		return false;
	}
});
$("#liphoneCheck").focus(function() {
	$("#liphoneCheck").val("");
});
/* 得到验证码 */
function sendCode() {
	/* 给运行商信息获得短信验证 */
	var codeGet = "111";
	return codeGet;
}
var flag = false;
$("#liphoneCode").blur(function() {
	var liphoneCode = $("#liphoneCode").val();
	if(sendCode() != liphoneCode) {
		$("#liphoneCode").val("请输入有效的验证码");
		return flag;
	} else {
		flag = true;
		return flag;
	}
});

$("#liphoneCode").focus(function() {
	$("#liphoneCode").val("");
});
/* 验证码通过 */
/*$("#ligoNext").click(function() {
	var codeInput = "111";
	if (sendCode() == codeInput) {
		$(".ul1").remove();
		$(".ul2").css("display", "block");
	}
});*/
/* 身份证正则验证 */
$("#idCard").blur(function() {
	var idNum = $("#idCard").val();
	if(!/^\d{17}(\d|x)$/i.test(idNum)) {
		$("#idCard").val("请输入正确的身份证号码");
	}
	return false;
});
$("#idCard").focus(function() {
	$("#idCard").val("");
});

/* 银行卡正则验证 */
$("#bankCard").blur(function() {
	var bankCard = $("#bankCard").val();
	if(!/^([1-9]{1})(\d{14}|\d{18})$/.test(bankCard)) {
		$("#bankCard").val("银行卡号位数错误");
		return false;
	}
});
$("#bankCard").focus(function() {
	$("#bankCard").val("");
});

$("#getCode").click(function() {

	var phoneCheck = $("#phoneCheck").val();
});

$("#selectBark").focus(function() {
	$("select").css("display", "inline")
});
$(".bark").click(function() {
	var this_input = $("#selectBark").val($(this).val());
	$("select").css("display", "none");
});
$("#registernext").click(function() {
	var s1 = $("#realName").val();
	var s2 = $("#idCard").val();
	var s3 = $("#category").val();
	var s4 = $("#style").val();
	var s5 = $("#selectBank").val();
	var s6 = $("#bankCard").val();
	var s7 = $("#liphoneCode").val();
	
	if(s1 != "" && s2 != "" && s3 != "" && s4 != "" && s5 != "" && s6 != "" && s7 != "" && flag == true) {
		$(".ul2").css("display", "none");
		$(".ul1").css("display", "none");
		$(".applay").css("display", "block");
	} else {
		alert("请按照要求提交信息");
	}
});