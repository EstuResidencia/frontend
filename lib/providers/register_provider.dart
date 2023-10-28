import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// The Notifier class that will be passed to our NotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
class User {
  final String? name;
  final String? email;
  final int? telefono;
  final String? password;

  User({
    required this.name,
    required this.email,
    required this.telefono,
    required this.password,
  });

  @override
  String toString() {
    return 'User{name: $name, email: $email, telefono: $telefono, password: $password}';
  }

  // Since User is immutable, we implement a method that allows cloning the
  // User with slightly different content.
  User copyWith({
    int? userId,
    String? name,
    String? email,
    int? telefono,
    String? password,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      telefono: telefono ?? this.telefono,
      password: password ?? this.password,
    );
  }
}

class UserNotifier extends Notifier<User> {
  // We initialize the list of todos to an empty list
  @override
  User build() {
    return User(
      name: null,
      email: null,
      telefono: null,
      password: null,
    );
  }

  // Let's allow the UI to add todos.
  void changeUser({
    String? name,
    String? email,
    int? telefono,
    String? password,
  }) {
    state = state.copyWith(
      name: name ?? state.name,
      email: email ?? state.email,
      telefono: telefono ?? state.telefono,
      password: password ?? state.password,
    );
  }
}

// Finally, we are using NotifierProvider to allow the UI to interact with
// our UserNotifier class.
final userProvider = NotifierProvider<UserNotifier, User>(() {
  return UserNotifier();
});

final nameFormKey = GlobalKey<FormState>();
final emailFormKey = GlobalKey<FormState>();
final telefonoFormKey = GlobalKey<FormState>();
final passwordFormKey = GlobalKey<FormState>();

final nameFormKeyProvider = StateProvider((ref) => nameFormKey);
final emailFormKeyProvider = StateProvider((ref) => emailFormKey);
final telefonoFormKeyProvider = StateProvider((ref) => telefonoFormKey);
final passwordFormKeyProvider = StateProvider((ref) => passwordFormKey);

final nameTextEditingController = TextEditingController();
final emailTextEditingController = TextEditingController();
final telefonoTextEditingController = TextEditingController();
final passwordTextEditingController = TextEditingController();

final nameProviderController =
    StateProvider((ref) => nameTextEditingController);
final emailProviderController =
    StateProvider((ref) => emailTextEditingController);
final telefonoProviderController =
    StateProvider((ref) => telefonoTextEditingController);
final passwordProviderController =
    StateProvider((ref) => passwordTextEditingController);
