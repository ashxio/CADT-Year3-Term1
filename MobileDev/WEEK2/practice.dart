class Person {
  String firstName;
  String lastName;
  Person(this.firstName, this.lastName);

  String getFullname() {
    return '$firstName $lastName';
  }

  String get fullName => '$firstName $lastName';
}

class Point {
  int x;
  int y;

  Point({required this.x, required this.y});

  void translate(int dx, int dy) {
    x += dx;
    y += dy;
  }

  @override
  String toString() {
    return '$x $y';
  }
}

void main() {
  Person p1 = Person('tyty', 'chey');
  p1.lastName = 'da best';
  print(p1.getFullname());
  Person p2 = Person('omra', 'lame');
  print(p2.fullName);

  Point p = Point(x: 10, y: 15);
  p.translate(100, 200);
  print(p);
}