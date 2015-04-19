# Documentation

update_task = (id, new_data) ->
  $.ajax {
    async: false,
    type: "PATCH",
    url: "/tasks/" + id,
    data: {task: new_data},
    success: ->
      location.reload()
    error: ->
      alert("/tasks/" + id)
      alert('Error updating task.')
  }

$(document).ready ->
  $('.js-task-button').click ->
    # alert('test')
    id = $(this).data('task-id')
    $.get("/tasks/" + id,
      (data) ->
        if data.completed
          new_data = {completed: false}
        else
          new_data = {completed: true}
        update_task(id, new_data)
    )
  $('.js-task-check').change ->
    alert('test')
    id = $(this).data('task-id')
    td = $(this).parent();
    if this.checked
      new_data = {completed: true}
    else
      new_data = {completed: false}
    update_task(id, new_data)
