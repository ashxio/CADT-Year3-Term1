class Point {
  int x;
  int y;

  Point({required this.x, required this.y});

  @override
  String toString() {
    return "Point x= $x, y=$y";
  }

  void translate({required int deltaX, required int deltaY}) {
    x += deltaX;
    y += deltaY;
  }
}

class Rectangle {
  late final Point topLeft;
  late final Point bottomRight;

  // Constructor that handles points even if they are not provided in the correct order
  Rectangle({required Point p1, required Point p2}) {
    topLeft = Point(
      x: p1.x < p2.x ? p1.x : p2.x,
      y: p1.y < p2.y ? p1.y : p2.y,
    );
    bottomRight = Point(
      x: p1.x > p2.x ? p1.x : p2.x,
      y: p1.y > p2.y ? p1.y : p2.y,
    );
  }

  // Computed getters for width, height, and area
  int get width => bottomRight.x - topLeft.x;
  int get height => bottomRight.y - topLeft.y;
  int get area => width * height;

  @override
  String toString() {
    return "Rectangle(TopLeft: $topLeft, BottomRight: $bottomRight)";
  }
}

void main() {
  // Test 1: Points provided in standard order
  print("--- Test 1: Standard Order ---");
  Rectangle rect1 = Rectangle(
    p1: Point(x: 10, y: 10),
    p2: Point(x: 60, y: 30),
  );
  print(rect1);
  print("Width: ${rect1.width}");
  print("Height: ${rect1.height}");
  print("Area: ${rect1.area}\n");

  // Test 2: Points provided in reverse/unordered manner (e.g., bottom-right first)
  print("--- Test 2: Unordered Points ---");
  Rectangle rect2 = Rectangle(
    p1: Point(x: 50, y: 40),
    p2: Point(x: 10, y: 20),
  );
  print(rect2);
  print("Width: ${rect2.width}");
  print("Height: ${rect2.height}");
  print("Area: ${rect2.area}");
}