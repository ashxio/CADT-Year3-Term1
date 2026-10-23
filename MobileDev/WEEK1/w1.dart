// you function
num calculateTicketPrice({
  required int age,
  required int ticketPrice,
  int? snack,
}) {

  // int finalTicketPrice = ticketPrice;

  // if (age < 12) {
  //   finalTicketPrice = (ticketPrice / 2).toInt();
  // }


  return (age < 12 ? ticketPrice/2 : ticketPrice) + (snack ?? 0);
}

void main() {
  List<Map<String, dynamic>> tickets = [
    {"age": 10, "ticketPrice": 8, "snack": 3},
    {"age": 18, "ticketPrice": 10, "snack": null},
    {"age": 12, "ticketPrice": 8, "snack": 2},
    {"age": 25, "ticketPrice": 10, "snack": null},
  ];

  // For each ticket, calculate the final price and print it.
  for (Map n in tickets) {
    print(
      calculateTicketPrice(
        age: n["age"] as int,
        ticketPrice: n["ticketPrice"] as int,
        snack: n["snack"] as int?,
      ),
    );
  }
}
