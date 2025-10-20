import 'package:roqu_copy_trader/src/features/trading/domain/entities/price_entity.dart';

abstract class PriceRepository {
  Stream<PriceEntity> getPriceStream(List<String> symbols);
}
