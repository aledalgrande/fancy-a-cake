$(document).ready(function() {
	$('.request a').click(function(e) {
		e.preventDefault();
		$('#request').slideToggle();
		$('html,body').animate({ scrollTop: $('#request').offset().top }, 'slow');
	})	
})