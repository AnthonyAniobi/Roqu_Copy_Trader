class TraderListingEntity {
  final String name;
  final int followers;
  final double roi;
  final double winRate;
  final double totalProfit;
  final List<double> portfolioGrowth;

  String get initials => name.isNotEmpty
      ? name.trim().split(' ').map((e) => e[0]).take(2).join()
      : '';

  String get roiString => '${roi > 0 ? '+' : '-'}${roi.toStringAsFixed(2)}%';

  TraderListingEntity({
    required this.name,
    required this.followers,
    required this.roi,
    required this.winRate,
    required this.totalProfit,
    required this.portfolioGrowth,
  });

  static TraderListingEntity get mock => TraderListingEntity(
    name: 'John Doe',
    followers: 1200,
    roi: 120.42,
    winRate: 75.0,
    totalProfit: 2500.0,
    portfolioGrowth: [
      00.0,
      10.5,
      42.4,
      41.1,
      23.7,
      39.8,
      27.5,
      48.9,
      55.6,
      94.3,
      103.0,
      80.9,
      65.1,
      79.8,
      92.5,
      70.2,
      65.7,
      24.9,
      23.0,
      76.4,
    ],
  );
}
