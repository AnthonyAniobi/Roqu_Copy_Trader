import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/entities/price_entity.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/usecases/get_price_stream.dart';

class TradingCubit extends Cubit<TradingState> {
  final GetPriceStream getPriceStream;
  StreamSubscription<List<PriceEntity>>? _subscription;

  TradingCubit(this.getPriceStream) : super(TradingInitial());

  void _onSubscribe(SubscribeToPrice event, Emitter<PriceState> emit) {
    _subscription?.cancel();
    emit(PriceLoading());

    _subscription = getPriceStream(event.symbol).listen(
      (price) => add(PriceUpdated(price)),
      onError: (e) => add(PriceError(e.toString())),
      cancelOnError: false,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

class TradingState extends Equatable {
  const TradingState();

  @override
  List<Object> get props => [];
}
