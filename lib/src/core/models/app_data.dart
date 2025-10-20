class AppData {
  static const _installDateKey = 'installDate';
  static const _hideDateKey = 'hideDate';

  final DateTime installDate;
  final DateTime? setHideDate;

  const AppData({
    required this.installDate,
    required this.setHideDate,
  });

  factory AppData.fromJson(Map<String, dynamic> json) {
    return AppData(
      installDate: json[_installDateKey],
      setHideDate: json[_hideDateKey],
    );
  }

  Map<String, dynamic> toJson() => {
        _installDateKey: installDate,
        if (setHideDate != null) _hideDateKey: setHideDate,
      };
}
