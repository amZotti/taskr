$(function() {

  $("#new_task").submit(function(){

    $.post("/tasks",$("#new_task").serialize()).done(function(data){
      $("#task").prepend(data);
      $("#errors").html("");
      $("#task_title, #task_body").val("");
    }).fail(function(xhr){
      var html = xhr.responseText;
      $("#errors").html(html)
    });
    return false;
  });
});

