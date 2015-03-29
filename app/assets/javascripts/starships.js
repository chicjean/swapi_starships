$(document).ready(function(){

	$('.ship-specs').hide();
	$('.show-specs').text('Show More');

 	$('.show-specs').on('click', function(event){
    event.preventDefault();
		$(this).parent('.starship').toggleClass('expanded');
  	$(this).next('.ship-specs').slideToggle();
  	($(this).text() === 'Show More') ? ($(this).text('Show Less')) : ($(this).text('Show More'));
  });

  $('#clear-form').on('click', function(event) {
  	event.preventDefault();
  	$('#name-search').val('');
  	$('#model-search').val('');
  	$('#manufacturer-search').val('');
  	$('#class-search').val('');
  	$('#search-starships-form').submit();
  });

});