// 1. Implement calculateDelivery function using named parameters
int calculateDelivery({
  required int orderPrice,
  required int freeDeliveryLimit,
  int? deliveryFee,
}) {
  // If orderPrice >= freeDeliveryLimit, delivery is free (0)
  if (orderPrice >= freeDeliveryLimit) {
    return 0;
  }
  // Otherwise, use deliveryFee. If deliveryFee is null, use 0.
  return deliveryFee ?? 0;
}

void main() {
  Map<String, int> orders = {
    "ORD001": 40,
    "ORD002": 60,
    "ORD003": 25,
    "ORD004": 80,
  };
  int? deliveryFee = 5;
  int freeDeliveryLimit = 50;

  // 2. Iterate through each order, compute the price, and print it
  orders.forEach((orderId, orderPrice) {
    int price = calculateDelivery(
      orderPrice: orderPrice,
      freeDeliveryLimit: freeDeliveryLimit,
      deliveryFee: deliveryFee,
    );
    print('$orderId: $price');
  });
}