class MyDuration {
  final int _milliseconds;
  MyDuration._(this._milliseconds) {
    if (_milliseconds < 0) {
      throw ArgumentError("cannot < 0");
    }
  }
  MyDuration.fromHours(int hours) : this._(hours * 60 * 60 * 1000);
  MyDuration.fromMinutes(int minutes) : this._(minutes * 60 * 1000);
  MyDuration.fromSeconds(int seconds) : this._(seconds * 1000);

  MyDuration operator +(MyDuration other) {
    return MyDuration._(_milliseconds + other._milliseconds);
  }

  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  MyDuration operator -(MyDuration other) {
    return MyDuration._(_milliseconds - other._milliseconds);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  // MyDuration duration3 = MyDuration.fromSeconds(50);
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true
    print(duration1 + duration2);


  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
