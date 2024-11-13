
class PatientResponse {
  final bool status;
  final String message;
  final List<Patient> patients;

  PatientResponse({
    required this.status,
    required this.message,
    required this.patients,
  });

  factory PatientResponse.fromJson(Map<String, dynamic> json) {
    return PatientResponse(
      status: json['status'],
      message: json['message'],
      patients: (json['patient'] as List)
          .map((patient) => Patient.fromJson(patient))
          .toList(),
    );
  }
}

class Patient {
  final int id;
  final List<PatientDetail> details;
  final Branch branch;
  final String name;
  final String phone;
  final int totalAmount;
  final int discountAmount;
  final int advanceAmount;
  final int balanceAmount;

  Patient({
    required this.id,
    required this.details,
    required this.branch,
    required this.name,
    required this.phone,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? 0,
      details: (json['patientdetails_set'] as List)
          .map((detail) => PatientDetail.fromJson(detail))
          .toList(),
      branch: Branch.fromJson(json['branch']),
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      totalAmount: json['total_amount'] ?? 0,
      discountAmount: json['discount_amount'] ?? 0,
      advanceAmount: json['advance_amount'] ?? 0,
      balanceAmount: json['balance_amount'] ?? 0,
    );
  }
}


class PatientDetail {
  final int id;
  final String male;
  final String female;
  final int treatment;
  final String treatmentName;

  PatientDetail({
    required this.id,
    required this.male,
    required this.female,
    required this.treatment,
    required this.treatmentName,
  });

  factory PatientDetail.fromJson(Map<String, dynamic> json) {
    return PatientDetail(
      id: json['id'],
      male: json['male'],
      female: json['female'],
      treatment: json['treatment'],
      treatmentName: json['treatment_name'],
    );
  }
}

class Branch {
  final int id;
  final String name;
  final String location;

  Branch({
    required this.id,
    required this.name,
    required this.location,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'],
      name: json['name'],
      location: json['location'],
    );
  }
}
