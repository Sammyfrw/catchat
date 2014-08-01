$(function(){
  var pusher = new Pusher(window.PUSHER);
  var channel = pusher.subscribe(window.CHANNEL);

  channel.bind("new-message", function(data) {
    console.log(data.content);
    $("#messages").append(data.content);
  });

  channel.bind("update-room-memberships", function(data) {
    console.log(data.content);
    $("#users").html(data.content);
    console.log("HTML!!!!")
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
}
