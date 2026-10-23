# IDTB110199 — WEEK 3 - PRACTICE TEST (G4)

## Submitted code (`test.dart`)

```dart
// write your classes
Class Duration {
  final int minutes;
  const Duration(this.minutes);
  Duration operator + (Duration other) {
    return Duration(minutes + other.minutes);
  }

  @override String toString() {
    return '${minutes / 60}h ${minutes % 60}min'; 
    // shouldve been return '${minutes ~/ 60}h ${minutes % 60}min'; 
    // or '${(minutes / 60).toInt()}h ${minutes % 60}min'
  }
}

Class Trip {
  final String tripId;
  final List<Duration> legs;
  final Duration transferTime;
  Trip(this.tripId, this.legs, { this.transferTime = const Duration(30), }): assert(legs.length >= 1);
  Duration getTotalDuration() {
    Duration total = const Duration(0);
    for(Duration leg in legs) {
      total = total + leg;
    }
    if(legs.length > 1) {
      total = total + Duration(transferTime.minutes * (legs.length - 1));
    }
    return total;
  }

  Duration getLongestLeg() {
    Duration longest = legs[0];
    for(Duration leg in legs) {
      if(leg.minutes > longest.minutes) {
        longest = leg;
      }
    }
    return longest;
  }

  void printTrip() {
    print("$tripId -> ${getTotalDuration()}");
  }

  void printLongestLeg() {
    print("The trip provides the longest leg\n $tripId -> ${getLongestLeg()}");
  }

  void main() {
    Trip tr1 = Trip("TR01", [const Duration(190), const Duration(40)]);
    Trip tr2 = Trip("TR02", [const Duration(345), const Duration(210), const Duration(110)], transferTime: const Duration(15));
    Trip tr3 = Trip("TR03", [const Duration(80)]);
    tr1.printTrip();
    tr2.printTrip();
    tr3.printTrip();
    tr2.printLongestLeg();
  }
} // changes: close } for Trip since i forgot to close here
```

---

# Student Evaluation

## 1. Identification

- Student ID: IDTB110199
- Exam: WEEK 3 - PRACTICE TEST (G4)
- Evaluation date: OCT 17 2026
- Final grade: 120 / 100 (bonus included: core 90 + bonus 30; maximum 130)
- Status: **Pending teacher validation**


## 2. Detailed Grading

Line references (L…) point to the submitted file `test.dart`.

The program does not compile (53 compile errors; first: `test.dart:14:12: Error: Can't find '}' to match '{'.`). As the rubric allows (syntax tolerance), the logic was graded, not the compiler.

| Criterion | Maximum | Awarded | Evidence and justification |
|---|---:|---:|---|
| 1. Duration model | 10 | 10 | L2-4: `Duration` with a `final` number of minutes and a `const` constructor. |
| 2. Duration operations | 20 | 10 | L5-7: `+` returns a new `Duration`, good. Major issue: `toString` uses `minutes / 60`, so TR01 is shown as `4.333…h 20min` instead of `4h 20min` (L9-11) → 10. |
| 3. Trip attributes | 20 | 20 | L15-17: trip ID, `List<Duration>` legs and `Duration` transfer time, all `final`. |
| 4. Trip constructor | 20 | 20 | L18: ID and legs given, `const Duration(30)` by default, and at least one leg is checked. |
| 5. Main — create instances | 20 | 20 | L49-54: the 3 trips have the right data and each line prints `TR01 -> total` (`main()` is inside the class because a `}` is missing — tolerated). |
| 6a. Total duration — sum of legs | 10 | 10 | L20-23: every leg is added with `+`, and the total is returned. |
| ⭐ Bonus 6b. Total duration — transfer time | +20 | 20 | L24-26: the transfer time is added `legs.length - 1` times. |
| ⭐ Bonus — longest leg | +10 | 10 | L30-38, L55: `getLongestLeg` returns the longest leg and `main()` prints it for TR02. |
| **Total** | **100** (+30 bonus) | **120** | Core 90 / 100 + bonus 30. |

## 3. Strengths

- Very complete solution: total with transfer count and longest leg (L19-38).
- Good use of `+` and `const` durations.

## 4. Improvements

- Use the integer division in the display: `${minutes ~/ 60}h` (with `/` the hours are a decimal).
- Close the `Trip` class with `}` before `main()`.
