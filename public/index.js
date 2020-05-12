$(document).ready(function () {
  connect();
});

function connect() {
  url = `ws://${location.host}/`;
  ws = new WebSocket(url);

  ws.onopen = function () {
    console.log(`Connected to socket ${url}`);
  }

  ws.onclose = function (e) {
    console.log(
      "Socket is closed. Reconnect will be attempted in 1 second.",
      e.reason
    );
    setTimeout(function () {
      connect();
    }, 1000);
  };

  ws.onmessage = function (e) {
    $('#ping').append(`<p>${e.data}</p>`)
    console.log(e.data);
  }
}
