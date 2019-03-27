// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.                                
//                                             
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//                                            
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//                                            
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
  
  


$( document ).on('turbolinks:load', function() {
  $(".search_booking").click(function(){
     var date = $(this).html();
     var movieId = $(this).attr('data-movie-id');
      console.log($(this).attr('data-movie-id'));
      console.log(date);
      $.ajax({
        type:'get',
        dataType: 'script',
        url: '/sort_movie_show',
        data:{
          sort_movie_show: date,
          movie_id: movieId 
        }
      })
    });
});
 $(function(){
      $('.seat').click(function(){
        var val = [];
        var price = [];
        
        $(':checkbox:checked').each(function(i){
          val[i] = $(this).val();
          console.log(val);
          $(':checked:checked').each(function(j){
            price[j] = $(this).attr("data-price");
          })
          console.log(price);
          $("#seat").val(val);
          var final_price = 0;
          for (var i = 0; i < price.length; i++) {
              final_price += price[i] << 0;

            };
          $("#final_price").val(final_price);
          });
        });
      });