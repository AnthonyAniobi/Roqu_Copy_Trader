import 'package:get_it/get_it.dart';
import 'package:roqu_copy_trader/src/core/services/navigation_backstack_notifier.dart';
import 'package:roqu_copy_trader/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/presentation/cubit/tab_navigation_cubit.dart';
import 'package:roqu_copy_trader/src/features/trading/data/datasources/price_websocket_source.dart';
import 'package:roqu_copy_trader/src/features/trading/data/repositories/price_repository_impl.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/repositories/price_repository.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/usecases/get_price_stream.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/cubit/price_listing_cubit.dart';

class GetInjectionContainer {
  static final inst = GetIt.instance;

  static init() {
    // navigtion
    inst.registerLazySingleton<NavigationBackstackNotifier>(
      () => NavigationBackstackNotifier(),
    );
    inst.registerLazySingleton<TabNavigationCubit>(() => TabNavigationCubit());

    inst.registerLazySingleton<HomeCubit>(() => HomeCubit());
    inst.registerLazySingleton<PriceWebSocketSource>(
      () => PriceWebSocketSourceImpl(),
    );
    inst.registerLazySingleton<PriceRepository>(
      () => PriceRepositoryImpl(inst<PriceWebSocketSource>()),
    );
    inst.registerLazySingleton<GetPriceStream>(
      () => GetPriceStream(inst<PriceRepository>()),
    );
    inst.registerLazySingleton<PriceListingCubit>(
      () => PriceListingCubit(inst<GetPriceStream>()),
    );
  }
}
