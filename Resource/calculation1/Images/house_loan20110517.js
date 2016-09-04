
$( function(){

	$("#loadType").buttonset();
	var payBtn = $("#payType").buttonset();
	
	var buzzRateSel = $("#buzzRateSel"), counRateSel = $("#counRateSel"), years = $("#years"),
		buzzRate = $("#buzzRate"), counRate = $("#counRate");
		
	//动态生成利率下拉框
	for( var key in window.houseLoanBuzzRate ){
		var item = window.houseLoanBuzzRate[ key ];
		var opt = $("<option value='" + key + "'>").text( item.title );
		if ( item.isdefault )
			opt.attr("selected", "selected" );
		
		buzzRateSel.append( opt );		
	}
	for( var key in window.houseLoanCounRate ){
		var item = window.houseLoanCounRate[ key ];
		var opt = $("<option value='" + key + "'>").text( item.title );
		if ( item.isdefault )
			opt.attr("selected", "selected" );
			
		counRateSel.append( opt );			
	}	

	//动态更改利率	
	buzzRateSel.change( function(){
		var v = buzzRateSel.val(), y = parseInt( years.val() ) <= 5 ? 0 : 1 ;
		if ( v == "-1" )
			buzzRate.val("0.00");
		else	
			buzzRate.val( (window.houseLoanBuzzRate[ v ].rate[ y ] * 100).toFixed(2) );	
	} );
	counRateSel.change( function(){
		var v = counRateSel.val(), y = parseInt(years.val() ) <= 5 ? 0 : 1 ;
		if ( v == "-1"  )
			counRate.val("0.00");
		else	
			counRate.val( (window.houseLoanCounRate[ v ].rate[ y ] * 100).toFixed(2) );	
	} );
	years.change( function(){
		counRateSel.change();
		buzzRateSel.change();
	} ).change();
	var years = $("#years"), month = $("#month");
	//计算期次
	function getTerm(){
		return parseInt(years.val() || "0") * 12 + parseInt(month.val() || "0");
	}
	years.keyup( function(){
		$("#term").text( getTerm() );
	} );
	month.change( function(){
		$("#term").text( getTerm() );
	} );
	
	//当利率更改后反馈下拉框
	buzzRate.blur( function(){
		counRate.find("option:selected").removeAttr("selected");
		var v = $(this).val(), y = parseInt( years.val() ) <= 5 ? 0 : 1;
		for( var key in houseLoanBuzzRate ){
			if ( (houseLoanBuzzRate[key].rate[ y ] * 100).toFixed(2) == v ){
				buzzRate.find("option[value='"+ key +"']").attr("selected", "selected" );
				return;				
			}
		}
	});
	counRate.blur( function(){
		counRate.find("option:selected").removeAttr("selected");
		var v = counRate.val(), y = parseInt( years.val() ) <= 5 ? 0 : 1;
		for( var key in houseLoanCounRate ){
			if ( (houseLoanCounRate[key].rate[ y ] * 100).toFixed(2) == v ){
				counRate.find("option[value='"+ key +"']").attr("selected", "selected" );
				return;				
			}
		}
	});		
	
	//隐藏不必须的行
	 $("input[name='radio']").change( function(){
	 	var v = $("input[name='radio']:checked").val();
		var payType = $("input[name='radioPay']:checked").val();
		if ( v == "1" ){
			$(".buzzTr").show();
			$(".counTr").hide();
			if ( $("#loadBuzzAmt").val() == "0" )
				$("#loadBuzzAmt").val( "" );
			if ( $("#loadCounAmt").val() == "" )
				$("#loadCounAmt").val( "0" );
				
			$("#radioPay6, #radioPay6Label").hide();
			
		}else if ( v == "2" ){
			$(".buzzTr").hide();
			$(".counTr").show();
			if ( $("#loadCounAmt").val() == "0" )
				$("#loadCounAmt").val( "" );
			if ( $("#loadBuzzAmt").val() == "" )
				$("#loadBuzzAmt").val( "0" );

			$("#radioPay6, #radioPay6Label").show();
		}else{
			$(".buzzTr").show();
			$(".counTr").show();
			
			$("#radioPay6, #radioPay6Label").hide();
		}
	 } ).change();
	
	//更改还款方式
	$("input[name='radioPay']").change( function(){
		var v = $("input[name='radioPay']:checked").val();
		if ( v == "3" ){
			$("#detailsTable").hide();
			$("#freeTable").show();
		}else{
			$("#freeTable").hide();
			$("#detailsTable").show();
		}
		
	} ).change();
	
	//重置按钮
	$("#resetbtn").click( function(){
		$(".list").height( "0px" );
		$("#container").children("dd").remove();
	} );	
	
	//提交表单
	$("#houseLoan").submit( function( e ){
		e.preventDefault();
		
		var BA = parseFloat( $("#loadBuzzAmt").val() ) * 10000,
			CA = parseFloat( $("#loadCounAmt").val() ) * 10000,
			N = getTerm(),
			payType = $("input[name='radioPay']:checked").val(),
			loadType = $("input[name='radio']:checked").val(),
			BR = parseFloat( buzzRate.val() ) /100 /12,
			CR = parseFloat( counRate.val() ) /100 /12 ;
	
		if ( isNaN(CA) ) CA = 0;
		if ( isNaN(BA) ) BA = 0;
		
		var totalInt = totalAmt = buzzIntAmt = counIntAmt = 0;

		if ((loadType == "1" || loadType == "3") && (payType == "3" || !payType)) {
			dialog("请选择还款方式");
			return;
		}
		
		$(".ct").hide();	
		var  ct = payType == "3" ? $("#freeWrap .list") : $("#detailsWrap .list");
		ct.parent().show();
		ct.children("dd").remove();
		
		//商业贷款
		if ( loadType == "1" ){
			CA = 0;
			$("#BuzzIntAmtTr, #CounIntAmtTr").hide();
		}else if ( loadType == "2" ){
		//公积金贷款
			BA = 0;	
			$("#BuzzIntAmtTr, #CounIntAmtTr").hide();
		}else{
			$("#BuzzIntAmtTr, #CounIntAmtTr").show();
		}
		
		var BList = [], CList = [];
	
		if (payType == "1") {
			//等额本息
			BList = averageInterest( N, BA, BR);
			CList = averageInterest( N, CA, CR);
		}else if (payType == "2"){
			//等额本金
			BList = averageCapital( N, BA, BR);
			CList = averageCapital( N, CA, CR);			
		}else if ( payType == "3" ){
			//自由还款
			var Rs,		//神秘系数，固定死
				P,		//最低还款额
				L= CA,	//本金
				LAMT,	//最后一期本金
				LINT,	//最后一期利息
				rb
					;
			switch ( parseInt( years.val() ) )
			{//自由还款还款方式月最低还款额参照表,调整利率不修改
				case 1 : rb=83.04/100; break;
				case 2 : rb=81.08/100; break;
				case 3 : rb=79.12/100; break;
				case 4 : rb=77.16/100; break;
				case 5 : rb=75.20/100; break;
				case 6 : rb=73.24/100; break;
				case 7 : rb=71.28/100; break;
				case 8 : rb=69.32/100; break;
				case 9 : rb=67.36/100; break;
				case 10 : rb=65.40/100; break;
				case 11 : rb=63.44/100; break;
				case 12 : rb=61.48/100; break;
				case 13 : rb=59.52/100; break;
				case 14 : rb=57.56/100; break;
				case 15 : rb=55.60/100; break;
				case 16 : rb=53.64/100; break;
				case 17 : rb=51.68/100; break;
				case 18 : rb=49.72/100; break;
				case 19 : rb=47.76/100; break;
				case 20 : rb=45.80/100; break;
				case 21 : rb=43.84/100; break;
				case 22 : rb=41.88/100; break;
				case 23 : rb=39.92/100; break;
				case 24 : rb=37.96/100; break;
				case 25 : rb=36.00/100; break;
				case 26 : rb=34.04/100; break;
				case 27 : rb=32.08/100; break;
				case 28 : rb=30.12/100; break;
				case 29 : rb=28.16/100; break;
				case 30 : rb=26.20/100; break;
			} 		
			//最低月还款		 	
			if (N < 5 * 12) {
				Rs = 0.035/12;
				P = Math.ceil( L * Rs * ( Math.pow( 1 + Rs, N ) / ( Math.pow ( 1 + Rs, N ) - 1 ) ) );
			}else{
				Rs = 0.0423 / 12;
				P = Math.ceil( L* (1-rb) * Rs * (Math.pow( 1+Rs, N-1 ) / ( Math.pow( 1+Rs, N-1) -1 )) + L* rb * Rs );
			}
			
			//计算最后一期本金
			LAMT = L;
			for ( var i=1;i< N ;i++ )
			{
				var intamt = Math.round( LAMT * CR * 100 )/100;
				totalInt += intamt;
				
				LAMT = Math.round((LAMT-( P - Math.round( LAMT * CR *100)/100))*100)/100;
				CList.push( [ intamt, P - intamt , P, LAMT ] );
			}
			LINT = Math.round( LAMT * CR * 100 )/100;
			totalInt += LINT;
			CList.push( [ LINT, LAMT , LAMT + LINT, 0 ] );
				
			$("#lessPay").val( P );
			$("#lastAmount").val( LAMT.toFixed(2) );
			$("#lastInt").val( LINT.toFixed(2) );
			$("#totalInt").val( totalInt.toFixed(2) );
			
			//等额本息
			//CList = averageInterest( N - 1, L - LAMT , CR);
			
			var oFrag=document.createDocumentFragment();
			DList = CList;
			for (var i=0; i<DList.length; i++) {
				var tmp = $("<dd>").html(  "<div>" + (i+1) + "</div>" +
											"<div>" + DList[i][2].toFixed(2) + "</div>" +
											"<div>" + DList[i][0].toFixed(2) + "</div>" +
										   "<div>" + DList[i][1].toFixed(2) + "</div>" +
											"<div>" + DList[i][3].toFixed(2) + "</div>" +	
											"<div class='clear'></div>")[0];
				oFrag.appendChild( tmp );				
			}
			$(".list").height( 200 );
			ct.append( oFrag );
		
			return;
		}
		
		var DList = [];
		for (var i=0; i<N; i++) {
			var b = BList[i], c = CList[i];
			DList.push([b[0] + c[0],
						b[1] + c[1],
						b[2] + c[2],
						b[3] + c[3]
					  ]);
			buzzIntAmt += 	b[0];
			counIntAmt += 	c[0];	  
			totalInt += b[0] + c[0];
			totalAmt += b[2] + c[2];		  			
		}	
		
		var oFrag=document.createDocumentFragment();
		for (var i=0; i<DList.length; i++) {
			var tmp = $("<dd>").html(  "<div>" + (i+1) + "</div>" +
										"<div>" + DList[i][2].toFixed(2) + "</div>" +
										"<div>" + DList[i][0].toFixed(2) + "</div>" +
									   "<div>" + DList[i][1].toFixed(2) + "</div>" +
										"<div>" + Math.abs(DList[i][3]).toFixed(2) + "</div>" +	
										"<div class='clear'></div>")[0];
			oFrag.appendChild( tmp );				
		}
		$(".list").height( 200 );
		ct.append( oFrag );
		
		$("#BuzzIntAmt").val( buzzIntAmt.toFixed(2) );
		$("#CounIntAmt").val( counIntAmt.toFixed(2) );
		$("#intAmt").val( totalInt.toFixed(2) );
		$("#fullAmt").val( totalAmt.toFixed(2) );
		
		window.scrollTo( 0, 250 );
	} );
	
	//等额本金
	function averageCapital( N, M, R ){
		var list = [];
		var B = M / N, D = M;
		for (var i=0; i< N ; i++) {
			// Ai = M×（N－i+1）÷N×（R％÷12）
			D = i == 0 ? M : list[ i-1 ][3]; 
			var I = D * R ;
			list.push( [ I, B, B+I, D-B] );	
		}
		return list;			
	}
	
	//等额本息
	function averageInterest( N, M, R ){
		if ( R == 0 )
			return averageCapital( N, M, R );
		var list = [];
		//Ci= M×（R％÷12）×（1+ R％÷12）N÷[（1+ R％÷12）N—1]
		var C = M * R * Math.pow( 1 + R, N ) / ( Math.pow( 1+R, N ) -1 ), D = 0;
		if (isNaN(C)) C = 0;
		for (var i=0; i< N ; i++) {
			// I = 剩余本金 × 月利率
			D = i == 0 ? M : list[ i-1 ][3]; //剩余本金
			var I = D * R ;
			list.push( [ I, C-I, C, D-( C-I )] );	
		}	
		return list;			
	}	
} );
