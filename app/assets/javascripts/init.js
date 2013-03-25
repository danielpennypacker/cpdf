
$(document).ready(function(){

	function getWindowSize () {
		$documentHeight = $(document).height();
		$windowHeight = $(window).height();		
		$windowWidth = $(window).width();
		$pagesWidth = $(window).width()*3;

		$("#site-container").width($windowWidth+"px");	

		$("#page-container").width($pagesWidth+"px");	

		$("#about").width($windowWidth+"px");		
		$("#archive").width($windowWidth+"px");		
		$("#landing").width($windowWidth+"px");		
		$("#shop").width($windowWidth+"px");		

		$("#about").css("min-height", $windowHeight+"px");		
		$("#archive").css("min-height", $windowHeight+"px");		
		$("#landing").css("min-height", $windowHeight+"px");		
		$("#shop").css("min-height", $windowHeight+"px");	

		$(".item").css("min-height", $documentHeight+"px");		


	}
	
	$(window).resize(function (){	
		getWindowSize  ();
	});
	
	getWindowSize  ();
	
	// show article 

	$("#index ul li a").click(function() {
		var id = $(this).attr('href');
		$(id).addClass("show");
	})


	$(".close").click(function() {
		$(".show").removeClass("show");
	})


	// arrows, next & previous articles

    $("#header a").click(function() {
		$(".show").removeClass("show");  
	})

    $("div.forward").click(function() {
		$(".show").removeClass("show");    	
		$(this).parent().next(".item").addClass("show");
    })

    $("div.forward").hover(
		function () {
			var nextTitle = $(this).parent().next(".item").find(".title").html();
			if (nextTitle != undefined) {
				$(this).children(".next-title").addClass("show");
				$(this).children(".next-title").html("<div class='title-padding'>"+nextTitle+"</div>");
			}
		},
		function () {
			$(this).children(".next-title").removeClass("show");
			$(this).children(".next-title").html("");
		}
  	);	


    $('div.backward').click(function() {
		$(".show").removeClass("show");    	
		$(this).parent().prev(".item").addClass("show");
    })

    $("div.backward").hover(
		function () {
			var nextTitle = $(this).parent().prev(".item").find(".title").html();
			if (nextTitle != undefined) {
				$(this).children(".prev-title").addClass("show");
				$(this).children(".prev-title").html("<div class='title-padding'>"+nextTitle+"</div>");
			}
		},
		function () {
			$(this).children(".prev-title").removeClass("show");
			$(this).children(".next-title").html("");
		}
  	);	

	// scrolling titles
	$("#header a").click(function(){
		var ourTarget = $(this).attr('title');	

		$("a").removeClass("activeTitle");
		$(this).addClass("activeTitle");

        $.smoothScroll({
			direction: 'left',
			scrollElement: $("#site-container"),
			scrollTarget: $("#"+ourTarget),
			speed: 600
        });
	
	});


	//animate header links

	$("#header ul li a").mouseover(function() {
  		$('this').css({
        'position':'absolute'
   	 	})
	});

	//show order desc

	$("#order a").click(function() {
		$("#order-desc").addClass("show");
	})	
	$("#circle").click(function() {
		$("#order-desc").addClass("show");
	})		
	$("#order a").click(function() {
		$("#shop-images").addClass("show");
	})	
	$("#circle").click(function() {
		$("#shop-images").addClass("show");
	})		
	$("header a").click(function() {
		$("#order-desc").removeClass("show");
	})	
	$("header a").click(function() {
		$("#shop-images").removeClass("show");
	})		



    // random circle placement
    var posx = (Math.random() * ($(window).width()-100)).toFixed();
    var posy = (Math.random() * ($(window).height()-100)).toFixed();

	var rotateCSS = 'rotate(' + (Math.random() * (360)).toFixed() + 'deg)';

    $("#circle").css({
        'position':'absolute',
        'left':posx+'px',
        'top':posy+'px',
        '-webkit-transform': rotateCSS,
        '-moz-transform': rotateCSS,
        '-ms-transform': rotateCSS,
        '-o-transform': rotateCSS,
        'transform': rotateCSS
    })

	$(function() {
	  setInterval(circleMove, 8000);
	});

	function circleMove() {
	    var posx = (Math.random() * ($(window).width()-100)).toFixed();
	    var posy = (Math.random() * ($(window).height()-100)).toFixed();


		var rotateCSS = 'rotate(' + (Math.random() * (360)).toFixed() + 'deg)';

	    $("#circle").css({
	        'position':'absolute',
	        'left':posx+'px',
	        'top':posy+'px',
	        '-webkit-transform': rotateCSS,
	        '-moz-transform': rotateCSS,
	        '-ms-transform': rotateCSS,
	        '-o-transform': rotateCSS,
	        'transform': rotateCSS
	    })

	}




});