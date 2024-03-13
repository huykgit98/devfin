import 'package:coincap_api/coincap_api.dart';

class CryptoRepository {
  const CryptoRepository({
    required CoincapApi coincapApi,
  }) : _coincapApi = coincapApi;

  final CoincapApi _coincapApi;

  Stream<List<Price>> getPrices() => _coincapApi.streamPrices();
}
