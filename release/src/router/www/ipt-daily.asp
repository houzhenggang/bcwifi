<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0//EN'>
<!--
	Tomato GUI
	Copyright (C) 2006-2010 Jonathan Zarate
	http://www.polarcloud.com/tomato/

	IP Traffic enhancements
	Copyright (C) 2011 Augusto Bott
	http://code.google.com/p/tomato-sdhc-vlan/

	For use with Tomato Firmware only.
	No part of this file may be used without permission.
-->
<html>
<head>
<meta http-equiv='content-type' content='text/html;charset=utf-8'>
<meta name='robots' content='noindex,nofollow'>
<title>[<% ident(); %>] IP 流量: 每日流量</title>

<link rel='stylesheet' type='text/css' href='http://dev.plat.gionee.com/static/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='http://dev.plat.gionee.com/static/new.css'>





 <script src="jquery-1.8.3.min.js"></script>
<script type='text/javascript' src='tomato.js'></script>
<script type='text/javascript' src='http://dev.plat.gionee.com/static/bootstrap.js'></script>
<script type='text/javascript' src='debug.js'></script>
<script type='text/javascript' src='bwm-hist.js'></script>
<script type='text/javascript' src='bwm-common.js'></script>
<script type='text/javascript' src='interfaces.js'></script>
<script type='text/javascript'>
//	<% nvram("wan_ifname,lan_ifname,wl_ifname,wan_proto,wan_iface,web_svg,cstats_enable,cstats_colors,dhcpd_static,lan_ipaddr,lan_netmask,lan1_ipaddr,lan1_netmask,lan2_ipaddr,lan2_netmask,lan3_ipaddr,lan3_netmask"); %>

//	<% devlist(); %>

try {
//	<% ipt_bandwidth("daily"); %>
}
catch (ex) {
	daily_history = [];
}
cstats_busy = 0;
if (typeof(daily_history) == 'undefined') {
	daily_history = [];
	cstats_busy = 1;
}


var filterip = [];
var filteripe = [];
var filteripe_before = [];
var dateFormat = -1;
var scale = -1;

hostnamecache = [];

function genData() {
	var w, i, h, t;

	w = window.open('', 'tomato_ipt_data_d');
	w.document.writeln('<pre>');
	for (i = 0; i < daily_history.length; ++i) {
		h = daily_history[i];
		t = getYMD(h[0]);
		w.document.writeln([t[0], t[1] + 1, t[2], h[1], h[2], h[3]].join(','));
	}
	w.document.writeln('</pre>');
	w.document.close();
}

function getYMD(n) {
	// [y,m,d]
	return [(((n >> 16) & 0xFF) + 1900), ((n >>> 8) & 0xFF), (n & 0xFF)];
}

var dg = new TomatoGrid();

dg.setup = function() {
	this.init('daily-grid', 'sort');
	this.headerSet(['日期', 'IP 地址', '下载', '上传', '合计']);
}

