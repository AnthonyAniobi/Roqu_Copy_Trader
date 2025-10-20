import 'package:equatable/equatable.dart';

class PriceEntity extends Equatable {
  final String symbol;
  final double price;
  final DateTime time;

  const PriceEntity({
    required this.symbol,
    required this.price,
    required this.time,
  });

  @override
  List<Object?> get props => [symbol, price, time];
}
