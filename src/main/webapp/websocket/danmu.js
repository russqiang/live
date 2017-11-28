$(function() {
	/*
	 * $("#startDm,.d_del").click(function() { $("#startDm,.dm").toggle(1000);
	 * //init_screen(); });
	 */
	// $("#startDm,.dm").toggle(1000);
	init_screen();
	$("#ligetCode").click(function() {
		/*
		 * //send();
		 */});
	$("#liphoneCode").keydown(function() {
		var code = window.event.keyCode;

		if (code == 13)// 回车键按下时，输出到弹幕

		{
			/*
			 * //send();
			 */}
	});

});
var _top = 80;

function launch() {
	/* 设置弹幕初始高度,宽度 */
	var _height = $(window).height() - $("#a1").height();

	/*
	 * var _left = ($(window).width() + $("#a1").width()) / 2 - $("#" +
	 * index).width();
	 */

	var _left = $(window).width() - $("#" + index).width();

	var time = 8000;
	if (index % 2 == 0)
		time = 10000;
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
	var _height = $(window).height() - $("#a1").height();
	$("#a1").find("div").show().each(function() {
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
	})((Math.random() * 0x1000000 << 0).toString(16))
}
