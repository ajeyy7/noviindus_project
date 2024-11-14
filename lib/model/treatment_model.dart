class TreatmentResponse {
  final bool status;
  final String message;
  final List<Treatment> treatments;

  TreatmentResponse({required this.status, required this.message, required this.treatments});

  factory TreatmentResponse.fromJson(Map<String, dynamic> json) {
    var treatmentsList = json['treatments'] as List;
    List<Treatment> treatments = treatmentsList.map((i) => Treatment.fromJson(i)).toList();

    return TreatmentResponse(
      status: json['status'],
      message: json['message'],
      treatments: treatments,
    );
  }
}

class Treatment {
  final int id;
  final List<Branch> branches;
  final String name;
  final String duration;
  final String price;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  Treatment({
    required this.id,
    required this.branches,
    required this.name,
    required this.duration,
    required this.price,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Treatment.fromJson(Map<String, dynamic> json) {
    var branchesList = json['branches'] as List;
    List<Branch> branches = branchesList.map((i) => Branch.fromJson(i)).toList();

    return Treatment(
      id: json['id'],
      branches: branches,
      name: json['name'],
      duration: json['duration'],
      price: json['price'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
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
