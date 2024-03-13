part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

final class ExploreSubscriptionRequested extends ExploreEvent {
  const ExploreSubscriptionRequested();
}
