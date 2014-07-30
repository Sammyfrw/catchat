$(function(){
  var pusher = new Pusher(window.PUSHER);
  var channel = pusher.subscribe(window.CHANNEL);

  channel.bind("new-message", function(data) {
    $("#messages").prepend(data.content);
  });

  $("#new_message").submit(newChatMessage);
});

function newChatMessage(){
  $.post(
    $("#new_message").prop('action'),
    $("#new_message").serialize()
    )
	return false;
};
