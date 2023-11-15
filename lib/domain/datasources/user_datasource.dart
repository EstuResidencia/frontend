import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:estu_residencia_app/domain/entities/request.dart';
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

  Future<Post> getPostById(int postId);

  Future<Post> deletePostById(int postId);

  Future<List<Post>> getOwnerPosts({
    required int arrendadorId,
  });

  Future<List<Post>> getAllPosts();

  Future<Request> createRequest(int userId, int postId);

  Future<List<Request>> getRequests(int userId, int role);
}
