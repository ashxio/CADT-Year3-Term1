// you function
double calculateBonus({
  required double salary,
  required double sales,
  double bonusRate = 5,
}) {
  return (sales >= 5000 ? salary * (bonusRate / 100) : 0);
}

void main() {
  List<int> salaries = [1000, 1500, 1200, 2000];
  List<int> sales = [6000, 3000, 7000, 4500];

  int bonusRate = 10;

  // For each employee, calculate the bonus and print it.
  for (int i = 0; i < salaries.length; i++) {
    double bonus = calculateBonus(
      salary: salaries[i].toDouble(),
      sales: sales[i].toDouble(),
      bonusRate: bonusRate.toDouble(),
    );
    print('Employee ${i + 1}: ${bonus.toInt()}');
  }
}
