import 'package:web_socket_channel/io.dart';

class PlatformWebSocketChannel {
  static IOWebSocketChannel connect(String url) {
    return IOWebSocketChannel.connect(url);
  }
}