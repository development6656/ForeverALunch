// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .
$(document).ready(function(){

  $('.form_submit').on("submit", function(){
      event.preventDefault();
      $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: $(this).serialize(),
        dataType: 'JSON'
      }).done(function(response){
        for(var i = 0; i<response.length; i++){


        console.log(response[i].name + response[i].image + response[i].description)
        $('.klay').append('<p>' + response[i].name + '</p>')
        $('.klay').append('<p>' + response[i].description + '</p>')
        $('.klay').append("<img class='dksz' src=" +response[i].image + '>')
       $('.klay').append("<form class='addevent' method='POST' action=" +"/users/appointment/"+response[i].id+ "><input type='time' name='begin_time' value='08:00:00'></input><input type='time' name='end_time' value='12:00:00'></input><input type='submit' id=" + response[i].id + " value='pick dis'></input></form>")
          }

      })
  })

  $('.lebron').on("submit",'.addevent', function(){
    event.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      method: 'POST',
      data: $(this).serialize(),
      dataType: 'JSON'
    }).done(function(response){
      debugger


    })


  })


})