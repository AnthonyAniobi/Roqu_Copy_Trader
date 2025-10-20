import 'package:get_it/get_it.dart';
import 'package:roqu_copy_trader/src/core/services/navigation_backstack_notifier.dart';
import 'package:roqu_copy_trader/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/presentation/cubit/tab_navigation_cubit.dart';

class GetInjectionContainer {
  static final inst = GetIt.instance;

  static init() {
    // navigtion
    inst.registerLazySingleton<NavigationBackstackNotifier>(
      () => NavigationBackstackNotifier(),
    );
    inst.registerLazySingleton<TabNavigationCubit>(() => TabNavigationCubit());

    inst.registerLazySingleton<HomeCubit>(() => HomeCubit());
  }
}
