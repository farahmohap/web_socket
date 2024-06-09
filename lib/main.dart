import 'package:flutter/material.dart';
import 'package:we_socket/ws_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  WsService.initializeWS();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
          // channel: IOWebSocketChannel.connect("ws://echo.websocket.org"),
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //final WebSocketChannel channel;
  // final _channel = WebSocketChannel.connect(
  //   Uri.parse('ws://example.com/chat'),
  // );
  initState() {
    WsService.openStreamWs();
  }

  const MyHomePage({
    super.key,
  });

  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web Socket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: "Send any message"),
                controller: editingController,
              ),
            )
            // StreamBuilder(
            //   stream: widget.channel.stream,
            //   builder: (context, snapshot) {
            //     return Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
            //     );
            //   },
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: WsService.openStreamWs(),
        child: const Icon(Icons.send),
      ),
    );
  }

  // void _sendMyMessage() {
  //   if (editingController.text.isNotEmpty) {
  //     widget.channel.sink.add(editingController.text);
  //   }
  // }

  // @override
  // void dispose() {
  //   widget.channel.sink.close();
  //   super.dispose();
  // }
}
