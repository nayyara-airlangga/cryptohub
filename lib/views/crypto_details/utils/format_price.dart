String formatPrice(String priceData) {
  final formattedPrice = double.parse(priceData).toStringAsFixed(3);
  return formattedPrice;
}
