$('.main-nav').on('click', 'li', function(){
	$(this).siblings().removeClass('current').end().addClass('current');
	$('#iframe').attr('src', $(this).attr('data-src'));
});


$(window).resize(function(e) {
    $("#bd").height($(window).height() - $("#head").height() - $("#ft").height()-6);
	$(".wrap").height($("#bd").height()-6);
	$("#iframe").height($(window).height() - $("#head").height() - $("#ft").height() - 6);
}).resize();


$('.exitDialog').Dialog({/*将exitDialog作为dialog的内容生成dialog(此时display是none的,并配置参数*/
	title:'确认退出系统吗?',
	autoOpen: false,
	width:400,
	height:200
	
});

$('.exit').click(function(){/*主页面右侧退出按钮click,调取$('.exitDialog').Dialog的open功能,进行改变diaplay*/
	$('.exitDialog').Dialog('open');
});



$('.exitDialog input[type=button]').click(function(e) {/*定义exitDialog中*/
    $('.exitDialog').Dialog('close');
	if($(this).hasClass('ok')){
		window.location.href = "n_login.jsp";
	}
});

$('a.ui-dialog-close').click(function() {
	$('.exitDialog').Dialog('close');
});