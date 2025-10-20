enum LoadStatusEnum {
  initial,
  loading,
  success,
  failed;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isLoadingOrInitial => this == loading || this == initial;
  bool get isSuccess => this == success;
  bool get isFailed => this == failed;
}
