var _carbonads = {

	init: function() 
	{
		/*
		var placement = this.getUrlVar('placement');
		var zoneid = this.getUrlVar('zoneid');
		var serve = this.getUrlVar('zoneid') == 1386 ? 'C6SI42Y' : this.getUrlVar('serve');
		var legacyid = this.getUrlVar('legacyid');
		
		var pro = document.createElement('script');
			pro.id = '_yoggrt_projs';
		    pro.type = 'text/javascript';
		    pro.src = '//cdn.buysellads.com/ac/pro.js';
		
		var yoggrt = document.createElement('div');
			yoggrt.id = 'bsap_' + zoneid;
			yoggrt.className = 'bsaPROrocks';
			yoggrt.setAttribute('data-serve', serve);
			yoggrt.setAttribute('data-segment-placement', placement);
		
		var protag = document.getElementById('_yoggrt_js');
		
		if (this.isNum(legacyid))
		{
			try{
				var legacycss = document.createElement('style');
					legacycss.type = 'text/css';
					legacycss.id = 'bsa_css';
					legacycss.innerHTML = '.one{position:relative}.one .bsa_it_ad{display:block;padding:15px;border:1px solid #e1e1e1;background:#f9f9f9;font-family:helvetica,arial,sans-serif;line-height:100%;position:relative}.one .bsa_it_ad a{text-decoration:none}.one .bsa_it_ad a:hover{text-decoration:none}.one .bsa_it_ad .bsa_it_t{display:block;font-size:12px;font-weight:bold;color:#212121;line-height:125%;padding:0 0 5px 0}.one .bsa_it_ad .bsa_it_d{display:block;color:#434343;font-size:12px;line-height:135%}.one .bsa_it_ad .bsa_it_i{float:left;margin:0 15px 10px 0}.one .bsa_it_p{display:block;text-align:right;position:absolute;bottom:10px;right:15px}.one .bsa_it_p a{font-size:10px;color:#666;text-decoration:none}.one .bsa_it_ad .bsa_it_p a:hover{font-style:italic}';
				document.getElementsByTagName('head')[0].appendChild(legacycss);
			}catch(e){}
		}
		
		protag.parentNode.insertBefore(yoggrt, protag.nextSibling);
		document.getElementsByTagName('head')[0].appendChild(pro);
		*/
		
		_carbon_placement = this.getUrlVar('placement');
		_carbon_serve = this.reroute(_carbon_placement);
		_carbon_legacyid = this.getUrlVar('legacyid');
		
		var baseurl = 'srv.buysellads.com';
		if (window.location.protocol != 'https:')
			baseurl = 'srv.carbonads.net';
		
		var pro = document.createElement('script');
			pro.id = '_carbonads_projs';
		    pro.type = 'text/javascript';
		    pro.src = '//' + baseurl + '/ads/' + _carbon_serve + '.json?segment=placement:' + _carbon_placement + '&callback=_carbonads_go';

		// we check for a freq cap here and if we find one make 
		// the call to the pub pro API with the additional info
		var ck = document.cookie,
			day = ck.indexOf('_bsap_daycap='),
			life = ck.indexOf('_bsap_lifecap=');
		day = day >= 0 ? ck.substring(day + 12 + 1).split(';')[0].split(',') : [];
		life = life >= 0 ? ck.substring(life + 13 + 1).split(';')[0].split(',') : [];
	
		if (day.length || life.length) {
			var freqcap = [];
			for (var i = 0; i < day.length; i++) {
				var adspot = day[i];
	
				// using an array here is ugly, but safer cross-browser than for(var i in...) from an obj
				for (var found = -1, find = 0; find < freqcap.length && found == -1; find++)
				if (freqcap[find][0] == adspot) found = find;
				if (found == -1) freqcap.push([adspot, 1, 0]);
				else freqcap[found][1]++;
			}
			for (var i = 0; i < life.length; i++) {
				var adspot = day[i];
	
				// using an array here is ugly, but safer cross-browser than for(var i in...) from an obj
				for (var found = -1, find = 0; find < freqcap.length && found == -1; find++)
				if (freqcap[find][0] == adspot) found = find;
				if (found == -1) freqcap.push([adspot, 0, 1]);
				else freqcap[found][2]++;
			}
	
			for (var i = 0; i < freqcap.length; i++)
			freqcap[i] = freqcap[i].join(',');
	
			if (freqcap.length) pro.src += '&freqcap=' + freqcap.join(';');
		}
		
		document.getElementsByTagName('head')[0].appendChild(pro);
		
		// this is for legacy yoggrt
		if (this.isNum(_carbon_legacyid))
		{
			try{
				var legacycss = document.createElement('style');
					legacycss.id = '_legacy_carbonads_css';
					legacycss.innerHTML = '.one{position:relative}.one .bsa_it_ad{display:block;padding:15px;border:1px solid #e1e1e1;background:#f9f9f9;font-family:helvetica,arial,sans-serif;line-height:100%;position:relative}.one .bsa_it_ad a{text-decoration:none}.one .bsa_it_ad a:hover{text-decoration:none}.one .bsa_it_ad .bsa_it_t{display:block;font-size:12px;font-weight:bold;color:#212121;line-height:125%;padding:0 0 5px 0}.one .bsa_it_ad .bsa_it_d{display:block;color:#434343;font-size:12px;line-height:135%}.one .bsa_it_ad .bsa_it_i{float:left;margin:0 15px 10px 0}body .one .bsa_it_p{text-align:center;display:block !important}.one .bsa_it_p a{font-size:10px;color:#666;text-decoration:none}.one .bsa_it_ad .bsa_it_p a:hover{font-style:italic}';
				document.getElementsByTagName('head')[0].appendChild(legacycss);
			}catch(e){}
		}
	},
	
	/*
	go: function(ad) 
	{
		var placement = this.getUrlVar('placement');
		var yoggrtjs = document.getElementById('_yoggrt_js');
		var legacyid = this.getUrlVar('legacyid');
		var link = ad.statlink.split('?encredirect=');
		var fulllink;
		
		if(typeof link[1] != 'undefined')
			fulllink = link[0] + '?segment=placement:' + placement + '&encredirect=' + encodeURIComponent(link[1]);
		else if (link[0].search('srv.buysellads.com') > 0)
			fulllink = link[0] + '?segment=placement:' + placement;
		else
			fulllink = link[0];
		
		if (this.isNum(legacyid)) {
			var el = document.createElement('div');
				el.className = 'bsap';
				el.innerHTML = '<div class="bsa_it one"><div class="bsa_it_ad"><a href="' + fulllink + '" target="_blank"><span class="bsa_it_i"><img src="' + ad.image + '" width="130" height="100" alt="" style="max-width:130px;"></span></a><a href="' + fulllink + '" target="_blank"><span class="bsa_it_d">' + ad.description + '</span></a><div style="clear:both"></div></div><span class="bsa_it_p"><a href="http://yoggrt.com/" target="_blank">via Yoggrt</a></span></div>';
		}
		else {
			var el = document.createElement('div');
				el.id = 'yoggrt';
				el.innerHTML = '<span class="yoggrt-wrap"><a href="' + fulllink + '" class="yoggrt-img" target="_blank"><img src="' + ad.image + '" alt="" border="0" height="100" width="130" style="max-width:130px;" /></a><a href="' + fulllink + '" class="yoggrt-text" target="_blank">' + ad.description + '</a></span><a href="http://yoggrt.com/" class="yoggrt-poweredby" target="_blank">via yoggrt</a>';
		}
		
		if(typeof ad.pixel != 'undefined')
		{
			var pix = document.createElement('img');
				pix.src = ad.pixel;
				pix.border = '0';
				pix.height = '1';
				pix.width = '1';
				pix.style.display = 'none';
			el.appendChild(pix);
		}

		if(yoggrtjs != null)
			if (yoggrtjs.nextSibling != null)
				yoggrtjs.parentNode.insertBefore(el, yoggrtjs.nextSibling);
			else
				yoggrtjs.parentNode.appendChild(el);
	},
	*/
	
	reroute: function (slug)
	{
		var p = new Array();
			p['dailyexhaustcom']='CVYD42E';p['schwarztechnet']='CVYD42E';p['worktimercouk']='CVYD42E';p['www6ixpassionscom']='CVYD42E';p['wwwtech-thoughtsnet']='CVYD42E';p['wwwmobilemozaiccom']='CVYD42T';p['redsgnedcom']='CVYD42T';p['endlessiconscom']='CVYD42T';p['iosicongallerycom']='CVYD42T';p['ui-cloudcom']='CVYD42T';p['wwwsiiimplecom']='CVYD42T';p['getuicolors']='CVYD42T';p['colorphile']='CVYD42T';p['fonticons']='CVYD42T';p['robandlaurencom']='C6AILKT';p['slipsumcom']='C6AILKT';p['blogtyppzcom']='C6AILKT';p['bxslidercom']='C6AILKT';p['css3gencom']='C6AILKT';p['csstypesetcom']='C6AILKT';p['hipsteripsumme']='C6AILKT';p['jquerin']='C6AILKT';p['theinstructionalcom']='C6AILKT';p['zanshinnet']='C6AILKT';p['mindthecode']='C6AILKT';p['webdesigncrowd']='C6AILKT';p['cssdrop']='C6AILKT';p['cssframeworks']='C6AILKT';p['ericlbarnes']='C6AILKT';p['yoggrtcom']='CVYD42T';

		if(this.isset(p[slug]))
			return p[slug];
		else
			return 'F6AIK5T';
	},
	
	isset: function(v)
	{
		return typeof v !== 'undefined' && v != null;
	},
	
	isNum: function (a)
	{
	   return (a - 0) == a && a.length > 0;
	},
	
	getUrlVar: function(name)
	{
	    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	    var regexS = "[\\?&]" + name + "=([^&#]*)";
	    var regex = new RegExp(regexS);
	    var results = regex.exec(document.getElementById('_yoggrt_js').src);
	    if (results == null) return '';
	    else return results[1];
	}

};

