// import 'dart:async';
// import 'dart:convert';
//
// import 'package:models/models.dart';
// import 'package:web_socket_channel/io.dart';
//
// abstract class CoinCapDatasource {
//   Future<Stream<Price>> streamPrice(String symbol);
// }
//
// class CoinCapDatasourceImpl extends CoinCapDatasource {
//   IOWebSocketChannel? _webSocket;
//   StreamController<Price>? _streamController;
//
//   @override
//   Future<Stream<Price>> streamPrice(String symbol) async {
//     await _webSocket?.sink.close();
//     _streamController?.close();
//     _streamController = StreamController<Price>();
//
//     try {
//       _webSocket =
//           IOWebSocketChannel.connect('wss://ws.coincap.io/prices?assets=ALL');
//       _webSocket?.stream.listen((message) {
//         final Map<String, dynamic> data = json.decode(message);
//         data.forEach((s, v) {
//           if (coinData[s] != null) {
//             num old = coinData[s]?["priceUsd"];
//             coinData[s]?["priceUsd"] = num.tryParse(v);
//             valueNotifiers[s]?.value = old;
//             print("HUYHUY - $s: $old -> $v");
//           }
//         });
//       });
//       // if (_webSocket!.readyState == WebSocket.open) {
//       //   _webSocket!.listen(
//       //     (data) {
//       //       print(data);
//       //       final priceModel = PriceModel.fromJson(symbol, data);
//       //       _streamController!.add(priceModel);
//       //     },
//       //     onDone: () => print('[+]Done :)'),
//       //     onError: (err) => print('[!]Error -- ${err.toString()}'),
//       //     cancelOnError: true,
//       //   );
//       // } else {
//       //   print('[!]Connection Denied');
//       // }
//     } catch (err) {
//       print(err);
//       await _streamController!.close();
//     }
//
//     return _streamController!.stream;
//   }
// }
