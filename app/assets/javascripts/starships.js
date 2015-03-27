$(document).ready(function() {

	$('.ship-specs').hide();

 	$('.show-specs').on('click', function(){	
 			$(this).parent('.starship').toggleClass('expanded');
    	$(this).next('.ship-specs').slideToggle(); 
  });

});