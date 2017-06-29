$(document).ready(function() {
	var newCol = '<div class="col"></div>';
	var newBlock = '<div class="square-block"></div>'
	var layoutGrid = 64;

	/* $('#newlayout-button').on('click', '.button-new' function() {
		$('.box-number').on('keyup', function() {
			layoutGrid = +$(this).val();
			return layoutGrid;
			location.reload();
		});
	}); */

	for (i = 1; i <= layoutGrid; i++) {
		$('#container').append(newCol);
	}
	for (i = 1; i <= layoutGrid; i++) {
		$('.col').append(newBlock);
	}

	$('.col').on('mouseenter', '.square-block', function() {
		var num = Math.floor((Math.random() - 0.3)*10);
		var paintColors = ['#FF0000', '#FF8000', '#FFFF00', 
											 '#008000', '#0000FF','#A000C0'];
		$(this).css("background-color", paintColors[num]);
	});

	$('#newrefresh').on('mouseenter', '.refresh', function() {
		var colors = ['#F28560', '#F2B560', '#F2CD60', '#56D88C',
									'#60C1F2', '#BD93D8', '#FFDCFC', '#C8FEFF', '#FFF'];
		var rand = Math.floor(Math.random()*colors.length);
		$(this).css("background-color", colors[rand]);
	}); 
	$('#newrefresh').on('mouseleave', '.refresh', function() {
		$(this).css("background-color", 'buttonface');
	});

	$('.refresh').click(function() {
		location.reload();
	});
});