import 'dart:convert';

import 'package:equatable/equatable.dart';

class PriceModel extends Price {
  const PriceModel(double value) : super(value);

  factory PriceModel.fromJson(
    String coin,
    String response,
  ) {
    final data = jsonDecode(response);
    return PriceModel(double.parse(data[coin] as String));
  }

  @override
  List<Object> get props => [value];
}

class Price extends Equatable {
  const Price(this.value);
  final double value;

  @override
  List<Object?> get props => [value];
}
