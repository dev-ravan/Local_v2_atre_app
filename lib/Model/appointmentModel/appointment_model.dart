class AppointmentList {
  String? appointmentId;
  String? patientId;
  String? referredDoctor;
  String? scanType;
  String? differentialDiagnosis;
  DateTime? appointmentDate;
  String? appointmentTime;
  String? appointmentLocation;
  DateTime? createdAt;
  String? hubId;
  String? clientId;
  String? patientName;
  String? callUrl;
  String? doctorId;
  String? createdBy;
  String? robotId;

  AppointmentList({
    required this.appointmentId,
    required this.patientId,
    required this.referredDoctor,
    required this.scanType,
    required this.differentialDiagnosis,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentLocation,
    required this.createdAt,
    required this.hubId,
    required this.clientId,
    required this.patientName,
    required this.callUrl,
    required this.doctorId,
    required this.createdBy,
    required this.robotId,
  });
}
