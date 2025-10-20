import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:roqu_copy_trader/src/core/enums/load_status_enum.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/entities/price_entity.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/usecases/get_price_stream.dart';

class PriceListingCubit extends Cubit<PriceListingState> {
  final GetPriceStream getPriceStream;
  StreamSubscription<PriceEntity>? _subscription;

  PriceListingCubit(this.getPriceStream) : super(PriceListingState());

  Future<void> subscribe() async {
    _subscription?.cancel();
    emit(state.copyWith(loadStatus: LoadStatusEnum.loading));
    final symbols = ["BTC/USD", "ETH/USD", "DOGE/USD", "LTC/USD", "THETA/USD"];
    _subscription = getPriceStream(symbols).listen(
      (price) => _updatePrice(price),
      onError: (e) => _priceError(e.toString()),
      cancelOnError: false,
    );
  }

  void _updatePrice(PriceEntity price) {
    emit(state.copyWith(loadStatus: LoadStatusEnum.success));
  }

  void _priceError(String message) {
    emit(state.copyWith(loadStatus: LoadStatusEnum.failed));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

class PriceListingState extends Equatable {
  final LoadStatusEnum loadStatus;
  const PriceListingState({this.loadStatus = LoadStatusEnum.initial});

  PriceListingState copyWith({LoadStatusEnum? loadStatus}) {
    return PriceListingState(loadStatus: loadStatus ?? this.loadStatus);
  }

  @override
  List<Object> get props => [loadStatus];
}
