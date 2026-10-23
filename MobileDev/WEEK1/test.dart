// 1. Implement calculateFinalPrice function
int calculateFinalPrice(int price, [int? fee]) {
  // If fee is null, treat it as 0
  int actualFee = fee ?? 0; 
  return price + actualFee;
}

// 2. Process orders in the main function
void main() {
  List<int> prices = [100, 200, 300, 400];
  List<int?> fees = [5, null, 10, null];

  // For each order, compute the final price with your function and print it
  for (int i = 0; i < prices.length; i++) {
    int finalPrice = calculateFinalPrice(prices[i], fees[i]);
    print('Order ${i + 1}: $finalPrice');
  }
}
