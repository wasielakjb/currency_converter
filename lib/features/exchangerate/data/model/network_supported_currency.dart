class NetworkSupportedCurrency {
  const NetworkSupportedCurrency({
    required this.code,
    required this.name,
  });

  factory NetworkSupportedCurrency.fromList(List<dynamic> list) =>
      NetworkSupportedCurrency(
        code: list.first as String,
        name: list.last as String,
      );

  final String code;
  final String name;
}
