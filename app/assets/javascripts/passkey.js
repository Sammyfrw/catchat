$(function(){
  $(".enter-chatroom").submit(validatePasskey)
});

function validatePasskey() {
  var round = 1;
  var passkeyPrompt = prompt(window.PASSKEY_PROMPT);
  while (round <=  3) {
    if (passkeyPrompt.toLowerCase() == window.PASSKEY) {
      window.open(window.PATH);
      break;
    }
    else {
      round += 1;
      var passkeyPrompt = prompt('Password Incorrect, Please Try Again.');
    };
  };
};
