class Branch {
  final int id;
  final String name;
  final String location;
  final String phone;

  Branch({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      phone: json['phone'],
    );
  }
}
