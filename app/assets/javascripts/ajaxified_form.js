$(function() {

  $("#new_task").submit(function(){

    $.post("/tasks",$("#new_task").serialize()).done(function(data){
      $("#task").prepend(data);
    });
    return false;
  });
    });

