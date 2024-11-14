class Patient {
  final int id;
  final String name;
  final List<PatientDetail> details;

  Patient({
    required this.id,
    required this.name,
    required this.details,
  });

  factory Patient.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw Exception("Null JSON data for Patient");
    }

    return Patient(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      details: (json['details'] as List<dynamic>?)
              ?.map((e) => PatientDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class PatientDetail {
  final int id;
  final int male;
  final int female;
  final int patient;
  final int treatment;
  final String treatmentName;
  

  PatientDetail({
    required this.id,
    required this.male,
    required this.female,
    required this.patient,
    required this.treatment,
    required this.treatmentName,
  });

  factory PatientDetail.fromJson(Map<String, dynamic> json) {
    return PatientDetail(
      id: json['id'] ?? 0,
      male: int.tryParse(json['male'] ?? '0') ?? 0,
      female: int.tryParse(json['female'] ?? '0') ?? 0,
      patient: json['patient'] ?? 0,
      treatment: json['treatment'] ?? 0,
      treatmentName: json['treatment_name'] ?? '',
    );
  }
}

class Branch {
  final int id;
  final String name;
  final int patientsCount;
  final String location;
  final String phone;
  final String mail;
  final String address;
  final String gst;
  final bool isActive;

  Branch({
    required this.id,
    required this.name,
    required this.patientsCount,
    required this.location,
    required this.phone,
    required this.mail,
    required this.address,
    required this.gst,
    required this.isActive,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'],
      name: json['name'],
      patientsCount: json['patients_count'],
      location: json['location'],
      phone: json['phone'],
      mail: json['mail'],
      address: json['address'],
      gst: json['gst'],
      isActive: json['is_active'],
    );
  }
}
