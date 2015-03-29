$(document).ready(function(){

	$('.ship-specs').hide();
	$('.show-specs').text('Show More');

 	$('.show-specs').on('click', function(){	
 			$(this).parent('.starship').toggleClass('expanded');
    	$(this).next('.ship-specs').slideToggle(); 

    	($(this).text() === 'Show More') ? ($(this).text('Show Less')) : ($(this).text('Show More'));
  });

});
