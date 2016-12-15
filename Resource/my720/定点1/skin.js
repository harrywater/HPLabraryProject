// Garden Gnome Software - Skin
// Pano2VR 3.1.4/1952
// Filename: ?????.ggsk
// Generated 周日 二月 16 02:31:10 2014

function pano2vrSkin(player,base) {
	var me=this;
	var flag=false;
	this.player=player;
	this.player.skinObj=this;
	this.divSkin=player.divSkin;
	var basePath="";
	// auto detect base path
	if (base=='?') {
		var scripts = document.getElementsByTagName('script');
		for(var i=0;i<scripts.length;i++) {
			var src=scripts[i].src;
			if (src.indexOf('skin.js')>=0) {
				var p=src.lastIndexOf('/');
				if (p>=0) {
					basePath=src.substr(0,p+1);
				}
			}
		}
	} else
	if (base) {
		basePath=base;
	}
	this.elementMouseDown=new Array();
	this.elementMouseOver=new Array();
	var cssPrefix='';
	var domTransition='transition';
	var domTransform='transform';
	var prefixes='Webkit,Moz,O,ms,Ms'.split(',');
	var i;
	for(i=0;i<prefixes.length;i++) {
		if (typeof document.body.style[prefixes[i] + 'Transform'] !== 'undefined') {
			cssPrefix='-' + prefixes[i].toLowerCase() + '-';
			domTransition=prefixes[i] + 'Transition';
			domTransform=prefixes[i] + 'Transform';
		}
	}
	
	this.player.setMargins(0,0,0,0);
	
	this.updateSize=function(startElement) {
		var stack=new Array();
		stack.push(startElement);
		while(stack.length>0) {
			e=stack.pop();
			if (e.ggUpdatePosition) {
				e.ggUpdatePosition();
			}
			if (e.hasChildNodes()) {
				for(i=0;i<e.childNodes.length;i++) {
					stack.push(e.childNodes[i]);
				}
			}
		}
	}
	
	parameterToTransform=function(p) {
		return 'translate(' + p.rx + 'px,' + p.ry + 'px) rotate(' + p.a + 'deg) scale(' + p.sx + ',' + p.sy + ')';
	}
	
	this.findElements=function(id,regex) {
		var r=new Array();
		var stack=new Array();
		var pat=new RegExp(id,'');
		stack.push(me.divSkin);
		while(stack.length>0) {
			e=stack.pop();
			if (regex) {
				if (pat.test(e.ggId)) r.push(e);
			} else {
				if (e.ggId==id) r.push(e);
			}
			if (e.hasChildNodes()) {
				for(i=0;i<e.childNodes.length;i++) {
					stack.push(e.childNodes[i]);
				}
			}
		}
		return r;
	}
	
	this.preloadImages=function() {
		var preLoadImg=new Image();
		preLoadImg.src=basePath + 'images/left0__o.png';
		preLoadImg.src=basePath + 'images/right0__o.png';
		preLoadImg.src=basePath + 'images/up0__o.png';
		preLoadImg.src=basePath + 'images/down__o.png';
		preLoadImg.src=basePath + 'images/zoom_in__o.png';
		preLoadImg.src=basePath + 'images/zoom_out__o.png';
		preLoadImg.src=basePath + 'images/auto_rotate__o.png';
	}
	
	this.addSkin=function() {
		this._loading_image=document.createElement('div');
		this._loading_image.ggId='loading image'
		this._loading_image.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._loading_image.ggVisible=true;
		this._loading_image.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-112 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-32 + h/2) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -112px;';
		hs+='top:  -32px;';
		hs+='width: 224px;';
		hs+='height: 64px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		this._loading_image.setAttribute('style',hs);
		this._loading_image__img=document.createElement('img');
		this._loading_image__img.setAttribute('src',basePath + 'images/loading_image.png');
		this._loading_image__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._loading_image__img);
		this._loading_image.appendChild(this._loading_image__img);
		this._loading_text=document.createElement('div');
		this._loading_text.ggId='loading text'
		this._loading_text.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._loading_text.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 12px;';
		hs+='top:  14px;';
		hs+='width: 198px;';
		hs+='height: 20px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='border: 0px solid #000000;';
		hs+='color: #000000;';
		hs+='text-align: left;';
		hs+='white-space: nowrap;';
		hs+='padding: 0px 1px 0px 1px;'
		hs+='overflow: hidden;';
		this._loading_text.setAttribute('style',hs);
		this._loading_text.ggUpdateText=function() {
			this.innerHTML="<b>Loading... "+(me.player.getPercentLoaded()*100.0).toFixed(0)+"%<\/b>";
		}
		this._loading_text.ggUpdateText();
		this._loading_image.appendChild(this._loading_text);
		this._loading_bar=document.createElement('div');
		this._loading_bar.ggId='loading bar'
		this._loading_bar.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._loading_bar.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 11px;';
		hs+='top:  39px;';
		hs+='width: 198px;';
		hs+='height: 10px;';
		hs+=cssPrefix + 'transform-origin: 0% 50%;';
		hs+='visibility: inherit;';
		hs+='border: 2px solid #000000;';
		hs+='background-color: #4f4f4f;';
		this._loading_bar.setAttribute('style',hs);
		this._loading_image.appendChild(this._loading_bar);
		this._loading_close=document.createElement('div');
		this._loading_close.ggId='loading close'
		this._loading_close.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._loading_close.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 200px;';
		hs+='top:  1px;';
		hs+='width: 24px;';
		hs+='height: 24px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		this._loading_close.setAttribute('style',hs);
		this._loading_close__img=document.createElement('img');
		this._loading_close__img.setAttribute('src',basePath + 'images/loading_close.png');
		this._loading_close__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._loading_close__img);
		this._loading_close.appendChild(this._loading_close__img);
		this._loading_close.onclick=function () {
			me._loading_image.style[domTransition]='none';
			me._loading_image.style.visibility='hidden';
			me._loading_image.ggVisible=false;
		}
		this._loading_image.appendChild(this._loading_close);
		this.divSkin.appendChild(this._loading_image);
		this._toolbar=document.createElement('div');
		this._toolbar.ggId='toolbar'
		this._toolbar.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._toolbar.ggVisible=true;
		this._toolbar.ggUpdatePosition=function() {
			this.style[domTransition]='none';
			if (this.parentNode) {
				w=this.parentNode.offsetWidth;
				this.style.left=(-138 + w/2) + 'px';
				h=this.parentNode.offsetHeight;
				this.style.top=(-38 + h) + 'px';
			}
		}
		hs ='position:absolute;';
		hs+='left: -138px;';
		hs+='top:  -38px;';
		hs+='width: 277px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		this._toolbar.setAttribute('style',hs);
		this._left0=document.createElement('div');
		this._left0.ggId='left'
		this._left0.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._left0.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 0px;';
		hs+='top:  0px;';
		hs+='width: 32px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._left0.setAttribute('style',hs);
		this._left0__img=document.createElement('img');
		this._left0__img.setAttribute('src',basePath + 'images/left0.png');
		this._left0__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._left0__img);
		this._left0.appendChild(this._left0__img);
		this._left0.onmouseover=function () {
			me._left0__img.src=basePath + 'images/left0__o.png';
		}
		this._left0.onmouseout=function () {
			me._left0__img.src=basePath + 'images/left0.png';
			me.elementMouseDown['left0']=false;
		}
		this._left0.onmousedown=function () {
			me.elementMouseDown['left0']=true;
		}
		this._left0.onmouseup=function () {
			me.elementMouseDown['left0']=false;
		}
		this._left0.ontouchend=function () {
			me.elementMouseDown['left0']=false;
		}
		this._toolbar.appendChild(this._left0);
		this._right0=document.createElement('div');
		this._right0.ggId='right'
		this._right0.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._right0.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 35px;';
		hs+='top:  0px;';
		hs+='width: 32px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._right0.setAttribute('style',hs);
		this._right0__img=document.createElement('img');
		this._right0__img.setAttribute('src',basePath + 'images/right0.png');
		this._right0__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._right0__img);
		this._right0.appendChild(this._right0__img);
		this._right0.onmouseover=function () {
			me._right0__img.src=basePath + 'images/right0__o.png';
		}
		this._right0.onmouseout=function () {
			me._right0__img.src=basePath + 'images/right0.png';
			me.elementMouseDown['right0']=false;
		}
		this._right0.onmousedown=function () {
			me.elementMouseDown['right0']=true;
		}
		this._right0.onmouseup=function () {
			me.elementMouseDown['right0']=false;
		}
		this._right0.ontouchend=function () {
			me.elementMouseDown['right0']=false;
		}
		this._toolbar.appendChild(this._right0);
		this._up0=document.createElement('div');
		this._up0.ggId='up'
		this._up0.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._up0.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 70px;';
		hs+='top:  0px;';
		hs+='width: 32px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._up0.setAttribute('style',hs);
		this._up0__img=document.createElement('img');
		this._up0__img.setAttribute('src',basePath + 'images/up0.png');
		this._up0__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._up0__img);
		this._up0.appendChild(this._up0__img);
		this._up0.onmouseover=function () {
			me._up0__img.src=basePath + 'images/up0__o.png';
		}
		this._up0.onmouseout=function () {
			me._up0__img.src=basePath + 'images/up0.png';
			me.elementMouseDown['up0']=false;
		}
		this._up0.onmousedown=function () {
			me.elementMouseDown['up0']=true;
		}
		this._up0.onmouseup=function () {
			me.elementMouseDown['up0']=false;
		}
		this._up0.ontouchend=function () {
			me.elementMouseDown['up0']=false;
		}
		this._toolbar.appendChild(this._up0);
		this._down=document.createElement('div');
		this._down.ggId='down'
		this._down.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._down.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 105px;';
		hs+='top:  0px;';
		hs+='width: 32px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._down.setAttribute('style',hs);
		this._down__img=document.createElement('img');
		this._down__img.setAttribute('src',basePath + 'images/down.png');
		this._down__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._down__img);
		this._down.appendChild(this._down__img);
		this._down.onmouseover=function () {
			me._down__img.src=basePath + 'images/down__o.png';
		}
		this._down.onmouseout=function () {
			me._down__img.src=basePath + 'images/down.png';
			me.elementMouseDown['down']=false;
		}
		this._down.onmousedown=function () {
			me.elementMouseDown['down']=true;
		}
		this._down.onmouseup=function () {
			me.elementMouseDown['down']=false;
		}
		this._down.ontouchend=function () {
			me.elementMouseDown['down']=false;
		}
		this._toolbar.appendChild(this._down);
		this._zoom_in=document.createElement('div');
		this._zoom_in.ggId='zoom in'
		this._zoom_in.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._zoom_in.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 140px;';
		hs+='top:  0px;';
		hs+='width: 32px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._zoom_in.setAttribute('style',hs);
		this._zoom_in__img=document.createElement('img');
		this._zoom_in__img.setAttribute('src',basePath + 'images/zoom_in.png');
		this._zoom_in__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._zoom_in__img);
		this._zoom_in.appendChild(this._zoom_in__img);
		this._zoom_in.onmouseover=function () {
			me._zoom_in__img.src=basePath + 'images/zoom_in__o.png';
		}
		this._zoom_in.onmouseout=function () {
			me._zoom_in__img.src=basePath + 'images/zoom_in.png';
			me.elementMouseDown['zoom_in']=false;
		}
		this._zoom_in.onmousedown=function () {
			me.elementMouseDown['zoom_in']=true;
		}
		this._zoom_in.onmouseup=function () {
			me.elementMouseDown['zoom_in']=false;
		}
		this._zoom_in.ontouchend=function () {
			me.elementMouseDown['zoom_in']=false;
		}
		this._toolbar.appendChild(this._zoom_in);
		this._zoom_out=document.createElement('div');
		this._zoom_out.ggId='zoom out'
		this._zoom_out.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._zoom_out.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 175px;';
		hs+='top:  0px;';
		hs+='width: 32px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._zoom_out.setAttribute('style',hs);
		this._zoom_out__img=document.createElement('img');
		this._zoom_out__img.setAttribute('src',basePath + 'images/zoom_out.png');
		this._zoom_out__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._zoom_out__img);
		this._zoom_out.appendChild(this._zoom_out__img);
		this._zoom_out.onmouseover=function () {
			me._zoom_out__img.src=basePath + 'images/zoom_out__o.png';
		}
		this._zoom_out.onmouseout=function () {
			me._zoom_out__img.src=basePath + 'images/zoom_out.png';
			me.elementMouseDown['zoom_out']=false;
		}
		this._zoom_out.onmousedown=function () {
			me.elementMouseDown['zoom_out']=true;
		}
		this._zoom_out.onmouseup=function () {
			me.elementMouseDown['zoom_out']=false;
		}
		this._zoom_out.ontouchend=function () {
			me.elementMouseDown['zoom_out']=false;
		}
		this._toolbar.appendChild(this._zoom_out);
		this._auto_rotate=document.createElement('div');
		this._auto_rotate.ggId='auto rotate'
		this._auto_rotate.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		this._auto_rotate.ggVisible=true;
		hs ='position:absolute;';
		hs+='left: 210px;';
		hs+='top:  0px;';
		hs+='width: 32px;';
		hs+='height: 32px;';
		hs+=cssPrefix + 'transform-origin: 50% 50%;';
		hs+='visibility: inherit;';
		hs+='cursor: pointer;';
		this._auto_rotate.setAttribute('style',hs);
		this._auto_rotate__img=document.createElement('img');
		this._auto_rotate__img.setAttribute('src',basePath + 'images/auto_rotate.png');
		this._auto_rotate__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
		me.player.checkLoaded.push(this._auto_rotate__img);
		this._auto_rotate.appendChild(this._auto_rotate__img);
		this._auto_rotate.onclick=function () {
			me.player.toggleAutorotate();
		}
		this._auto_rotate.onmouseover=function () {
			me._auto_rotate__img.src=basePath + 'images/auto_rotate__o.png';
		}
		this._auto_rotate.onmouseout=function () {
			me._auto_rotate__img.src=basePath + 'images/auto_rotate.png';
		}
		this._toolbar.appendChild(this._auto_rotate);
		this.divSkin.appendChild(this._toolbar);
		this.preloadImages();
		this.divSkin.ggUpdateSize=function(w,h) {
			me.updateSize(me.divSkin);
		}
		this.divSkin.ggViewerInit=function() {
		}
		this.divSkin.ggLoaded=function() {
			me._loading_image.style[domTransition]='none';
			me._loading_image.style.visibility='hidden';
			me._loading_image.ggVisible=false;
		}
		this.divSkin.ggReLoaded=function() {
		}
		this.divSkin.ggEnterFullscreen=function() {
		}
		this.divSkin.ggExitFullscreen=function() {
		}
		this.skinTimerEvent();
	};
	this.hotspotProxyClick=function(id) {
	}
	this.hotspotProxyOver=function(id) {
	}
	this.hotspotProxyOut=function(id) {
	}
	this.skinTimerEvent=function() {
		setTimeout(function() { me.skinTimerEvent(); }, 10);
		this._loading_text.ggUpdateText();
		var hs='';
		if (me._loading_bar.ggParameter) {
			hs+=parameterToTransform(me._loading_bar.ggParameter) + ' ';
		}
		hs+='scale(' + (1 * me.player.getPercentLoaded() + 0) + ',1.0) ';
		me._loading_bar.style[domTransform]=hs;
		if (me.elementMouseDown['left0']) {
			me.player.changePan(1,true);
		}
		if (me.elementMouseDown['right0']) {
			me.player.changePan(-1,true);
		}
		if (me.elementMouseDown['up0']) {
			me.player.changeTilt(1,true);
		}
		if (me.elementMouseDown['down']) {
			me.player.changeTilt(-1,true);
		}
		if (me.elementMouseDown['zoom_in']) {
			me.player.changeFovLog(-1,true);
		}
		if (me.elementMouseDown['zoom_out']) {
			me.player.changeFovLog(1,true);
		}
	};
	function SkinHotspotClass(skinObj,hotspot) {
		var me=this;
		var flag=false;
		this.player=skinObj.player;
		this.skin=skinObj;
		this.hotspot=hotspot;
		this.elementMouseDown=new Array();
		this.elementMouseOver=new Array();
		this.__div=document.createElement('div');
		this.__div.setAttribute('style','position:absolute; left:0px;top:0px;visibility: inherit;');
		
		this.findElements=function(id,regex) {
			var r=new Array();
			var stack=new Array();
			var pat=new RegExp(id,'');
			stack.push(me.__div);
			while(stack.length>0) {
				e=stack.pop();
				if (regex) {
					if (pat.test(e.ggId)) r.push(e);
				} else {
					if (e.ggId==id) r.push(e);
				}
				if (e.hasChildNodes()) {
					for(i=0;i<e.childNodes.length;i++) {
						stack.push(e.childNodes[i]);
					}
				}
			}
			return r;
		}
		
		if (hotspot.skinid=='up') {
			this.__div=document.createElement('div');
			this.__div.ggId='up'
			this.__div.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
			this.__div.ggVisible=true;
			hs ='position:absolute;';
			hs+='left: 350px;';
			hs+='top:  85px;';
			hs+='width: 5px;';
			hs+='height: 5px;';
			hs+=cssPrefix + 'transform-origin: 50% 50%;';
			hs+='visibility: inherit;';
			this.__div.setAttribute('style',hs);
			this.__div.onclick=function () {
				me.player.openUrl(me.hotspot.url,me.hotspot.target);
				me.skin.hotspotProxyClick(me.hotspot.id);
			}
			this.__div.onmouseover=function () {
				me.player.hotspot=me.hotspot;
				me.skin.hotspotProxyOver(me.hotspot.id);
			}
			this.__div.onmouseout=function () {
				me.player.hotspot=me.player.emptyHotspot;
				me.skin.hotspotProxyOut(me.hotspot.id);
			}
			this._hstext1=document.createElement('div');
			this._hstext1.ggId='hstext1'
			this._hstext1.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
			this._hstext1.ggVisible=false;
			this._hstext1.ggUpdatePosition=function() {
				this.style[domTransition]='none';
				this.style.left=(-25 + (54-this.offsetWidth)/2) + 'px';
			}
			hs ='position:absolute;';
			hs+='left: -25px;';
			hs+='top:  -30px;';
			hs+='width: auto;';
			hs+='height: auto;';
			hs+=cssPrefix + 'transform-origin: 50% 50%;';
			hs+='visibility: hidden;';
			hs+='border: 1px solid #ff0000;';
			hs+='color: #ff0000;';
			hs+='background-color: #ffff7f;';
			hs+='text-align: center;';
			hs+='white-space: nowrap;';
			hs+='padding: 0px 1px 0px 1px;'
			hs+='overflow: hidden;';
//			this._hstext1.setAttribute('style',hs);
//			this._hstext1.innerHTML=me.hotspot.title;
//			this.__div.appendChild(this._hstext1);
//			this._hsanniu1=document.createElement('div');
//			this._hsanniu1.ggId='hsanniu1'
//			this._hsanniu1.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
//			this._hsanniu1.ggVisible=true;
//			hs ='position:absolute;';
//			hs+='left: -10px;';
//			hs+='top:  -15px;';
//			hs+='width: 25px;';
//			hs+='height: 26px;';
//			hs+=cssPrefix + 'transform-origin: 50% 50%;';
//			hs+='visibility: inherit;';
//			hs+='cursor: pointer;';
//			this._hsanniu1.setAttribute('style',hs);
//			this._hsanniu1__img=document.createElement('img');
//			this._hsanniu1__img.setAttribute('src',basePath + 'images/hsanniu1.png');
//			this._hsanniu1__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
//			me.player.checkLoaded.push(this._hsanniu1__img);
//			this._hsanniu1.appendChild(this._hsanniu1__img);
//			this._hsanniu1.onmouseover=function () {
//				me._hsanniu1__img.src=basePath + 'images/hsanniu1__o.png';
//				me.elementMouseOver['hsanniu1']=true;
//			}
//			this._hsanniu1.onmouseout=function () {
//				me._hstext1.style[domTransition]='none';
//				me._hstext1.style.visibility='hidden';
//				me._hstext1.ggVisible=false;
//				me._hsanniu1__img.src=basePath + 'images/hsanniu1.png';
//				me.elementMouseOver['hsanniu1']=false;
//			}
//			this._hsanniu1.ontouchend=function () {
//				me.elementMouseOver['hsanniu1']=false;
//			}
//			this.__div.appendChild(this._hsanniu1);
//			this.hotspotTimerEvent=function() {
//				setTimeout(function() { me.hotspotTimerEvent(); }, 10);
//				if (me.elementMouseOver['hsanniu1']) {
//					me._hstext1.style[domTransition]='none';
//					me._hstext1.style.visibility='inherit';
//					me._hstext1.ggVisible=true;
//				}
//			}
//			this.hotspotTimerEvent();
		} else
		if (hotspot.skinid=='right') {
			this.__div=document.createElement('div');
			this.__div.ggId='right'
			this.__div.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
			this.__div.ggVisible=true;
			hs ='position:absolute;';
			hs+='left: 515px;';
			hs+='top:  75px;';
			hs+='width: 5px;';
			hs+='height: 5px;';
			hs+=cssPrefix + 'transform-origin: 50% 50%;';
			hs+='visibility: inherit;';
			this.__div.setAttribute('style',hs);
			this.__div.onclick=function () {
				me.player.openUrl(me.hotspot.url,me.hotspot.target);
				me.skin.hotspotProxyClick(me.hotspot.id);
			}
			this.__div.onmouseover=function () {
				me.player.hotspot=me.hotspot;
				me.skin.hotspotProxyOver(me.hotspot.id);
			}
			this.__div.onmouseout=function () {
				me.player.hotspot=me.player.emptyHotspot;
				me.skin.hotspotProxyOut(me.hotspot.id);
			}
			this._hstext2=document.createElement('div');
			this._hstext2.ggId='hstext2'
			this._hstext2.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
			this._hstext2.ggVisible=false;
			this._hstext2.ggUpdatePosition=function() {
				this.style[domTransition]='none';
				this.style.left=(15 + (45-this.offsetWidth)/2) + 'px';
			}
			hs ='position:absolute;';
			hs+='left: 15px;';
			hs+='top:  -5px;';
			hs+='width: auto;';
			hs+='height: auto;';
			hs+=cssPrefix + 'transform-origin: 50% 50%;';
			hs+='visibility: hidden;';
			hs+='border: 1px solid #ff0000;';
			hs+='color: #ff0000;';
			hs+='background-color: #ffff7f;';
			hs+='text-align: center;';
			hs+='white-space: nowrap;';
			hs+='padding: 0px 1px 0px 1px;'
			hs+='overflow: hidden;';
//			this._hstext2.setAttribute('style',hs);
//			this._hstext2.innerHTML=me.hotspot.title;
//			this.__div.appendChild(this._hstext2);
//			this._hsanniu2=document.createElement('div');
//			this._hsanniu2.ggId='hsanniu2'
//			this._hsanniu2.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
//			this._hsanniu2.ggVisible=true;
//			hs ='position:absolute;';
//			hs+='left: -15px;';
//			hs+='top:  -10px;';
//			hs+='width: 25px;';
//			hs+='height: 24px;';
//			hs+=cssPrefix + 'transform-origin: 50% 50%;';
//			hs+='visibility: inherit;';
//			hs+='cursor: pointer;';
//			this._hsanniu2.setAttribute('style',hs);
//			this._hsanniu2__img=document.createElement('img');
//			this._hsanniu2__img.setAttribute('src',basePath + 'images/hsanniu2.png');
//			this._hsanniu2__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
//			me.player.checkLoaded.push(this._hsanniu2__img);
//			this._hsanniu2.appendChild(this._hsanniu2__img);
//			this._hsanniu2.onmouseover=function () {
//				me._hsanniu2__img.src=basePath + 'images/hsanniu2__o.png';
//				me.elementMouseOver['hsanniu2']=true;
//			}
//			this._hsanniu2.onmouseout=function () {
//				me._hstext2.style[domTransition]='none';
//				me._hstext2.style.visibility='hidden';
//				me._hstext2.ggVisible=false;
//				me._hsanniu2__img.src=basePath + 'images/hsanniu2.png';
//				me.elementMouseOver['hsanniu2']=false;
//			}
//			this._hsanniu2.ontouchend=function () {
//				me.elementMouseOver['hsanniu2']=false;
//			}
//			this.__div.appendChild(this._hsanniu2);
//			this.hotspotTimerEvent=function() {
//				setTimeout(function() { me.hotspotTimerEvent(); }, 10);
//				if (me.elementMouseOver['hsanniu2']) {
//					me._hstext2.style[domTransition]='none';
//					me._hstext2.style.visibility='inherit';
//					me._hstext2.ggVisible=true;
//				}
//			}
//			this.hotspotTimerEvent();
		} else
		{
			this.__div=document.createElement('div');
			this.__div.ggId='left'
			this.__div.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
			this.__div.ggVisible=true;
			hs ='position:absolute;';
			hs+='left: 180px;';
			hs+='top:  100px;';
			hs+='width: 5px;';
			hs+='height: 5px;';
			hs+=cssPrefix + 'transform-origin: 50% 50%;';
			hs+='visibility: inherit;';
			this.__div.setAttribute('style',hs);
			this.__div.onclick=function () {
				me.player.openUrl(me.hotspot.url,me.hotspot.target);
				me.skin.hotspotProxyClick(me.hotspot.id);
			}
			this.__div.onmouseover=function () {
				me.player.hotspot=me.hotspot;
				me.skin.hotspotProxyOver(me.hotspot.id);
			}
			this.__div.onmouseout=function () {
				me.player.hotspot=me.player.emptyHotspot;
				me.skin.hotspotProxyOut(me.hotspot.id);
			}
			this._hstext3=document.createElement('div');
			this._hstext3.ggId='hstext3'
			this._hstext3.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
			this._hstext3.ggVisible=false;
			this._hstext3.ggUpdatePosition=function() {
				this.style[domTransition]='none';
				this.style.left=(-55 + (41-this.offsetWidth)/2) + 'px';
			}
			hs ='position:absolute;';
			hs+='left: -55px;';
			hs+='top:  -15px;';
			hs+='width: auto;';
			hs+='height: auto;';
			hs+=cssPrefix + 'transform-origin: 50% 50%;';
			hs+='visibility: hidden;';
			hs+='border: 1px solid #ff0000;';
			hs+='color: #ff0000;';
			hs+='background-color: #ffff7f;';
			hs+='text-align: center;';
			hs+='white-space: nowrap;';
			hs+='padding: 0px 1px 0px 1px;'
			hs+='overflow: hidden;';
//			this._hstext3.setAttribute('style',hs);
//			this._hstext3.innerHTML=me.hotspot.title;
//			this.__div.appendChild(this._hstext3);
//			this._hsanniu3=document.createElement('div');
//			this._hsanniu3.ggId='hsanniu3'
//			this._hsanniu3.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
//			this._hsanniu3.ggVisible=true;
//			hs ='position:absolute;';
//			hs+='left: -15px;';
//			hs+='top:  -15px;';
//			hs+='width: 25px;';
//			hs+='height: 25px;';
//			hs+=cssPrefix + 'transform-origin: 50% 50%;';
//			hs+='visibility: inherit;';
//			hs+='cursor: pointer;';
//			this._hsanniu3.setAttribute('style',hs);
//			this._hsanniu3__img=document.createElement('img');
//			this._hsanniu3__img.setAttribute('src',basePath + 'images/hsanniu3.png');
//			this._hsanniu3__img.setAttribute('style','position: absolute;top: 0px;left: 0px;');
//			me.player.checkLoaded.push(this._hsanniu3__img);
//			this._hsanniu3.appendChild(this._hsanniu3__img);
//			this._hsanniu3.onmouseover=function () {
//				me._hsanniu3__img.src=basePath + 'images/hsanniu3__o.png';
//				me.elementMouseOver['hsanniu3']=true;
//			}
//			this._hsanniu3.onmouseout=function () {
//				me._hstext3.style[domTransition]='none';
//				me._hstext3.style.visibility='hidden';
//				me._hstext3.ggVisible=false;
//				me._hsanniu3__img.src=basePath + 'images/hsanniu3.png';
//				me.elementMouseOver['hsanniu3']=false;
//			}
//			this._hsanniu3.ontouchend=function () {
//				me.elementMouseOver['hsanniu3']=false;
//			}
//			this.__div.appendChild(this._hsanniu3);
//			this.hotspotTimerEvent=function() {
//				setTimeout(function() { me.hotspotTimerEvent(); }, 10);
//				if (me.elementMouseOver['hsanniu3']) {
//					me._hstext3.style[domTransition]='none';
//					me._hstext3.style.visibility='inherit';
//					me._hstext3.ggVisible=true;
//				}
//			}
//			this.hotspotTimerEvent();
		}
	};
	this.addSkinHotspot=function(hotspot) {
		return new SkinHotspotClass(me,hotspot);
	}
//	this.addSkin();
};