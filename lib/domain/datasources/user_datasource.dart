import 'package:estu_residencia_app/domain/entities/user.dart';

abstract class UserDataSource {
  Future<User> getUser();
}
