# IDTB110199 — WEEK 4 TEST — G4 The Clinic Appointments

## Submitted code

### lib/model/appointment.dart

```dart
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
```

### lib/model/person.dart

```dart
class Doctor {
  final String id;
  final String name;

  Doctor({required this.id, required this.name});
}

class Patient {
  final String id;
  final String name;

  Patient({required this.id, required this.name});
}
```

### lib/service/appointment_service.dart

```dart
import '../model/appointment.dart';
import '../model/person.dart';

class AppointmentService {
  static const int openingHour = 8;
  static const int closingHour = 17;

  final List<Doctor> doctors = [];
  final List<Patient> patients = [];
  final List<Appointment> appointments = [];

  void addDoctor({required String doctorId, required String doctorName}) {
    // ! Doctor shall not exist already
    if (_findDoctorOrNull(doctorId) != null) {
      throw Exception('Doctor $doctorId already exists');
    }
    doctors.add(Doctor(id: doctorId, name: doctorName));
  }

  void addPatient({required String patientId, required String patientName}) {
    // ! Patient shall not exist already
    if (_findPatientOrNull(patientId) != null) {
      throw Exception('Patient $patientId already exists');
    }
    patients.add(Patient(id: patientId, name: patientName));
  }

  void bookAppointment({
    required String patientId,
    required String doctorId,
    required int hour,
  }) {
    // ! Patient shall exist
    Patient? patient = _findPatientOrNull(patientId);
    if (patient == null) {
      throw Exception('Patient $patientId not found');
    }

    // ! Doctor shall exist
    Doctor? doctor = _findDoctorOrNull(doctorId);
    if (doctor == null) {
      throw Exception('Doctor $doctorId not found');
    }

    // ! Hour shall be within opening hours (last appointment starts at 16)
    if (hour < openingHour || hour >= closingHour) {
      throw Exception('Hour $hour is outside opening hours');
    }

    // ! Doctor shall be free at this hour
    if (_isDoctorBusy(doctorId, hour)) {
      throw Exception('Doctor $doctorId is not free at $hour');
    }

    // ! Patient shall be free at this hour
    if (_isPatientBusy(patientId, hour)) {
      throw Exception('Patient $patientId already has an appointment at $hour');
    }

    appointments.add(Appointment(patient: patient, doctor: doctor, hour: hour));
  }

  void cancelAppointment({
  required String patientId,
  required String doctorId,
  required int hour,
  }) {
  Appointment? appointment;

  for (Appointment a in appointments) {
    if (a.patient.id == patientId &&
        a.doctor.id == doctorId &&
        a.hour == hour &&
        a.isActive) {
      appointment = a;
      break;
    }
  }

  if (appointment == null) {
    throw Exception('Active appointment not found');
  }

  appointment.status = AppointmentStatus.cancelled;
  }

  Doctor? _findDoctorOrNull(String doctorId) {
    for (Doctor d in doctors) {
      if (d.id == doctorId) return d;
    }
    return null;
  }

  Patient? _findPatientOrNull(String patientId) {
    for (Patient p in patients) {
      if (p.id == patientId) return p;
    }
    return null;
  }

  bool _isDoctorBusy(String doctorId, int hour) {
  for (Appointment a in appointments) {
    if (a.isActive &&
        a.doctor.id == doctorId &&
        a.hour == hour) {
      return true;
    }
  }
  return false;
  }

  bool _isPatientBusy(String patientId, int hour) {
  for (Appointment a in appointments) {
    if (a.isActive &&
        a.patient.id == patientId &&
        a.hour == hour) {
      return true;
    }
  }
  return false;
  }
}
```

### lib/test/appointment_test.dart

```dart
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

  // TODO Q3: add your 2 tests here 
  
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
```

## Evaluation

## Student Evaluation

### 1. Identification

- Student ID: IDTB110199
- Exam: WEEK 4 - PRACTICE TEST
- Evaluation date: OCT 23 2026
- Final grade: 100 / 100
- Status: **Pending teacher validation**


### 2. Detailed Grading

Line references (L…) point to the submitted files in `lib/`.

The project compiles with no analyzer error. `dart test lib/test/appointment_test.dart`: **5 passed, 0 failed** (the 3 existing tests and the 2 new tests).

| Criterion | Maximum | Awarded | Evidence and justification |
|---|---:|---:|---|
| 1a. Model — status enum and field | 10 | 10 | `appointment.dart` L2–5, L11: `enum AppointmentStatus { booked, cancelled }` and a modifiable `status` initialised to `booked`. |
| 1b. Model — `isActive` getter | 10 | 10 | `appointment.dart` L15: `status == AppointmentStatus.booked`. |
| 2a. Service — `cancelAppointment` | 20 | 20 | `appointment_service.dart` L63–85: correct signature; finds the **active** appointment matching patient, doctor and hour, throws if none, and sets its status to `cancelled` (not deleted). |
| 2b. Service — cancelled appointments ignored | 20 | 20 | L101–122: `a.isActive &&` added to both `_isDoctorBusy` and `_isPatientBusy`. |
| 3a. Test — valid scenario | 20 | 20 | Test file L47–63: P1 books D1 at 9 and cancels; the test checks that the appointment is inactive and that P2's booking of D1 at 9 `returnsNormally`. Passes. |
| 3b. Test — invalid scenario | 20 | 20 | Test file L65–78: book, cancel, then the second cancellation is checked with `throwsException`. Passes. |
| **Total** | **100** | **100** | |

### 3. Strengths

- All requirements are met with exactly the requested API.
- The busy helpers were updated exactly as the tip suggested.
- Clear tests, with a good use of `returnsNormally`.

### 4. Improvements

- Nothing required. Optional: after P2's booking, also check that 2 appointments exist and that the last one belongs to P2.