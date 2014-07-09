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


  $(".completed_checkbox").click(function(event){
    var formElement = $(event.target).parents("form");
    $.ajax({
      url: formElement.prop("action"),
      data: formElement.serialize(),
      type: "PATCH"}).done(function(){
        formElement.fadeOut();
      });
  });
});


