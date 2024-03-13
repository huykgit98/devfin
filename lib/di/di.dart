import 'package:coincap_api/coincap_api.dart';
import 'package:crypto_repository/crypto_repository.dart';
import 'package:devfin/features/explore/explore.dart';
import 'package:devfin/features/markets/markets.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt
    ..registerFactory(
      () => ExploreBloc(
        cryptoRepository: CryptoRepository(coincapApi: CoincapApiImpl()),
      ),
    )
    ..registerFactory(
      () => MarketsBloc(
        cryptoRepository: CryptoRepository(coincapApi: CoincapApiImpl()),
      ),
    );
}
