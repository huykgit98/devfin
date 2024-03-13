part of 'markets_bloc.dart';

enum MarketsStatus { initial, loading, success, failure }

final class MarketsState extends Equatable {
  const MarketsState({
    this.status = MarketsStatus.initial,
    this.prices = const [],
  });

  final MarketsStatus status;
  final List<Price> prices;

  @override
  List<Object> get props => [
        status,
        prices,
      ];

  MarketsState copyWith({
    MarketsStatus? status,
    List<Price> Function()? prices,
  }) {
    return MarketsState(
      status: status ?? this.status,
      prices: prices != null ? prices() : this.prices,
    );
  }
}
