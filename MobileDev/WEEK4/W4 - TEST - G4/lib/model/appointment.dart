import 'person.dart';
enum AppointmentStatus {
  booked,
  cancelled,
}
class Appointment {
  final Patient patient;
  final Doctor doctor;
  final int hour;

  AppointmentStatus status = AppointmentStatus.booked;

  Appointment({required this.patient, required this.doctor, required this.hour});

  bool get isActive => status == AppointmentStatus.booked;
}
