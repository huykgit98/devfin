part of 'explore_bloc.dart';

enum ExploreStatus { initial, loading, success, failure }

final class ExploreState extends Equatable {
  const ExploreState({
    this.status = ExploreStatus.initial,
    this.prices = const [],
  });

  final ExploreStatus status;
  final List<Price> prices;

  @override
  List<Object> get props => [
        status,
        prices,
      ];

  ExploreState copyWith({
    ExploreStatus? status,
    List<Price> Function()? prices,
  }) {
    return ExploreState(
      status: status ?? this.status,
      prices: prices != null ? prices() : this.prices,
    );
  }
}
