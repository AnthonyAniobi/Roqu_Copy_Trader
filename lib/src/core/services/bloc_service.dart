import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roqu_copy_trader/src/core/services/get_injection_container.dart';
import 'package:roqu_copy_trader/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:roqu_copy_trader/src/features/tab_navigation/presentation/cubit/tab_navigation_cubit.dart';
import 'package:roqu_copy_trader/src/features/trading/presentation/cubit/price_listing_cubit.dart';

class BlocService {
  static get providers => [
    //
    BlocProvider(
      create: (context) => GetInjectionContainer.inst<TabNavigationCubit>(),
    ),
    BlocProvider(create: (context) => GetInjectionContainer.inst<HomeCubit>()),

    BlocProvider(
      create: (context) => GetInjectionContainer.inst<PriceListingCubit>(),
    ),
  ];
}
