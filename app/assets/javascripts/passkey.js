$(function(){
  $(".passkey").submit(passkey)
  console.log("GOODBYE")
  });

function passkey() {
  console.log("HELLO")
  var round = 1;
  var passkeyPrompt = prompt(window.CHATROOM);
  while (round < 3) {
    if (passkeyPrompt.toLowerCase() == window.PASSKEY) {
      window.open(window.PATH);
      break;
    }
    else {
      round+=1;
      var passkeyPrompt = prompt('Password Incorrect, Please Try Again.');
    };
  };
};