function redraw() {
	var i, b, d;
	var fskip;
	var tx = 0;
	var rx = 0;
	var hostslisted = [];
	var subnetslisted = [];

	if (daily_history.length > 0) {
		dg.removeAllData();
		for (i = 0; i < daily_history.length; ++i) {
			fskip=0;
			b = daily_history[i];

			if (E('_f_ignorezeroes').checked)
				if ((b[2] < 1) || (b[3] < 1))
					continue;

			if (E('_f_begin_date').value.toString() != '0') {
				if (b[0] < E('_f_begin_date').value)
					continue;
			}

			if (E('_f_end_date').value.toString() != '0') {
				if (b[0] > E('_f_end_date').value)
					continue;
			}

			if (filteripe.length>0) {
				fskip = 0;
				for (var x = 0; x < filteripe.length; ++x) {
					if (b[1] == filteripe[x]){
						fskip=1;
						break;
					}
				}
				if (fskip == 1) continue;
			}

			if (filterip.length>0) {
				fskip = 1;
				for (var x = 0; x < filterip.length; ++x) {
					if (b[1] == filterip[x]){
						fskip=0;
						break;
					}
				}
				if (fskip == 1) continue;
			}

			if ((b[1] == getNetworkAddress(nvram.lan_ipaddr,nvram.lan_netmask)) ||
				(b[1] == getNetworkAddress(nvram.lan1_ipaddr,nvram.lan1_netmask)) ||
				(b[1] == getNetworkAddress(nvram.lan2_ipaddr,nvram.lan2_netmask)) ||
				(b[1] == getNetworkAddress(nvram.lan3_ipaddr,nvram.lan3_netmask))) {
				if(E('_f_subnet').checked == 0) {
					continue;
				} else {
					subnetslisted.push(b[1]);
				}
			} else {
				hostslisted.push(b[1]);
				rx += b[2];
				tx += b[3];
			}

			if (hostslisted.length > 0) {
				hostslisted.sort();
				for (var j = 1; j < hostslisted.length; j++ ) {
					if (hostslisted[j] === hostslisted[j - 1]) {
						hostslisted.splice(j--, 1);
					}
				}
			}

			if (subnetslisted.length > 0) {
				subnetslisted.sort();
				for (var j = 1; j < subnetslisted.length; j++ ) {
					if (subnetslisted[j] === subnetslisted[j - 1]) {
						subnetslisted.splice(j--, 1);
					}
				}
			}

			var h = b[1];
			if (E('_f_hostnames').checked) {
				if(hostnamecache[b[1]] != null) {
					h = hostnamecache[b[1]] + ((b[1].indexOf(':') != -1) ? '<br>' : ' ') + '<small>(' + b[1] + ')</small>';
				}
			}
			if (E('_f_shortcuts').checked) {
				h = h + '<br><small>';
				h = h + '<a href="javascript:viewQosDetail(' + i + ')" title="查看 Qos 细节">[qos详细]</a>';
				h = h + '<a href="javascript:viewQosCTrates(' + i + ')" title="查看每个连接的传输率">[qos速率]</a>';
				h = h + '<a href="javascript:viewIptDetail(' + i + ')" title="查看此IP 实时流量">[IP流量]</a>';
				h = h + '<a href="javascript:addExcludeList(' + i + ')" title="过滤此 IP 地址">[隐藏]</a>';
				h = h + '</small>';
			}
			var ymd = getYMD(b[0]);
			d = [ymdText(ymd[0], ymd[1], ymd[2]), h, rescale(b[2]), rescale(b[3]), rescale(b[2]+b[3])];
			dg.insertData(-1, d);
		}

		dg.resort();
		dg.recolor();
		dg.footerSet([
			'Total', 
			('<small><i>(' +
			(((hostslisted.length > 0) || (subnetslisted.length > 0)) ? 
				((hostslisted.length > 0) ? (hostslisted.length + ' 主机') : '') +
				(((hostslisted.length > 0) && (subnetslisted.length > 0)) ? ', ' : '') +
				((subnetslisted.length > 0) ? (subnetslisted.length + ' 子网') : '')
			: '无数据') +
			')</i></small>'),
			rescale(rx), 
			rescale(tx), 
			rescale(rx+tx)]);
	}
}

function popupWindow(v) {
	window.open(v, '', 'width=1000,height=600,toolbar=no,menubar=no,scrollbars=yes,resizable=yes');
}

function viewQosDetail(n) {
	cookie.set('qos_filterip', [daily_history[n][1]], 1);
	popupWindow('qos-detailed.asp');
}

function viewQosCTrates(n) {
	cookie.set('qos_filterip', [daily_history[n][1]], 1);
	popupWindow('qos-ctrate.asp');
}

function viewIptDetail(n) {
	cookie.set('ipt_filterip', [daily_history[n][1]], 1);
	popupWindow('ipt-details.asp');
}

function addExcludeList(n) {
	if (E('_f_filter_ipe').value.length<6) {
		E('_f_filter_ipe').value = daily_history[n][1];
	} else {
		if (E('_f_filter_ipe').value.indexOf(daily_history[n][1]) < 0) {
			E('_f_filter_ipe').value = E('_f_filter_ipe').value + ',' + daily_history[n][1];
		}
	}
	dofilter();
}

dg.dataToView = function(data) {
	return(data);
}

dg.sortCompare = function(a, b) {
	var col = this.sortColumn;
	var da = a.getRowData();
	var db = b.getRowData();
	var r = 0;
	switch (col) {
	case 0:	// Date
        case 1: // Hostname
                r = cmpIP(da[col], db[col]);
                if (r == 0)
                        r = cmpText(da[col], db[col]);
                break;
	case 2:	// Download
	case 3:	// Upload
	case 4:	// Total
                r = cmpFloat(da[col].replace(/,/g,""), db[col].replace(/,/g,""));
		break;
	}
	return this.sortAscending ? r : -r;
}

