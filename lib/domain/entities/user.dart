class User {
  final int userId;
  final String name;
  final String email;
  final int telefono;
  final String? documentType;
  final int? documentNumber;
  final bool? isValidated;
  final List<Role>? roles;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.telefono,
    required this.isValidated,
    required this.roles,
    this.documentType,
    this.documentNumber,
  });

  User.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        name = json['nombre'],
        email = json['correo'],
        telefono = json['celular'],
        isValidated = json['validado'],
        roles = List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        documentType = json['tipo_documento'],
        documentNumber = json['documento'];

  @override
  String toString() {
    return 'User(userId: $userId, name: $name, email: $email, telefono: $telefono, documentType: $documentType, documentNumber: $documentNumber, isValidated: $isValidated, roles: $roles)';
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
    List<Role>? roles,
  }) {
    return User(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      telefono: telefono ?? this.telefono,
      isValidated: isValidated ?? this.isValidated,
      roles: roles ?? this.roles,
      documentType: documentType ?? this.documentType,
      documentNumber: documentNumber ?? this.documentNumber,
    );
  }
}

class Role {
  final int roleId;
  final String name;

  Role({
    required this.roleId,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleId: json["id"],
        name: json["nombre"],
      );

  @override
  String toString() => 'Role(roleId: $roleId, name: $name)';
}
