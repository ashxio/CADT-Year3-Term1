import 'package:test/test.dart';
import '../service/appointment_service.dart';

void main() {
  test('books an appointment', () {
    final appointmentService = AppointmentService();
    appointmentService.addPatient(patientId: 'P1', patientName: 'Dara');
    appointmentService.addDoctor(doctorId: 'D1', doctorName: 'Dr. Sok');

    appointmentService.bookAppointment(
        patientId: 'P1', doctorId: 'D1', hour: 9);

    expect(appointmentService.appointments.length, 1);
    expect(appointmentService.appointments.first.patient.name, 'Dara');
  });

  test('cannot book an appointment outside opening hours', () {
    final appointmentService = AppointmentService();
    appointmentService.addPatient(patientId: 'P1', patientName: 'Dara');
    appointmentService.addDoctor(doctorId: 'D1', doctorName: 'Dr. Sok');

    expect(
      () => appointmentService.bookAppointment(
          patientId: 'P1', doctorId: 'D1', hour: 17),
      throwsException,
    );
  });

  test('cannot book a doctor who is already busy at this hour', () {
    final appointmentService = AppointmentService();
    appointmentService.addPatient(patientId: 'P1', patientName: 'Dara');
    appointmentService.addPatient(patientId: 'P2', patientName: 'Sokha');
    appointmentService.addDoctor(doctorId: 'D1', doctorName: 'Dr. Sok');

    appointmentService.bookAppointment(
        patientId: 'P1', doctorId: 'D1', hour: 9);

    expect(
      () => appointmentService.bookAppointment(
          patientId: 'P2', doctorId: 'D1', hour: 9),
      throwsException,
    );
  });
  
  test('cancelling frees the doctor slot', () {
    final service = AppointmentService();
    service.addPatient(patientId: 'P1', patientName: 'Dara');
    service.addPatient(patientId: 'P2', patientName: 'Sokha');
    service.addDoctor(doctorId: 'D1', doctorName: 'Dr. Sok');

    service.bookAppointment(patientId: 'P1', doctorId: 'D1', hour: 9);
    service.cancelAppointment(patientId: 'P1', doctorId: 'D1', hour: 9);

    expect(service.appointments.first.isActive, false);

    expect(
      () => service.bookAppointment(
          patientId: 'P2', doctorId: 'D1', hour: 9),
      returnsNormally,
    );
  });

  test('cannot cancel an appointment twice', () {
    final service = AppointmentService();
    service.addPatient(patientId: 'P1', patientName: 'Dara');
    service.addDoctor(doctorId: 'D1', doctorName: 'Dr. Sok');

    service.bookAppointment(patientId: 'P1', doctorId: 'D1', hour: 9);
    service.cancelAppointment(patientId: 'P1', doctorId: 'D1', hour: 9);

    expect(
      () => service.cancelAppointment(
          patientId: 'P1', doctorId: 'D1', hour: 9),
      throwsException,
    );
  });
}