import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WsService {
  static late WebSocketChannel socket;
  //initialize websocket
  //connect to server
  //listen to messages
  //send messages
  //close channel
  //handle errors
  //ready channel

  static initializeWS() {
    final url = 'ws://bravo22.salamride.ca/message';
    socket = WebSocketChannel.connect(Uri.parse(url));

    // socket.stream.listen((message) {
    //   // handle incoming messages
    // });
    // socket.sink.add('Hello, server!');
    // socket.sink.close();
    // socket.sink.add('Goodbye, server!');
    // socket.sink.close();
  }

  static readyChennel() async {
    await socket.ready;
  }

  static closeChannel() {
    socket.sink.close(status.goingAway);
  }

  static sendMessage(String message) {
    socket.sink.add(message);
  }

  static openStreamWs() {
    readyChennel();
    socket.stream.listen((message) {
      sendMessage("Hello Farah");
      print("Message Received: $message");
    });

    closeChannel();
    // if(message['receiveMessages'])
  }
}

  // handleErrors() {
  //   socket.stream.listen((message) {
  //     // handle incoming messages
  //   });
  // }

  // closeChannel() {
  //   socket.sink.close();
  // }

