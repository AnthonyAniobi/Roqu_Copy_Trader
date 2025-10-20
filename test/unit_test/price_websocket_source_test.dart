import 'dart:async';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:roqu_copy_trader/src/core/models/app_responses.dart';
import 'package:roqu_copy_trader/src/features/trading/data/datasources/price_websocket_source.dart';
import 'package:roqu_copy_trader/src/features/trading/data/models/price_model.dart';

void main() {
  group('PriceWebSocketSource Tests', () {
    late TestPriceWebSocketSource dataSource;

    setUp(() {
      dataSource = TestPriceWebSocketSource();
    });

    tearDown(() {
      dataSource.dispose();
    });

    group('Connection Tests', () {
      test('should create stream and send subscription message', () {
        const symbols = ['AAPL', 'GOOGL', 'MSFT'];

        final stream = dataSource.connect(symbols);

        expect(stream, isA<Stream<PriceModel>>());
        expect(dataSource.sentMessages, hasLength(1));

        final sentMessage = jsonDecode(dataSource.sentMessages.first);
        expect(sentMessage['action'], 'subscribe');
        expect(sentMessage['params']['symbols'], 'AAPL,GOOGL,MSFT');
        expect(sentMessage['params']['apikey'], isNull);
      });

      test('should handle empty symbols list', () {
        const symbols = <String>[];

        final stream = dataSource.connect(symbols);

        expect(stream, isA<Stream<PriceModel>>());
        expect(dataSource.sentMessages, hasLength(1));

        final sentMessage = jsonDecode(dataSource.sentMessages.first);
        expect(sentMessage['params']['symbols'], '');
      });

      test('should handle large number of symbols', () {
        final symbols = List.generate(100, (index) => 'SYMBOL$index');

        final stream = dataSource.connect(symbols);

        expect(stream, isA<Stream<PriceModel>>());
        expect(dataSource.sentMessages, hasLength(1));

        final sentMessage = jsonDecode(dataSource.sentMessages.first);
        final symbolsString = sentMessage['params']['symbols'] as String;
        expect(symbolsString.split(','), hasLength(100));
        expect(symbolsString, contains('SYMBOL0'));
        expect(symbolsString, contains('SYMBOL99'));
      });
    });

    group('Data Processing Tests', () {
      test('should transform valid price data correctly', () async {
        const symbols = ['AAPL'];
        final validPriceData = {
          'event': 'price',
          'symbol': 'AAPL',
          'price': '150.25',
          'timestamp': 1634567890,
        };

        final stream = dataSource.connect(symbols);
        final streamFuture = stream.first;
        dataSource.simulateReceiveData(jsonEncode(validPriceData));

        final result = await streamFuture;
        expect(result.symbol, 'AAPL');
        expect(result.price, 150.25);
        expect(
          result.time,
          DateTime.fromMillisecondsSinceEpoch(1634567890 * 1000),
        );
      });

      test('should handle multiple price updates', () async {
        const symbols = ['AAPL', 'GOOGL'];
        final priceUpdates = [
          {
            'event': 'price',
            'symbol': 'AAPL',
            'price': '150.25',
            'timestamp': 1634567890,
          },
          {
            'event': 'price',
            'symbol': 'GOOGL',
            'price': '2800.50',
            'timestamp': 1634567891,
          },
        ];

        final stream = dataSource.connect(symbols);
        final results = <PriceModel>[];
        final subscription = stream.listen((price) => results.add(price));

        for (final update in priceUpdates) {
          dataSource.simulateReceiveData(jsonEncode(update));
        }

        await Future.delayed(const Duration(milliseconds: 50));
        await subscription.cancel();

        expect(results, hasLength(2));
        expect(results[0].symbol, 'AAPL');
        expect(results[0].price, 150.25);
        expect(results[1].symbol, 'GOOGL');
        expect(results[1].price, 2800.50);
      });

      test('should handle price data with missing fields', () async {
        const symbols = ['AAPL'];
        final incompleteData = {
          'event': 'price',
          'symbol': 'AAPL',
          // Missing price and timestamp
        };

        final stream = dataSource.connect(symbols);
        final streamFuture = stream.first;
        dataSource.simulateReceiveData(jsonEncode(incompleteData));

        final result = await streamFuture;
        expect(result.symbol, 'AAPL');
        expect(result.price, 0.0);
        expect(result.time, DateTime.fromMillisecondsSinceEpoch(0));
      });
    });

    group('Error Handling Tests', () {
      test('should emit AppError for non-price events', () async {
        const symbols = ['AAPL'];
        final invalidData = {
          'event': 'heartbeat',
          'message': 'Connection alive',
        };

        final stream = dataSource.connect(symbols);
        final streamFuture = stream.first;
        dataSource.simulateReceiveData(jsonEncode(invalidData));

        try {
          await streamFuture;
          fail('Expected an AppError to be thrown');
        } catch (e) {
          expect(e, isA<AppError>());
          expect((e as AppError).message, 'Unexpected data format');
        }
      });

      test('should handle malformed JSON', () async {
        const symbols = ['AAPL'];

        final stream = dataSource.connect(symbols);
        final streamFuture = stream.first;
        dataSource.simulateReceiveData('invalid-json');

        try {
          await streamFuture;
          fail('Expected a FormatException to be thrown');
        } catch (e) {
          expect(e, isA<FormatException>());
        }
      });

      test('should handle stream errors', () async {
        const symbols = ['AAPL'];

        final stream = dataSource.connect(symbols);
        final streamFuture = stream.first;
        dataSource.simulateError(Exception('Connection failed'));

        try {
          await streamFuture;
          fail('Expected an Exception to be thrown');
        } catch (e) {
          expect(e, isA<Exception>());
          expect(e.toString(), contains('Connection failed'));
        }
      });

      test('should handle null price values gracefully', () async {
        const symbols = ['AAPL'];
        final dataWithNullPrice = {
          'event': 'price',
          'symbol': 'AAPL',
          'price': null,
          'timestamp': 1634567890,
        };

        final stream = dataSource.connect(symbols);
        final streamFuture = stream.first;
        dataSource.simulateReceiveData(jsonEncode(dataWithNullPrice));

        final result = await streamFuture;
        expect(result.price, 0.0);
      });

      test('should handle missing symbol field', () async {
        const symbols = ['AAPL'];
        final dataWithoutSymbol = {
          'event': 'price',
          'price': '150.25',
          'timestamp': 1634567890,
        };

        final stream = dataSource.connect(symbols);
        final streamFuture = stream.first;
        dataSource.simulateReceiveData(jsonEncode(dataWithoutSymbol));

        final result = await streamFuture;
        expect(result.symbol, '');
      });
    });

    group('Connection Management Tests', () {
      test('should close websocket connection on disconnect', () {
        const symbols = ['AAPL'];
        dataSource.connect(symbols);

        dataSource.disconnect();

        expect(dataSource.sinkClosed, isTrue);
      });

      test('should handle disconnect when no connection exists', () {
        expect(() => dataSource.disconnect(), returnsNormally);
      });

      test('should handle reconnection after disconnect', () {
        const symbols = ['AAPL'];

        final stream1 = dataSource.connect(symbols);
        expect(stream1, isA<Stream<PriceModel>>());
        expect(dataSource.connectionCount, 1);

        // Disconnect
        dataSource.disconnect();
        expect(dataSource.sinkClosed, isTrue);

        // Reset for reconnection
        dataSource.sinkClosed = false;

        // Reconnect
        final stream2 = dataSource.connect(symbols);
        expect(stream2, isA<Stream<PriceModel>>());
        expect(dataSource.connectionCount, 2);
      });
    });

    group('Message Format Validation Tests', () {
      test('should send correct subscription format', () {
        const symbols = ['AAPL', 'GOOGL'];

        dataSource.connect(symbols);

        expect(dataSource.sentMessages, hasLength(1));
        final message = jsonDecode(dataSource.sentMessages.first);

        expect(message, containsPair('action', 'subscribe'));
        expect(message['params'], isA<Map<String, dynamic>>());
        expect(message['params']['symbols'], 'AAPL,GOOGL');
        expect(message['params'].keys, contains('apikey'));
      });

      test('should validate required websocket message structure', () {
        const symbols = ['TEST'];

        dataSource.connect(symbols);

        final message = jsonDecode(dataSource.sentMessages.first);

        // Check required fields
        expect(message.keys, containsAll(['action', 'params']));
        expect(message['params'].keys, containsAll(['symbols', 'apikey']));
      });
    });

    group('Performance Tests', () {
      test('should handle rapid consecutive messages', () async {
        const symbols = ['AAPL'];
        final rapidMessages = List.generate(
          20,
          (index) => {
            'event': 'price',
            'symbol': 'AAPL',
            'price': '${150.0 + index}',
            'timestamp': 1634567890 + index,
          },
        );

        final stream = dataSource.connect(symbols);
        final results = <PriceModel>[];
        final subscription = stream.listen((price) => results.add(price));

        for (final message in rapidMessages) {
          dataSource.simulateReceiveData(jsonEncode(message));
        }

        await Future.delayed(const Duration(milliseconds: 100));
        await subscription.cancel();

        expect(results, hasLength(20));
        expect(results.first.price, 150.0);
        expect(results.last.price, 169.0);
      });

      test('should handle different price formats', () async {
        const symbols = ['TEST'];
        final testCases = [
          {
            'data': {
              'event': 'price',
              'symbol': 'AAPL',
              'price': '150.25',
              'timestamp': 1634567890,
            },
            'expectedPrice': 150.25,
          },
          {
            'data': {
              'event': 'price',
              'symbol': 'GOOGL',
              'price': '2800',
              'timestamp': 1634567891,
            },
            'expectedPrice': 2800.0,
          },
          {
            'data': {
              'event': 'price',
              'symbol': 'MSFT',
              'price': null,
              'timestamp': 1634567892,
            },
            'expectedPrice': 0.0,
          },
        ];

        final stream = dataSource.connect(symbols);
        final results = <PriceModel>[];
        final subscription = stream.listen((price) => results.add(price));

        for (final testCase in testCases) {
          dataSource.simulateReceiveData(jsonEncode(testCase['data']));
        }

        await Future.delayed(const Duration(milliseconds: 50));
        await subscription.cancel();

        expect(results, hasLength(3));
        expect(results[0].price, testCases[0]['expectedPrice']);
        expect(results[1].price, testCases[1]['expectedPrice']);
        expect(results[2].price, testCases[2]['expectedPrice']);
      });
    });
  });
}

/// Test implementation of PriceWebSocketSource for testing
class TestPriceWebSocketSource extends PriceWebSocketSource {
  final List<String> sentMessages = [];
  final StreamController<dynamic> _streamController =
      StreamController.broadcast();
  bool sinkClosed = false;
  int connectionCount = 0;

  @override
  Stream<PriceModel> connect(List<String> symbols) {
    connectionCount++;
    final subscriptionMessage = jsonEncode({
      "action": "subscribe",
      "params": {"symbols": symbols.join(','), "apikey": null},
    });
    sentMessages.add(subscriptionMessage);

    return _streamController.stream.map((event) {
      final data = jsonDecode(event);
      if (data['event'] == 'price') {
        return PriceModel.fromJson(data);
      }
      throw const AppError('Unexpected data format');
    });
  }

  @override
  void disconnect() {
    sinkClosed = true;
  }

  /// I'll use this to simulate receiving data from the websocket
  void simulateReceiveData(String data) {
    _streamController.add(data);
  }

  /// and this for error message
  void simulateError(Object error) {
    _streamController.addError(error);
  }

  /// dispose the stream controller
  void dispose() {
    if (!_streamController.isClosed) {
      _streamController.close();
    }
  }
}