function init_filter_dates() {
	var dates = [];
	if (daily_history.length > 0) {
		for (var i = 0; i < daily_history.length; ++i) {
			dates.push('0x' + daily_history[i][0].toString(16));
		}
		if (dates.length > 0) {
			dates.sort();
			for (var j = 1; j < dates.length; j++ ) {
				if (dates[j] === dates[j - 1]) {
					dates.splice(j--, 1);
				}
			}
		}
	}
	var b = E('_f_begin_date');
	var e = E('_f_end_date');
	var d = new Date();
	for (var i = 0; i < dates.length; ++i) {
		var ymd = getYMD(dates[i]);
		b.options[i+1] = new Option(ymdText(ymd[0], ymd[1], ymd[2]), dates[i], false, ((ymd[0]==d.getFullYear()) && (ymd[1]==d.getMonth()) && (ymd[2]==d.getDate()) ));
		e.options[i+1] = new Option(ymdText(ymd[0], ymd[1], ymd[2]), dates[i], false, ((ymd[0]==d.getFullYear()) && (ymd[1]==d.getMonth()) && (ymd[2]==d.getDate()) ));
	}
}

function update_filter_dates(b) {
	for (var i = 0; i < b.options.length; ++i) {
		if(b.options[i].value.toString() != '0') {
			var ymd = getYMD(b.options[i].value);
			b.options[i].text = ymdText(ymd[0], ymd[1], ymd[2]);
		}
	}
}

function init() {

	if (nvram.cstats_enable != '1') return;

	var c;

	init_filter_dates();

	populateCache();

	if ((c = '<% cgi_get("ipt_filterip"); %>') != '') {
		if (c.length>6) {
			E('_f_begin_date').value = 0;
			E('_f_end_date').value = 0;
			E('_f_filter_ip').value = c;
			filterip = c.split(',');
		}
	}

	if ((c = cookie.get('ipt_filterip')) != null) {
		cookie.set('ipt_filterip', '', 0);
		if (c.length>6) {
			E('_f_begin_date').value = 0;
			E('_f_end_date').value = 0;
			E('_f_filter_ip').value = E('_f_filter_ip').value + ((E('_f_filter_ip').value.length > 0) ? ',' : '') + c;
			filterip.push(c.split(','));
		}
	}

	if ((c = cookie.get('ipt_addr_hidden')) != null) {
		if (c.length>6) {
			E('_f_filter_ipe').value = c;
			filteripe = c.split(',');
		}
	}

	filteripe_before = filteripe;

	dateFormat = fixInt(cookie.get('ipt_history_dafm'), 0, 3, 0);
	E('_f_dafm').value = dateFormat;

	scale = fixInt(cookie.get('ipt_history_scale'), 0, 2, 0);
	E('_f_scale').value = scale;

	E('_f_subnet').checked = (((c = cookie.get('ipt_history_subnet')) != null) && (c == '1'));

	E('_f_hostnames').checked = (((c = cookie.get('ipt_history_hostnames')) != null) && (c == '1'));

	E('_f_shortcuts').checked = (((c = cookie.get('ipt_history_shortcuts')) != null) && (c == '1'));

	E('_f_ignorezeroes').checked = (((c = cookie.get('ipt_history_ignorezeroes')) != null) && (c == '1'));

	if (((c = cookie.get('ipt_history_options_vis')) != null) && (c == '1')) {
		toggleVisibility("options");
	}

	dg.setup();

	redraw();
}

function toggleVisibility(whichone) {
	if(E('sesdiv' + whichone).style.display=='') {
		E('sesdiv' + whichone).style.display='none';
		E('sesdiv' + whichone + 'showhide').innerHTML='(点击此处显示)';
		cookie.set('ipt_history_' + whichone + '_vis', 0);
	} else {
		E('sesdiv' + whichone).style.display='';
		E('sesdiv' + whichone + 'showhide').innerHTML='(点击此处隐藏)';
		cookie.set('ipt_history_' + whichone + '_vis', 1);
	}
}

