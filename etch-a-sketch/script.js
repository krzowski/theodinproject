var number = 16;

$(document).ready(function(){
	grids(number)

	$(".grid").on("mouseenter", function(){
		$(this).css("background", "#FFFFFF");
	});

	$(".clear").on("click", function(){
		$(".grid").css({"background": "#333355", "opacity": 1}).removeClass("colored");

	});

	$(".new").on("click", function(){
		newGrid();
		$(".grid").on("mouseenter", function(){
			$(this).css("background", "#FFFFFF");
		});
	});

	$(".random").on("click", function(){
		newGrid();
		$(".grid").on("mouseenter", function(){
			$(this).css("background", randomColor());
		});
	});

	$(".opacity").on("click", function(){
		newGrid();
		$(".grid").on("mouseenter", function(){
			var opacity = $(this).css("opacity");
			if (opacity > 0.1) {
				$(this).css("opacity", opacity - 0.1);
			}else{
				$(this).css("opacity", 0);
			}
		});
	});
	
	$(".ranopa").on("click", function(){
		newGrid();
		$(".grid").on("mouseenter", function(){
			var opacity = $(this).css("opacity");

			if ($(this).hasClass("colored")){
				if (opacity > 0.1) {
					$(this).css("opacity", opacity - 0.1);
				}else{
					$(this).css("opacity", 0);
				}
			}else {
				$(this).css("background", randomColor());
				$(this).addClass("colored");
			}	
		});
	});

	$(".trail").on("click", function(){
		newGrid();
		$(".grid").hover(function(){
			$(this).css({"opacity": 0});
		}, function(){
			$(this).fadeTo("slow", 1);
		});
	});
	
});


function grids(n) {
	var size = 960;
	var boxSize = (960 - 2*n)/n;
	var container = $(".container").html("");
	for (var j = 0; j < n; j++) {
		for (var i = 0; i < n; i++) {
			container.append( $("<div></div>").addClass("grid").height(boxSize).width(boxSize) );
		}
		container.append($("<div></div>").css("clear", "both"));
	}
}

function randomColor(){
	var r = Math.floor(Math.random() * 256);
	var g = Math.floor(Math.random() * 256);
	var b = Math.floor(Math.random() * 256);
	return "rgb(" + r + "," +  g + ","+ b + ")"
}

function newGrid(){
	number = prompt("How many grids? (between 1 and 64)");
	if (number > 0 && number < 65) {
		grids(number);
		$(".grid").css("background", "#333355");
		$(".grid").unbind();
	}else {
		newGrid();
	}
}