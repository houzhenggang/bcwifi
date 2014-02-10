<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0//EN'>
<!--
	Tomato GUI
	Copyright (C) 2006-2010 Jonathan Zarate
	http://www.polarcloud.com/tomato/

	For use with Tomato Firmware only.
	No part of this file may be used without permission.
-->
<html>
<head>
<meta http-equiv='content-type' content='text/html;charset=utf-8'>
<meta name='robots' content='noindex,nofollow'>
<title>[<% ident(); %>] 系统管理: 固件更新</title>
<link rel='stylesheet' type='text/css' href='tomato.css'>
<link rel='stylesheet' type='text/css' href='v8.css'>
<script type='text/javascript' src='tomato.js'></script>

<!-- / / / -->
<style type='text/css'>
#afu-progress {
	text-align: center;
	padding: 200px 0;
	width: 890px;
}
#afu-time {
	font-size: 26px;
}
</style>

<script type='text/javascript' src='debug.js'></script>

<script type='text/javascript'>

// <% nvram("jffs2_on"); %>

function clock()
{
	var t = ((new Date()).getTime() - startTime) / 1000;
	elem.setInnerHTML('afu-time', Math.floor(t / 60) + ':' + Number(Math.floor(t % 60)).pad(2));
}

function upgrade()
{
	var name;
	var i;
	var fom = document.form_upgrade;
	var ext;

	name = fixFile(fom.file.value);
	if (name.search(/\.(bin|trx|chk)$/i) == -1) {
		alert('请输入 ".bin" 或 ".trx" 文件.');
		return;
	}
	if (!confirm('确定要使用这个文件更新 ' + name + '?')) return;

	E('afu-upgrade-button').disabled = true;

	elem.display('afu-input', false);
	E('content').style.verticalAlign = 'middle';
	elem.display('afu-progress', true);
	elem.display('navi', false)
	elem.display('ident', false)

	startTime = (new Date()).getTime();
	setInterval('clock()', 800);

	fom.action += '?_reset=' + (E('f_reset').checked ? "1" : "0");
	form.addIdAction(fom);
	fom.submit();
}
</script>

</head>
<body>
<table id='container' cellspacing=0>
<tr><td colspan=2 id='header'>
<div class='version'></div>
</td></tr>
<tr id='body'><td id='navi'><script type='text/javascript'>navi()</script></td>
<td id='content'>
<div id='ident'><% ident(); %></div>

<!-- / / / -->

<div id='afu-input'>
	<div class='section-title'>固件更新</div>
	<div class='section'>
		<form name='form_upgrade' method='post' action='upgrade.cgi' encType='multipart/form-data'>
		<div id='box-input'>
			选择固件:<br>
			<input type='file' name='file' size='50' style='height:20px'> <input type='button' value='升级' id='afu-upgrade-button' onclick='upgrade()' style='height:20px'>
		</div>
		</form>
		<br><form name='form_reset' action='javascript:{}'>
		<div id='reset-input'>
			<input type='checkbox' id='f_reset'>&nbsp;&nbsp;升级固件后清除NVRAM全部资料(彻底清除) 
		</div>
		</form>

		<br>
		<table border=0>
		<tr><td>当前版本号：</td><td>&nbsp; <% version(1); %></td></tr>
		<script type='text/javascript'>
		//	<% sysinfo(); %>
		W('<tr><td>剩余内存:</td><td>&nbsp; ' + scaleSize(sysinfo.totalfreeram) + ' &nbsp; <small>(剩余内存空间必须大于固件文件尺寸)</small></td></tr>');
		</script>
		</table>

	</div>
</div>

/* JFFS2-BEGIN */
<div class='note-disabledw' style='display:none' id='jwarn'>
<b>JFFS2 启用时无法升级.</b><br><br>
升级时会覆盖目前JFFS2使用中的分区, 更新前请先备份JFFS2的数据. 关闭JFFS2分区后,再执行升级进程.<br><br><br>
<a href='admin-jffs2.asp'>禁用 &raquo;</a>
</div>
/* JFFS2-END */

<div id='afu-progress' style='display:none;margin:auto'>
	<img src='spin.gif' style='vertical-align:baseline'> <span id='afu-time'>0:00</span><br>
	请稍候...直到固件更新完成.<br>
	<b>请注意:</b> 请勿关闭浏览器或中断电源!<br> 
</div>

<!-- / / / -->

</td></tr>
<tr><td id='footer' colspan=2>&nbsp;</td></tr>
</table>
/* JFFS2-BEGIN */
<script type='text/javascript'>
if (nvram.jffs2_on != '0') {
	E('jwarn').style.display = '';
	E('afu-input').style.display = 'none';
}
</script>
/* JFFS2-END */
<div id="bottom">Copyright © 2012-2013 By <a href="http://www.ethinking.cn/wweb/" target="_blank">苏州亿想中电子科技有限公司</a> All Rights Reserved. <br/>软件版本<% version(); %></div>


</body>
</html>
