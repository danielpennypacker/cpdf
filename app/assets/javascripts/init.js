
$(document).ready(function(){

	function getWindowSize () {
		$documentHeight = $(document).height();
		$windowWidth = $(window).width();
		$pagesWidth = $(window).width()*5;

		$("#site-container").width($windowWidth+"px");	

		$("#page-container").width($pagesWidth+"px");	

		$("#about").width($windowWidth+"px");		
		$("#archive").width($windowWidth+"px");		
		$("#landing").width($windowWidth+"px");		
		$("#shop").width($windowWidth+"px");		

		$("#about").css("min-height", $documentHeight+"px");		
		$("#archive").css("min-height", $documentHeight+"px");		
		$("#landing").css("min-height", $documentHeight+"px");		
		$("#shop").css("min-height", $documentHeight+"px");	


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
			$(this).children(".next-title").addClass("show");
			$(this).children(".next-title").html(nextTitle);
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
			$(this).children(".prev-title").addClass("show");
			$(this).children(".prev-title").html(nextTitle);
		},
		function () {
			$(this).children(".prev-title").removeClass("show");
			$(this).children(".next-title").html("");
		}
  	);	

	// arrows, next & previous articles
	$("#header a").click(function(){
		var ourTarget = $(this).attr('title');	

		$(".studentBar").removeClass("active");
		$(this).addClass("activeTitle");

        $.smoothScroll({
			direction: 'left',
			scrollElement: $("#site-container"),
			scrollTarget: $("#"+ourTarget),
			speed: 600
        });
	
	});


	//show order desc

	$("#order a").click(function() {
		$("#order-desc").addClass("show");
	})	

	$("header a").click(function() {
		$("#order-desc").removeClass("show");
	})	

});