/**
 * Created by ohkei QQ:66005199.
 */
$(function(){
	//屏幕宽度
	 /*var winWidth = $(window).width();
	 var $mainContent = $('#mainContent');
	 var scaleX = winWidth/640;
	 if (winWidth < $mainContent.width()) {     
	     $('html').css({
	        transform: 'scale(' + scaleX + ')'
	     });
	 } else {
	    $mainContent.css({
	        transform: 'scale(' + scaleX + ')'
	     });
	 }*/
	var This = this;
	//贷款方式
	var type = 1;
	//单价、总价
	var mode = 1;
	//还款方式
	var part = 1;
	var zeVal = 0;
	var yj1Val = 0;
	var yj2Val = 0;
	var djVal = 0;
	var lx1Val = 0;
	var lx2Val = 0;
	var bx1Val = 0;
	var bx2Val = 0;
	var _qx = 0;
	var _nll = 0;
	var _gjjnll = 0;
	var ze_sd = 0;
	var ze_gjj = 0;
	var yj1_sd = 0;
	var yj1_gjj = 0;
	var lx1_sd = 0;
	var lx1_gjj = 0;
	var lx2_sd = 0;
	var lx2_gjj = 0;
	//按钮
	navInit();
	function navInit(){
		for(var i=1;i<=3;i++){
			$(".nav"+i).click(function(){
				var _id = this.className.substr(7,1);
				type = _id;
				showType();
			});	
		}
		type = 1;
		showType();
	}
	
	function showType(){
		if(type==3){
			$("#type1").hide();
			$("#type3").show();
		}else{
			if(type==1){
				$("#type1").find(".navbg").attr("src","img/navbg1.png");
			}else if(type==2){
				$("#type1").find(".navbg").attr("src","img/navbg2.png");
			}
			$("#type1").show();
			$("#type3").hide();
		}
		typeInit();
		rstInit();
		showPart();
	}
	function typeInit(){
		if(type==3){
			//还款方式
			$("#type3").find(".cb1").click();
			//公积贷
			$("#type3").find(".txt1").val("0");
			//商贷
			$("#type3").find(".txt2").val("0");
			//按揭年限
			$("#type3").find(".txt3").find("option").eq(9).prop('selected',true);
		}else{
			//还款方式
			$("#type1").find(".cb1").click();
			//计算方式
			$("#type1").find(".cb3").click();
			//单价
			$("#type1").find(".txt1").val("0");
			//面积
			$("#type1").find(".txt2").val("0");
			//按揭成数
			$("#type1").find(".txt3").find("option").eq(5).prop('selected',true);
			//按揭年限
			$("#type1").find(".txt4").find("option").eq(9).prop('selected',true);
		}
	}
	function rstInit(){
		$("#rst1").find(".txt1").text("");
		$("#rst1").find(".txt2").text("");
		$("#rst1").find(".txt3").text("");
		$("#rst1").find(".txt4").text("");
		$("#rst1").find(".txt5").text("");
		$("#rst1").find(".txt6").text("");
	}
	$("#type1").find(".cb1").click(function(){
		part = 1;
		showPart();
	});	
	$("#type1").find(".cb2").click(function(){
		part = 2;
		showPart();
	});	
	$("#type1").find(".cb3").click(function(){
		mode = 1;
		$("#mode1").show();
		$("#mode2").hide();
		//typeInit();
		rstInit();
	});	
	$("#type1").find(".cb4").click(function(){
		mode = 2;
		$("#mode2").show();
		$("#mode1").hide();
		$("#mode2").find(".txt4").css("top",$("#mode1").find(".txt2").css("top"));
		$("#mode2").find(".txt5").css("top",$("#mode1").find(".txt3").css("top"));
		//typeInit();
		rstInit();
	});	
	
	$("#cal_btn").click(function(){		
		if(type==3){
			ze_sd = Number($("#type3").find(".txt1").val());
			ze_gjj = Number($("#type3").find(".txt2").val());
			zeVal = ze_sd + ze_gjj;
			_qx = Number($("#type3").find(".txt3").val());
			
			_nll = Number($("#type3").find(".sdll").find(".txt4").val())/1200;
			_gjjnll = Number($("#type3").find(".gjjll").find(".txt4").val())/1200;
			
			yj1_sd = ze_sd*_nll*(Math.pow((1+_nll), _qx)/(Math.pow((1+_nll), _qx)-1));
			yj1_gjj = ze_gjj*_gjjnll*(Math.pow((1+_gjjnll), _qx)/(Math.pow((1+_gjjnll), _qx)-1));
			 
			yj1Val = yj1_sd+yj1_gjj;
			yj2Val = zeVal/_qx;
			djVal = yj2Val/_qx;
			
			lx1_sd = yj1_sd*_qx-ze_sd;
			lx1_gjj = yj1_gjj*_qx-ze_gjj;
			
			lx2_sd = ze_sd*_nll*(_qx*0.5+0.5);
			lx2_gjj = ze_gjj*_gjjnll*(_qx*0.5+0.5);
			
			lx1Val = lx1_sd + lx1_gjj;
			lx2Val = lx2_sd + lx2_gjj;
			
			bx1Val = zeVal + lx1Val;
			bx2Val = zeVal + lx2Val;
			
		}else{
			if(mode==1){
				zeVal = Number($("#mode1").find(".txt1").val())*Number($("#mode1").find(".txt2").val())*(1-Number($("#mode1").find(".txt3").val()));
			}else{
				zeVal = Number($("#mode2").find(".txt1").val());
			}
			//贷款月数
			_qx = Number($("#mode1").find(".txt4").val());
			
			_nll = Number($("#mode1").find(".txt5").val())/1200;
			//月均还款
			yj1Val = zeVal*_nll*(Math.pow((1+_nll), _qx)/(Math.pow((1+_nll), _qx)-1));
			yj2Val = zeVal/_qx;
			djVal = yj2Val/_qx;
			
			//利息-等额|差额
			lx1Val = yj1Val*_qx-zeVal;
			lx2Val = zeVal*_nll*(_qx*0.5+0.5);
			//本息
			bx1Val = zeVal+lx1Val;
			bx2Val = zeVal+lx2Val;
			
		}
		//贷款总额
		$("#rst1").find(".txt1").text(zeVal.toFixed(2)+" 元");
		//贷款月数
		$("#rst1").find(".txt4").text(_qx+" 月");			
		//月均还款
		$("#rst1").find(".txt5").text(eval("yj"+part+"Val").toFixed(2)+" 元");
		
		//还款本息总额
		$("#rst1").find(".txt2").text(eval("bx"+part+"Val").toFixed(2)+" 元");
		//支付利息
		$("#rst1").find(".txt3").text(eval("lx"+part+"Val").toFixed(2)+" 元");
		//每月递减
		$("#rst1").find(".txt6").text(djVal.toFixed(2)+" 元");
		showPart();
	});	
	
	function showPart(){
		if(part==2){
			$("#rst1").find(".tt6").show();
			$("#rst1").find(".txt6").show();
			$("#rst1").find(".ll7").show();
		}else{
			$("#rst1").find(".tt6").hide();
			$("#rst1").find(".txt6").hide();
			$("#rst1").find(".ll7").hide();
		}
	}
	function orient() {
		if (window.orientation == 90 || window.orientation == -90) {
			//ipad、iphone竖屏；Andriod横屏
			$("body").attr("class", "landscape");
			orientation = 'landscape';
			$(".black").hide();
			return false;
		}else if (window.orientation == 0 || window.orientation == 180) {
			//ipad、iphone横屏；Andriod竖屏
			$("body").attr("class", "portrait");
			orientation = 'portrait';
			$(".black").show();
			return false;
		}
	}
	//页面加载时调用
	$(function(){
		orient();
	});
	//用户变化屏幕方向时调用
	$(window).bind( 'orientationchange', function(evt){
		orient();
	});
});
    
    

