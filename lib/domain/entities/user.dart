class User {
  final int userId;
  final String name;
  final String email;
  final int telefono;
  final String? documentType;
  final int? documentNumber;
  final bool? isValidated;
  final int? role;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.telefono,
    required this.isValidated,
    required this.role,
    this.documentType,
    this.documentNumber,
  });

  User.fromJson(Map<String, dynamic> json)
      : userId = json['usuario_id'],
        name = json['nombre'],
        email = json['correo'],
        telefono = int.parse(json['celular']),
        isValidated = json['validado'],
        role = json['rol'],
        documentType = json['tipo_documento'],
        documentNumber = json['documento'];

  @override
  String toString() {
    return 'User(userId: $userId, name: $name, email: $email, telefono: $telefono, documentType: $documentType, documentNumber: $documentNumber, isValidated: $isValidated, role: $role)';
  }

  // Since User is immutable, we implement a method that allows cloning the
  // User with slightly different content.
  User copyWith({
    int? userId,
    String? name,
    String? email,
    int? telefono,
    String? documentType,
    int? documentNumber,
    bool? isValidated,
    int? role,
  }) {
    return User(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      telefono: telefono ?? this.telefono,
      isValidated: isValidated ?? this.isValidated,
      role: role ?? this.role,
      documentType: documentType ?? this.documentType,
      documentNumber: documentNumber ?? this.documentNumber,
    );
  }
}
