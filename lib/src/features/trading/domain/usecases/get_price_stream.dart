import 'package:roqu_copy_trader/src/features/trading/domain/entities/price_entity.dart';
import 'package:roqu_copy_trader/src/features/trading/domain/repositories/price_repository.dart';

class GetPriceStream {
  final PriceRepository repository;
  GetPriceStream(this.repository);

  Stream<PriceEntity> call(List<String> symbols) {
    return repository.getPriceStream(symbols);
  }
}
