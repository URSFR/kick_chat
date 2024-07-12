import 'package:web_socket_channel/html.dart';

class PlatformWebSocketChannel {
  static HtmlWebSocketChannel connect(String url) {
    return HtmlWebSocketChannel.connect(url);
  }
}