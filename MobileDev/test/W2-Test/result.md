# IDTB110199

Final grade: **100 / 100** (teacher approved)

## Submitted code (`test.dart`)

```dart
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
```

## Evaluation

## Student Evaluation

### 1. Identification

- Student ID: IDTB110199 — G4 student who took the G1 exam
- Exam: WEEK 2 - PRACTICE TEST
- Evaluation date: OCT 11 2026
- Final grade: 100 / 100
- Status: **Teacher approved**


### 2. Detailed Grading

Line references (L…) point to the submitted file (`test.dart`).

| Criterion | Maximum | Awarded | Evidence and justification |
|---|---:|---:|---|
| 1. Function definition | 25 | 25 | L2-6: Correct name, appropriate types, optional `bonusRate` with default `5`. (`double`, named) |
| 2. Bonus calculation | 25 | 25 | L7: `sales >= 5000` check, `salary * bonusRate / 100`, else `0`. Bonuses correct. |
| 3. Employee iteration | 25 | 25 | L17: Loops over all 4 employees; salary and sales matched by index. |
| 4. Function call and output | 25 | 25 | L18-23: Passes `bonusRate: bonusRate` (10). Output matches exactly. |
| **Total** | **100** | **100** | |

### 3. Strengths

- Complete and correct solution; output matches exactly.
- Concise conditional expression for the bonus.
- Clean conversion `bonus.toInt()` for printing.

### 4. Improvements

- `int` parameters would avoid the `.toDouble()` conversions at the call site (L19-21).
