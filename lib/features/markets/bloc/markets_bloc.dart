import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_repository/crypto_repository.dart';
import 'package:equatable/equatable.dart';

part 'markets_event.dart';
part 'markets_state.dart';

class MarketsBloc extends Bloc<MarketsEvent, MarketsState> {
  MarketsBloc({
    required CryptoRepository cryptoRepository,
  })  : _cryptosRepository = cryptoRepository,
        super(const MarketsState()) {
    on<MarketsSubscriptionRequested>(_onSubscriptionRequested);
  }

  final CryptoRepository _cryptosRepository;

  Future<void> _onSubscriptionRequested(
    MarketsSubscriptionRequested event,
    Emitter<MarketsState> emit,
  ) async {
    emit(state.copyWith(status: MarketsStatus.loading));

    await emit.forEach<List<Price>>(
      _cryptosRepository.getPrices(),
      onData: (prices) => state.copyWith(
        status: MarketsStatus.success,
        prices: () => prices,
      ),
      onError: (_, __) => state.copyWith(status: MarketsStatus.failure),
    );
  }
}
