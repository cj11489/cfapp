$(document).on('ready page:load', function() {
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });

    //elevate zoom jquery plugin - allows users to zoom in on product images
    $('.img-zoom').elevateZoom();

    //Autocomplete jquery plugin - defining autocomplete source list
    $(".selector").autocomplete({
    	source: [ "1-3 Letters", "4-6 Letters", "7-10 Letters", "banana"]
    })

    $(".selector").autocomplete("option", "source", ["1-3 Letters", "4-6 Letters", "7-10 Letters", "banana"])
})