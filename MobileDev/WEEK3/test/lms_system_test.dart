
import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('creates a student', () {
    final lms = LmsSystem();
    // Create student
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    expect(lms.students.first.name, 'ronan');
    expect(lms.students.length, 1);
    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
  });

  test('cannot create a student with an existing ID', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    expect(
      () => lms.addStudent(studentId: 'S1', studentName: 'john'),
      throwsException,
    );
  });
  test('cannot remove a student that does not exist', () {
    final lms = LmsSystem();

    expect(
      () => lms.removeStudent(studentId: 'S1'),
      throwsException,
    );
  });

  test('creates a course', () {
    final lms = LmsSystem();

    // Create a course
    lms.addCourse(courseId: 'C1', courseName: 'Dart');

    expect(lms.courses.first.name, 'Dart');
    expect(lms.courses.length, 1);
  });

  test('cannot create a course with an existing ID', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Dart');

    expect(
      () => lms.addCourse(courseId: 'C1', courseName: 'Java'),
      throwsException,
    );
  });

  test('cannot remove a course that does not exist', () {
    final lms = LmsSystem();

    expect(
      () => lms.removeCourse(courseId: 'C1'),
      throwsException,
    );
  });

  test('removes a course with no enrollments or results', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.removeCourse(courseId: 'C1');

    expect(lms.courses.length, 0);
  });

  test('enrolls a student in a course', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    // Enroll student
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    expect(lms.courses.first.studentIds.contains('S1'), isTrue);
  });

  test('cannot enroll a student who does not exist', () {
    final lms = LmsSystem();
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    // Try to enroll a non-existent student
    expect(
      () => lms.enrollStudent(studentId: 'S1', courseId: 'C1'),
      throwsException,
    );
  });

  test('cannot enroll a student in a course that does not exist', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    expect(
      () => lms.enrollStudent(studentId: 'S1', courseId: 'C1'),
      throwsException,
    );
  });

  test('cannot enroll the same student twice in a course', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    expect(
      () => lms.enrollStudent(studentId: 'S1', courseId: 'C1'),
      throwsException,
    );
  });

  test('removes a student from a course', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    // Remove enrollment
    lms.discardStudentFromCourse(
      studentId: 'S1',
      courseId: 'C1',
    );
    expect(lms.courses.first.studentIds.contains('S1'), isFalse);
  });

  test('cannot remove an enrollment that does not exist', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    // remove a non-existent enrollment
    expect(
      () => lms.discardStudentFromCourse(
        studentId: 'S1',
        courseId: 'C1',
      ),
      throwsException,
    );
  });

  test('adds a result for an enrolled student', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    // Add result
    lms.addResult(
      resultId: 'R1',
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );
    expect(lms.results.first.score, 85);
    expect(lms.results.length, 1);
  });
  test('cannot add a result for a student who does not exist', () {
    final lms = LmsSystem();
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    expect(
      () => lms.addResult(
        resultId: 'R1',
        studentId: 'S1',
        courseId: 'C1',
        score: 85,
      ),
      throwsException,
    );
  });

  test('cannot add a result for a course that does not exist', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    expect(
      () => lms.addResult(
        resultId: 'R1',
        studentId: 'S1',
        courseId: 'C1',
        score: 85,
      ),
      throwsException,
    );
  });

  test('cannot add a result if the student is not enrolled', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    expect(
      () => lms.addResult(
        resultId: 'R1',
        studentId: 'S1',
        courseId: 'C1',
        score: 85,
      ),
      throwsException,
    );
  });

  test('cannot add a result with a score below 0', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    expect(
      () => lms.addResult(
        resultId: 'R1',
        studentId: 'S1',
        courseId: 'C1',
        score: -1,
      ),
      throwsException,
    );
  });

  test('cannot add a result with a score above 100', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    expect(
      () => lms.addResult(
        resultId: 'R1',
        studentId: 'S1',
        courseId: 'C1',
        score: 101,
      ),
      throwsException,
    );
  });

  test('cannot add two results for the same student and course', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.addResult(
      resultId: 'R1',
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );
    expect(
      () => lms.addResult(
        resultId: 'R2',
        studentId: 'S1',
        courseId: 'C1',
        score: 90,
      ),
      throwsException,
    );
  });

  test('removes a result', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(
      resultId: 'R1',
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );

    // Remove result
    lms.removeResult(resultId: 'R1');

    expect(lms.results.length, 0);
  });

  test('cannot remove a result that does not exist', () {
    final lms = LmsSystem();

    expect(
      () => lms.removeResult(resultId: 'R1'),
      throwsException,
    );
  });

  // ==================== CLEANUP ====================

  test('removing a student also removes their enrollments and results', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(
      resultId: 'R1',
      studentId: 'S1',
      courseId: 'C1',
      score: 85,
    );

    // Remove student
    lms.removeStudent(studentId: 'S1');

    expect(lms.students.length, 0);
    expect(lms.courses.first.studentIds.contains('S1'), isFalse);
    expect(lms.results.length, 0);
  });

  test('cannot remove a course while students are enrolled', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(
      () => lms.removeCourse(courseId: 'C1'),
      throwsException,
    );
  });
}
