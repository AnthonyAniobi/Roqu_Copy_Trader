import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/usecases/get_price_stream.dart';

class TradingCubit extends Cubit<TradingState> {
  final GetPriceStream getPriceStream;

  TradingCubit(this.getPriceStream) : super(TradingState());
}

class TradingState extends Equatable {
  const TradingState();

  @override
  List<Object> get props => [];
}
