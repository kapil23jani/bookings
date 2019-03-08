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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery

$(document).ready(function(){
	$("#show_seats").click(function(){
		$("#seats").toggle();

	});
});

 $(function(){
      $('.abc').click(function(){
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
          // $("#price").text(price);
          var final_price = 0;
          for (var i = 0; i < price.length; i++) {
              final_price += price[i] << 0;

            };
          $("#final_price").val(final_price);
          });
        });
      });

 $(document).ready(function () {
 	var selectedsection = []
    $('p').click(function () {
        var seactioname= this.className;
        console.log(seactioname);
        selectedsection.push(seactioname);
        console.log(selectedsection);
        $("#sname").text(selectedsection);
        var price = $(this.className).attr("id");
    });
});