function _carbonads_go (b) 
{
	var ad = b['ads'][0], link, fulllink, image, description;
	
	if(ad.html != null)
		ad = JSON.parse(ad.html);
	
	if(ad.fetch != null)
	{
		var fetch = document.createElement('script');
		    fetch.type = 'text/javascript';
		    fetch.src = ad.fetch + '?' + Math.round( Date.now()/10000 );
		document.getElementsByTagName('head')[0].appendChild(fetch);
		return;
	}
	
	image = ad.image;
	link = ad.statlink.split('?encredirect=');
	description = ad.description;
	
	if(typeof link[1] != 'undefined')
		fulllink = link[0] + '?segment=placement:' + _carbon_placement + ';&encredirect=' + encodeURIComponent(link[1]);
	else if (link[0].search('srv.buysellads.com') > 0)
		fulllink = link[0] + '?segment=placement:' + _carbon_placement + ';';
	else
		fulllink = link[0];
		
	if (window.location.protocol != 'https:')
		fulllink = fulllink.replace('srv.buysellads.com', 'srv.carbonads.net');
	
	if (_carbonads.isNum(_carbon_legacyid)) {
		var el = document.createElement('div');
			el.className = 'bsap';
			el.innerHTML = '<div class="bsa_it one"><div class="bsa_it_ad"><a href="' + fulllink + '" target="_blank"><span class="bsa_it_i"><img src="' + ad.image + '" width="130" height="100" alt=""></span></a><a href="' + fulllink + '" target="_blank"><span class="bsa_it_d">' + ad.description + '</span></a><div style="clear:both"></div></div><span class="bsa_it_p"><a href="http://carbonads.net/" target="_blank">ads via Carbon</a></span></div>';
	}
	else {
		var el = document.createElement('div');
			el.id = 'yoggrt';
			el.innerHTML = '<span class="yoggrt-wrap"><a href="' + fulllink + '" class="yoggrt-img" target="_blank"><img src="' + ad.image + '" alt="" border="0" height="100" width="130" style="max-width:130px;" /></a><a href="' + fulllink + '" class="yoggrt-text" target="_blank">' + ad.description + '</a></span><a href="http://carbonads.net/" target="_blank" class="yoggrt-poweredby">ads via Carbon</a>';
	}
	
	if(typeof ad.pixel != 'undefined')
	{
		var pix = document.createElement('img');
			pix.src = ad.pixel;
			pix.border = '0';
			pix.height = '1';
			pix.width = '1';
			pix.style.display = 'none';
		el.appendChild(pix);
	}
	
	var yoggrtjs = document.getElementById('_yoggrt_js');
	if(yoggrtjs != null)
		if (yoggrtjs.nextSibling != null)
			yoggrtjs.parentNode.insertBefore(el, yoggrtjs.nextSibling);
		else
			yoggrtjs.parentNode.appendChild(el);
		
	// if the ad we just dropped has a freq cap we
	// need to update the freqcap cookie
	_bsap_serving_callback(ad.bannerid, ad.zonekey, ad.freqcap);

}
_carbonads.init();

window['_bsap_serving_callback'] = function(banner, zone, freqcap) {
	var append = function(w, data, days) {
			var c = document.cookie,
				i = c.indexOf(w + '='),
				existing = i >= 0 ? c.substring(i + w.length + 1).split(';')[0] + ',' : '',
				d = new Date();
			d.setTime(days * 3600000 + d);
			data = existing + data;
			data = data.substring(0, 2048);
			document.cookie = w + '=' + data + '; expires=' + d.toGMTString() + '; path=\/';
		};

	if (freqcap) {
		append('_bsap_daycap', banner, 1);
		append('_bsap_lifecap', banner, 365);
	}
};