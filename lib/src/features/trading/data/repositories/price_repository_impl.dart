import 'package:roqu_copy_trader/src/features/trading/data/datasources/price_websocket_source.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/entities/price_entity.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/repositories/price_repository.dart';

class PriceRepositoryImpl implements PriceRepository {
  final PriceWebSocketSource source;
  PriceRepositoryImpl(this.source);

  @override
  Stream<PriceEntity> getPriceStream(List<String> symbols) {
    return source.connect(symbols);
  }
}
