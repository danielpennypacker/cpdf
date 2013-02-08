
$(document).ready(function(){

	function getWindowSize () {
		$windowHeight = $(window).height();
		$windowWidth = $(window).width();
		
		$("article").height($windowHeight+"px");		
		$(".screen").height($windowHeight+"px");		
		$(".screen").width($windowWidth+"px");		
		$(".title").css("line-height",$windowHeight+"px")


	}
	
	$(window).resize(function (){	
		getWindowSize  ();
	});
	
	getWindowSize  ();
	
	//arrows - forward
    $ourClicks = 0;

    $('div.forward').click(function() {
		$ourID = $(this).parent().attr("id");


		$clickLength = $("#"+$ourID+" .screen").length-1;


		//alert($clickLength);

		$ourClicks=$ourClicks+1;

		if ($ourClicks > $clickLength) {
			$ourClicks = 0;
		}

		//alert($ourClicks);


		$ourTarget = "#"+$ourID+" .thing"+$ourClicks;

		//alert($ourTarget);

	    $.smoothScroll({
	    	offset: 0,
			direction: 'left',
			scrollElement: $(this).parent(),
			scrollTarget: $($ourTarget),
			speed: 600
	    });

    return false;
    });


	//arrows - backward

    $('div.backward').click(function() {
		$ourID = $(this).parent().attr("id");


		$clickLength = $("#"+$ourID+" .screen").length-1;


		//alert($clickLength);

		$ourClicks=$ourClicks-1;

		if ($ourClicks < 0) {
			$ourClicks = $clickLength;
		}

		//alert($ourClicks);


		$ourTarget = "#"+$ourID+" .thing"+$ourClicks;

		//alert($ourTarget);

	    $.smoothScroll({
	    	offset: 0,
			direction: 'left',
			scrollElement: $(this).parent(),
			scrollTarget: $($ourTarget),
			speed: 600
	    });

    return false;
    });

});