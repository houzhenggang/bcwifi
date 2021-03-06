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
<title>[<% ident(); %>] 高级设置: 其它设置</title>

<link rel='stylesheet' type='text/css' href='bootstrap.min.css'>
<link rel='stylesheet' type='text/css' href='new.css'>
<script src="jquery-1.8.3.min.js"></script>
<script type='text/javascript' src='tomato.js'></script>

<!-- / / / -->

<script type='text/javascript' src='debug.js'></script>

<script type='text/javascript'>

//	<% nvram("t_features,wait_time,wan_speed,jumbo_frame_enable,jumbo_frame_size,ctf_disable"); %>

et1000 = features('1000et');

function verifyFields(focused, quiet)
{
	E('_jumbo_frame_size').disabled = !E('_f_jumbo_frame_enable').checked;
	return 1;
}

function save()
{
	var fom = E('_fom');
	fom.jumbo_frame_enable.value = E('_f_jumbo_frame_enable').checked ? 1 : 0;
/* CTF-BEGIN */
	fom.ctf_disable.value = E('_f_ctf_disable').checked ? 0 : 1;
/* CTF-END */

	if ((fom.wan_speed.value != nvram.wan_speed) ||
/* CTF-BEGIN */
	    (fom.ctf_disable.value != nvram.ctf_disable) ||
/* CTF-END */
	    (fom.jumbo_frame_enable.value != nvram.jumbo_frame_enable) ||
	    (fom.jumbo_frame_size.value != nvram.jumbo_frame_size)) {
		fom._reboot.value = '1';
		form.submit(fom, 0);
	}
	else {
		form.submit(fom, 1);
	}
}
</script>

</head>
<body>
<form id='_fom' method='post' action='tomato.cgi'>
<table id='container' cellspacing=0 class="table">

<tr id='body'>
<td id='content'>


<!-- / / / -->

<input type='hidden' name='_nextpage' value='advanced-misc.asp'>
<input type='hidden' name='_reboot' value='0'>

<input type='hidden' name='jumbo_frame_enable'>
<!-- CTF-BEGIN -->
<input type='hidden' name='ctf_disable'>
<!-- CTF-END -->

<div class='section-title'>其它设置</div>
<div class='section'>
<script type='text/javascript'>
a = [];
for (i = 3; i <= 20; ++i) a.push([i, i + ' 秒']);
createFieldTable('', [
	{ title: '启动等待时间 *', name: 'wait_time', type: 'select', options: a, value: fixInt(nvram.wait_time, 3, 20, 3) },
	{ title: 'WAN口速率 *', name: 'wan_speed', type: 'select', options: [[0,'10M全双工'],[1,'10M半双工'],[2,'100M全双工'],[3,'100M半双工'],[4,'自动选择']], value: nvram.wan_speed },
	null,
/* CTF-BEGIN */
	{ title: '短径转发( CTF )', name: 'f_ctf_disable', type: 'checkbox', value: nvram.ctf_disable != '1' },
	null,
/* CTF-END */
	{ title: '启用巨帧 *', name: 'f_jumbo_frame_enable', type: 'checkbox', value: nvram.jumbo_frame_enable != '0', hidden: !et1000 },
	{ title: '巨帧大小 *', name: 'jumbo_frame_size', type: 'text', maxlen: 4, size: 6, value: fixInt(nvram.jumbo_frame_size, 1, 9720, 2000),
		suffix: ' <small>字节数 (范围: 1 - 9720; 默认: 2000)</small>', hidden: !et1000 }
]);
</script>
<br>
<small ><span class="red">*</span> 不是所有的路由都支持这些选项.<br><span class="red">**</span> 请确认您设定的主频被 CPU 所支持, 266Mhz及以下为MIPSR1旧cpu的路由使用,使用两个参数;300Mhz及以上为MIPSR2新型路由使用,有三个参数!<br><span class="red">**</span> 您必须重启路由器才能让新的 CPU 主频生效!<br><br><b><span class="red">保存设置之前请再次确认您的路由器支持所选的选项!</span></b></small> </div>



<!-- / / / -->

</td></tr>
<tr><td id='footer' colspan=2>
	<span id='footer-msg'></span>
	<input type='button' value='保存设置' class="btn btn-danger" id='save-button' onclick='save()'>
	<input type='button' value='取消设置' class="btn btn-gray" id='cancel-button' onclick='reloadPage();'>
</td></tr>
</table>
</form>
<script type='text/javascript'>verifyFields(null, 1);</script>



</body>
</html>
