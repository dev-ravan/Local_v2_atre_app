// To parse this JSON data, do
//
//     final doctorList = doctorListFromJson(jsonString);



class DoctorList {
    String doctorId;
    String doctorName;
    String doctorRegistrationNumber;
    String doctorEmail;
    String hospitalName;
    String doctorPhoneNumber;
    String radiologistLicenseNumber;
    List<String> timeSlot;
    String clientId;
    DateTime createdAt;

    DoctorList({
        required this.doctorId,
        required this.doctorName,
        required this.doctorRegistrationNumber,
        required this.doctorEmail,
        required this.hospitalName,
        required this.doctorPhoneNumber,
        required this.radiologistLicenseNumber,
        required this.timeSlot,
        required this.clientId,
        required this.createdAt,
    });

    factory DoctorList.fromJson(Map<String, dynamic> json) => DoctorList(
        doctorId: json["doctor_id"],
        doctorName: json["doctor_name"],
        doctorRegistrationNumber: json["doctor_registration_number"],
        doctorEmail: json["doctor_email"],
        hospitalName: json["hospital_name"],
        doctorPhoneNumber: json["doctor_phone_number"],
        radiologistLicenseNumber: json["radiologist_license_number"],
        timeSlot: List<String>.from(json["time_slot"].map((x) => x)),
        clientId: json["client_id"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "doctor_id": doctorId,
        "doctor_name": doctorName,
        "doctor_registration_number": doctorRegistrationNumber,
        "doctor_email": doctorEmail,
        "hospital_name": hospitalName,
        "doctor_phone_number": doctorPhoneNumber,
        "radiologist_license_number": radiologistLicenseNumber,
        "time_slot": List<dynamic>.from(timeSlot.map((x) => x)),
        "client_id": clientId,
        "created_at": createdAt.toIso8601String(),
    };
}
