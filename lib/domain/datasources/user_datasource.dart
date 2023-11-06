import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:estu_residencia_app/providers/register_provider.dart';

abstract class UserDataSource {
  Future<User> registerUser(UserRegister user);
  Future<User> loginUser(String email, String password);
}
