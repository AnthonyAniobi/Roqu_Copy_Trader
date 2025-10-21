import 'package:roqu_copy_trader/src/features/trading/domain/entities/price_entity.dart';

class PriceModel extends PriceEntity {
  const PriceModel({
    required super.symbol,
    required super.price,
    required super.time,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      symbol: json['symbol'] ?? '',
      price: (num.tryParse(json['price'].toString()) ?? 0).toDouble(),
      time: DateTime.fromMillisecondsSinceEpoch(
        (json['timestamp'] ?? 0) * 1000,
      ),
    );
  }
}
