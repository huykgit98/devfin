import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

import 'exceptions/exceptions.dart';
import 'models/models.dart';

abstract class CoincapApi {
  Stream<List<Price>> streamPrices();
}

class CoincapApiImpl implements CoincapApi {
  IOWebSocketChannel? _webSocketChannel;
  StreamController<List<Price>>? _pricesStreamController;

  @override
  Stream<List<Price>> streamPrices() {
    _pricesStreamController?.close();
    _pricesStreamController = BehaviorSubject<List<Price>>.seeded(const []);

    connect();

    return _pricesStreamController!.stream;
  }

  void connect() {
    try {
      _webSocketChannel = IOWebSocketChannel.connect(
          'wss://ws.coincap.io/prices?assets=bitcoin,cardano,gala');

      _webSocketChannel!.stream.handleError((error) {
        print('[!]Error -- ${error.toString()}');
        // Attempt to reconnect after a delay
        Future.delayed(const Duration(seconds: 5), () => connect());
      }).listen(
        // (message) {
        //   if (message != null) {
        //     final prices = List<Map<dynamic, dynamic>>.from(
        //       json.decode(message) as List,
        //     )
        //         .map((jsonMap) =>
        //             Price.fromJson(Map<String, dynamic>.from(jsonMap)))
        //         .toList();
        //     _pricesStreamController?.add(prices);
        //   } else {
        //     _pricesStreamController?.add(const []);
        //   }
        // },
        (message) {
          if (message != null) {
            final decodedMessage = json.decode(message);
            if (decodedMessage is Map<String, dynamic>) {
              final prices = decodedMessage.entries.map((entry) {
                return Price(
                  symbol: entry.key,
                  value: double.tryParse(entry.value.toString()) ?? 0.0,
                );
              }).toList();
              _pricesStreamController?.add(prices);
            } else {
              _pricesStreamController?.add(const []);
            }
          }
        },
        onDone: () => print('[+]Done :)'),
        cancelOnError: false,
      );
    } catch (err) {
      print(err);
      _pricesStreamController!.close();
      throw ServerException();
    }
  }
}
