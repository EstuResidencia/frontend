import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:estu_residencia_app/providers/register_provider.dart';

abstract class UserDataSource {
  Future<User> registerUser(UserRegister user);
  Future<User> loginUser(String email, String password);
  Future<User> validateUser({
    int? userId,
    required int documentNumber,
    required String docType,
    required int role,
  });
  Future<Post> createPost({
    required int userId,
    required String description,
    required String direccion,
    required int comuna,
    required int canonCop,
    required int areaM2,
    required int floor,
    required List<PostImage> images,
  });
}
