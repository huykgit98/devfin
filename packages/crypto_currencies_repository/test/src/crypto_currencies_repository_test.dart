// ignore_for_file: prefer_const_constructors

import 'package:crypto_currencies_repository/crypto_currencies_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CryptoCurrenciesRepository', () {
    test('can be instantiated', () {
      expect(CryptoCurrenciesRepository(), isNotNull);
    });
  });
}
