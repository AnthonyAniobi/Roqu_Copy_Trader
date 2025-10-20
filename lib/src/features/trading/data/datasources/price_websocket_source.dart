import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:roqu_copy_trader/src/core/models/app_responses.dart';
import 'package:roqu_copy_trader/src/features/trading/data/models/price_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class PriceWebSocketSource {
  Stream<PriceModel> connect(List<String> symbols);
  void disconnect();
}

class PriceWebSocketSourceImpl implements PriceWebSocketSource {
  WebSocketChannel? _channel;
  final WebSocketChannel Function(Uri)? _channelFactory;

  PriceWebSocketSourceImpl({WebSocketChannel Function(Uri)? channelFactory})
    : _channelFactory = channelFactory;

  @override
  Stream<PriceModel> connect(List<String> symbols) {
    final uri = Uri.parse('wss://ws.twelvedata.com/v1/quotes/price');

    _channel = _channelFactory?.call(uri) ?? WebSocketChannel.connect(uri);

    _channel!.sink.add(
      jsonEncode({
        "action": "subscribe",
        "params": {
          "symbols": symbols.join(','),
          "apikey": dotenv.env['TWELVE_DATA_API_KEY'],
        },
      }),
    );

    return _channel!.stream.map((event) {
      final data = jsonDecode(event);
      if (data['event'] == 'price') {
        return PriceModel.fromJson(data);
      }
      throw const AppError('Unexpected data format');
    });
  }

  @override
  void disconnect() {
    _channel?.sink.close();
  }
}
