
import '../model/student.dart';
import '../model/course.dart';
import '../model/course_result.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> results = [];

  void addStudent({
    required String studentId,
    required String studentName,
  }) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $studentId already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);

    // 2- Remove student from all courses
    for (Course course in courses) {
      course.studentIds.remove(studentId);
    }

    // 3- Remove all results belonging to this student
    results.removeWhere((result) => result.studentId == studentId);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; 
  }

  void addCourse({
    required String courseId,
    required String courseName,
  }) {
    // ! Course shall not exist already
    Course? course = _findCourseOrNull(courseId);
    if (course != null) {
      throw Exception('Course $courseId already exists');
    }

    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }

    // ! Course cannot be removed while students are enrolled
    if (course.studentIds.isNotEmpty) {
      throw Exception('Course $courseId still has enrolled students');
    }

    // ! Course cannot be removed while results exist
    for (CourseResult result in results) {
      if (result.courseId == courseId) {
        throw Exception('Course $courseId still has results');
      }
    }

    // 1- Remove course from the courses list
    courses.removeWhere((course) => course.id == courseId);
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null;
  }

  void enrollStudent({
    required String studentId,
    required String courseId,
  }) {
    // ! Student must exist
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    // ! Course must exist
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }

    // ! Student shall not already be enrolled
    if (course.studentIds.contains(studentId)) {
      throw Exception(
        'Student $studentId is already enrolled in course $courseId',
      );
    }

    // 1- Add student to the course
    course.studentIds.add(studentId);
  }

  void discardStudentFromCourse({
    required String studentId,
    required String courseId,
  }) {
    // ! Student must exist
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    // ! Course must exist
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }

    // ! Student must be enrolled in the course
    if (!course.studentIds.contains(studentId)) {
      throw Exception(
        'Student $studentId is not enrolled in course $courseId',
      );
    }

    // 1- Remove student from the course
    course.studentIds.remove(studentId);

    // 2- Remove the student's result for this course
    results.removeWhere(
      (result) =>
          result.studentId == studentId &&
          result.courseId == courseId,
    );
  }

  void addResult({
    required String resultId,
    required String studentId,
    required String courseId,
    required num score,
  }) {
    // ! Student must exist
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    // ! Course must exist
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }

    // ! Student must be enrolled in the course
    if (!course.studentIds.contains(studentId)) {
      throw Exception(
        'Student $studentId is not enrolled in course $courseId',
      );
    }

    // ! Score must be between 0 and 100
    if (score < 0 || score > 100) {
      throw Exception('Score must be between 0 and 100');
    }

    // ! Result ID shall not already exist
    for (CourseResult result in results) {
      if (result.id == resultId) {
        throw Exception('Result $resultId already exists');
      }

      // ! Only one result per student per course
      if (result.studentId == studentId &&
          result.courseId == courseId) {
        throw Exception(
          'Student $studentId already has a result for course $courseId',
        );
      }
    }

    // 1- Add the result
    results.add(
      CourseResult(
        id: resultId,
        studentId: studentId,
        courseId: courseId,
        score: score,
      ),
    );
  }

  void removeResult({required String resultId}) {
    // ! Result must exist
    CourseResult? result = _findResultOrNull(resultId);
    if (result == null) {
      throw Exception('Result $resultId not found');
    }

    // 1- Remove result from the results list
    results.removeWhere((result) => result.id == resultId);
  }

  CourseResult? _findResultOrNull(String resultId) {
    for (CourseResult r in results) {
      if (r.id == resultId) {
        return r;
      }
    }
    return null;
  }
}