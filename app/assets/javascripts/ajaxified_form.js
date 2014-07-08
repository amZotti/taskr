$(function() {

  $("#new_task").submit(function(){

    $.post("/tasks",$("#new_task").serialize()).done(function(data){
      $("ul").prepend(data);
    });
    return false;
  });
    });