function dofilter() {
	var i;

	if (E('_f_filter_ip').value.length>0) {
		filterip = E('_f_filter_ip').value.split(',');
		for (i = 0; i < filterip.length; ++i) {
			if ((filterip[i] = fixIP(filterip[i])) == null) {
				filterip.splice(i,1);
			}
		}
		E('_f_filter_ip').value = (filterip.length > 0) ? filterip.join(',') : '';
	} else {
		filterip = [];
	}

	if (E('_f_filter_ipe').value.length>0) {
		filteripe = E('_f_filter_ipe').value.split(',');
		for (i = 0; i < filteripe.length; ++i) {
			if ((filteripe[i] = fixIP(filteripe[i])) == null) {
				filteripe.splice(i,1);
			}
		}
		E('_f_filter_ipe').value = (filteripe.length > 0) ? filteripe.join(',') : '';
	} else {
		filteripe = [];
	}

	if (filteripe_before != filteripe) {
		cookie.set('ipt_addr_hidden', (filteripe.length > 0) ? filteripe.join(',') : '', 1);
		filteripe_before = filteripe;
	}

	redraw();
}

function verifyFields(focused, quiet) {
	dateFormat = E('_f_dafm').value * 1;
	cookie.set('ipt_history_dafm', E('_f_dafm').value, 31);

	scale = E('_f_scale').value * 1;
	cookie.set('ipt_history_scale', E('_f_scale').value, 2);

	cookie.set('ipt_history_subnet', (E('_f_subnet').checked ? '1' : '0'), 1);

	cookie.set('ipt_history_hostnames', (E('_f_hostnames').checked ? '1' : '0'), 1);

	cookie.set('ipt_history_shortcuts', (E('_f_shortcuts').checked ? '1' : '0'), 1);

	cookie.set('ipt_history_ignorezeroes', (E('_f_ignorezeroes').checked ? '1' : '0'), 1);

	update_filter_dates(E('_f_begin_date'));
	update_filter_dates(E('_f_end_date'));

	if ((E('_f_begin_date').value > E('_f_end_date').value) && ( E('_f_end_date').value != '0')) {
		var tmp = E('_f_begin_date').value;
		E('_f_begin_date').value = E('_f_end_date').value;
		E('_f_end_date').value = tmp;
	}

	dofilter();
	return 1;
}
</script>
</head>
<body onload='init()'>
<form>
<table id='container' class="table" cellspacing=0>

<tr id='body'>
<td id='content'>


<!-- / / / -->

<div id='cstats'>
<div class='section-title'>每日IP流量历史记录</div>
<div class='section'>
<table id='daily-grid' 

class='table table-bordered table-striped' cellspacing=0 style='height:auto'></table>
</div>

<div class='section-title'>选项 <small><i><a href='javascript:toggleVisibility("options");'><span id='sesdivoptionsshowhide'>​​（点击这里显示）</span></a></i></small></div>
<div class='section' id='sesdivoptions' style='display:none'>
<script type='text/javascript'>
var c;
c = [];
c.push({ title: '仅包含这些IP', name: 'f_filter_ip', size: 50, maxlen: 255, type: 'text', suffix: ' <small>(逗号分隔列表)</small>' });
c.push({ title: '不包含这些IP', name: 'f_filter_ipe', size: 50, maxlen: 255, type: 'text', suffix: ' <small>(逗号分隔列表)</small>' });
c.push({ title: '日期范围', multi: [ { name: 'f_begin_date', type: 'select', options: [['0', '所有']], suffix: ' - ' }, { name: 'f_end_date', type: 'select', options: [['0', '所有']] } ] } );
c.push({ title: '日期格式', name: 'f_dafm', type: 'select', options: [['0', '年-月-日'], ['1', '月-日-年'], ['2', '月 日, 年'], ['3', '日.月.年']] });
c.push({ title: '单位', name: 'f_scale', type: 'select', options: [['0', 'KB'], ['1', 'MB'], ['2', 'GB']] });
c.push({ title: '显示子网统计', name: 'f_subnet', type: 'checkbox', suffix: ' <small>(不考虑最后一行的总流量.)</small>' });
c.push({ title: '勿略没有流量的IP', name: 'f_ignorezeroes', type: 'checkbox' });
c.push({ title: '显示已知的主机名', name: 'f_hostnames', type: 'checkbox' });
c.push({ title: '显示快捷键', name: 'f_shortcuts', type: 'checkbox' });
createFieldTable('',c);
</script>
<div style="float:right;text-align:right">
 <a href="javascript:genData()" class="btn btn-default">数据&raquo;</a>
<br>
 <a href="admin-iptraffic.asp" class="btn btn-default">设置&raquo;</a>
</div>
</div>
</div>
<br>

<script type='text/javascript'>checkCstats();</script>

<!-- / / / -->

</td></tr>
<tr><td id='footer' colspan=2>
<input type='button' class="btn btn-primary" value='刷新' onclick='reloadPage()'>
</td></tr>
</table>
</form>


</body>
</html>
