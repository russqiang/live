$(function() {
	init_screen();
	$("#liphoneCode").keydown(function() {
		var code = window.event.keyCode;
		if (code == 13) // 回车键按下时，输出到弹幕
		{
		}
	});

});
var _top = 80;

function launch() {
	/* 设置弹幕初始高度,宽度 */
	var _height = $("#a2").offset().top;
	var _left = $(window).width() - $("#a2").offset().left;
	var time = 40000;
	if (index % 2 == 0)
		time = 20000;
	_top += 80;
	if (_top > 500)
		_top = 80;
	$("#" + index).css({
		left : _left,
		top : _top,
		color : getRandomColor()
	});
	$("#" + index).animate({
		left : "-" + _left + "px"
	}, time, function() {
		$("#" + index).fadeOut();
	});
	index++;
}

// 初始化弹幕
function init_screen() {
	var _top = 0;
	var _height = $("#a2").offset().top;
	$("#a2").find("div").show().each(function() {
		var _left = $(window).width() - $(this).width();
		var time = 10000;
		if ($(this).index() % 2 == 0)
			time = 20000;
		_top += 80;
		if (_top > 600)
			_top = 80;
		$(this).css({
			left : _left,
			top : _top,
			color : getRandomColor()
		});
		$(this).animate({
			left : "500px"
		}, time, function() {
		});
	});

}

// 随机获取颜色值
function getRandomColor() {
	return '#' + (function(h) {
		return new Array(7 - h.length).join("0") + h
	})("ffffee")
}