part of 'markets_bloc.dart';

sealed class MarketsEvent extends Equatable {
  const MarketsEvent();

  @override
  List<Object> get props => [];
}

final class MarketsSubscriptionRequested extends MarketsEvent {
  const MarketsSubscriptionRequested();
}
