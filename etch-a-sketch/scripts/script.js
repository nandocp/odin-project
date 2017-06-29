$(document).ready(function() {
	var newCol = '<div class="col"></div>';
	var newBlock = '<div class="square-block"></div>'

	for (i = 1; i <= 32; i++) {
		$('#container').append(newCol);
	}
	for (i = 1; i <= 32; i++) {
		$('.col').append(newBlock);
	}

	$('.col').on('mouseenter', '.square-block', function() {
		var color = Math.floor((Math.random() - 0.3)*10);
		switch (color) {		
		case 1:
			$(this).addClass('hover1');
			break;
		case 2:
			$(this).addClass('hover2');
			break;
		case 3:
			$(this).addClass('hover3');
			break;
		case 4:
			$(this).addClass('hover4');
			break;
		case 5:
			$(this).addClass('hover5');
			break;
		case 6:
			$(this).addClass('hover6');
			break;
		}
	});
	$('.refresh').click(function() {
		location.reload();
	});
});