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
        $('.klay').append('<p class="f-futura fz-xs m-b-0">' + response[i].name + '</p>')
        $('.klay').append('<p class="m-t-0">' + response[i].description + '</p>')
        $('.klay').append("<img class='restaurant' src=" +response[i].image + '>')
       $('.klay').append("<form class='addevent' method='POST' action=" +"/users/appointment/"+response[i].id+ "><input type='time' name='begin_time' value='08:00:00'></input><input type='time' name='end_time' value='12:00:00'></input><input type='submit' id=" + response[i].id + " value='JOIN'></input></form>")
          }
        $('#terminal-form').css("display", "none")
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