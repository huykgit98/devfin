import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_repository/crypto_repository.dart';
import 'package:equatable/equatable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc({
    required CryptoRepository cryptoRepository,
  })  : _cryptosRepository = cryptoRepository,
        super(const ExploreState()) {
    on<ExploreSubscriptionRequested>(_onSubscriptionRequested);
  }

  final CryptoRepository _cryptosRepository;

  Future<void> _onSubscriptionRequested(
    ExploreSubscriptionRequested event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(status: ExploreStatus.loading));

    await emit.forEach<List<Price>>(
      _cryptosRepository.getPrices(),
      onData: (prices) => state.copyWith(
        status: ExploreStatus.success,
        prices: () => prices,
      ),
      onError: (_, __) => state.copyWith(status: ExploreStatus.failure),
    );
  }
}
