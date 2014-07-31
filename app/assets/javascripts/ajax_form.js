$(function(){
  var pusher = new Pusher(window.PUSHER);
  var channel = pusher.subscribe(window.CHANNEL);

  channel.bind("new-message", function(data) {
    $("#messages").append(data.content);
  });

  channel.bind("new-user", function(data) {
    $("#users").append(data.username);
  });

  $("#new_message").submit(newChatMessage);

  $('.input').keypress(function (e) {
    if (e.which == 13) {
      $("#new_message").submit(newChatMessage);
    }
  });
});

function newChatMessage(){
  $.post(
    $("#new_message").prop('action'),
    $("#new_message").serialize()
    )
  $("#message_body").val('');
	return false;
};
