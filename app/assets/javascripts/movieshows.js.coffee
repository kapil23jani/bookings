# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
 screen = $("#movieshow_screen_id").html()
 $("movieshow_theatre_id").change ->
 	country = $("#movieshow_theatre_id : selected").text()
 	options = $(screen).filter("optgroup[label= #{country}]").html()
 	if options
 		$("#movieshow_screen_id").html(options)
 	else
 		$("#movieshow_screen_id").empty()

 	console.log(options)