import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'json_map.dart';

part 'price.g.dart';

@immutable
@JsonSerializable()
class Price extends Equatable {
  Price({
    required this.value,
    required this.symbol,
  });

  final double value;
  final String symbol;

  Price copyWith({double? value, String? symbol}) {
    return Price(
      value: value ?? this.value,
      symbol: symbol ?? this.symbol,
    );
  }

  static Price fromJson(JsonMap json) => _$PriceFromJson(json);

  JsonMap toJson() => _$PriceToJson(this);

  @override
  List<Object> get props => [
        symbol,
        value,
      ];
}
