class Contact {
  final int? id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final int isFavorite;

  Contact({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    this.isFavorite = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'isFavorite': isFavorite,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      isFavorite: map['isFavorite'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => toMap();
  factory Contact.fromJson(Map<String, dynamic> json) => Contact.fromMap(json);

  Contact copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    int? isFavorite,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
