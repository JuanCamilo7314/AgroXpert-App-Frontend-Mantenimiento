
String percent(double value, double total) {
  double result = (value / total) * 100;
  return result.toStringAsFixed(2);
}