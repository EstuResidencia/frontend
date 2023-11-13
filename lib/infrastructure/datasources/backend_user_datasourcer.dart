import 'package:dio/dio.dart';
import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:estu_residencia_app/domain/entities/request.dart';
import 'package:estu_residencia_app/providers/register_provider.dart';
import 'package:flutter/services.dart';
import 'package:estu_residencia_app/domain/datasources/user_datasource.dart';
import 'package:estu_residencia_app/domain/entities/user.dart';

class BackendUserDataSource extends UserDataSource {
  @override
  Future<User> registerUser(UserRegister user) async {
    try {
      Response response = await Dio().post(
        'https://estu-residencia-api.onrender.com/register/',
        data: {
          'nombre': user.name,
          'correo': user.email,
          'celular': user.telefono,
          'password': user.password,
        },
      );
      return User.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }

  @override
  Future<User> loginUser(String email, String password) async {
    try {
      Response response = await Dio().post(
        'https://estu-residencia-api.onrender.com/login/',
        data: {
          'correo': email,
          'password': password,
        },
      );
      return User.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }

  @override
  Future<User> validateUser({
    int? userId,
    required int documentNumber,
    required String docType,
    required int role,
  }) async {
    try {
      Response response = await Dio().patch(
        'https://estu-residencia-api.onrender.com/usuario/$userId/',
        data: {
          'tipo_documento': docType,
          'documento': documentNumber,
          'rol': role,
          'validado': true,
        },
      );
      return User.fromJson(response.data['usuario']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }

  @override
  Future<Post> createPost({
    required int userId,
    required String description,
    required String direccion,
    required int comuna,
    required int canonCop,
    required int areaM2,
    required int floor,
    required List<PostImage> images,
  }) async {
    try {
      Response response = await Dio().post(
        'https://estu-residencia-api.onrender.com/publicacion/',
        data: {
          'usuario': userId,
          'descripcion': description,
          'direccion': direccion,
          'comuna': comuna,
          'canon_cop': canonCop,
          'area_m2': areaM2,
          'piso': floor,
          'imagenes': images.map((e) => e.data).toList(),
        },
      );
      return Post.fromJson(response.data['publicacion']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }

  @override
  Future<List<Post>> getOwnerPosts({
    required int arrendadorId,
  }) async {
    try {
      Response response = await Dio().get(
        'https://estu-residencia-api.onrender.com/publicacion/listar/$arrendadorId/',
      );
      final result =
          (response.data as List).map((e) => Post.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }

  @override
  Future<List<Post>> getAllPosts() async {
    try {
      Response response = await Dio().get(
        'https://estu-residencia-api.onrender.com/publicacion/',
      );
      final result =
          (response.data as List).map((e) => Post.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }

  @override
  Future<Request> createRequest(int userId, int postId) async {
    try {
      Response response = await Dio().post(
        'https://estu-residencia-api.onrender.com/solicitud/',
        data: {
          'usuario': userId,
          'publicacion': postId,
        },
      );
      return Request.fromJson(response.data['solicitud']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }

  @override
  Future<Post> getPostById(int postId) async {
    try {
      Response response = await Dio().get(
        'https://estu-residencia-api.onrender.com/publicacion/$postId/',
      );
      return Post.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }

  @override
  Future<List<Request>> getRequests(int userId, int role) async {
    try {
      final String endPointType = role == 1 ? 'arrendador' : 'estudiante';
      Response response = await Dio().get(
        'https://estu-residencia-api.onrender.com/solicitud/$endPointType/$userId/',
      );
      var result =
          (response.data as List).map((e) => Request.fromJson(e)).toList();

      for (var i = 0; i < result.length; i++) {
        final postId = result[i].postId;
        final Post postResponse = await getPostById(postId);
        result[i].post = postResponse;
      }
      return result;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw PlatformException(
          code: '400',
          message: e.response?.data.toString(),
        );
      } else {
        throw PlatformException(
          code: '500',
          message: e.response?.data.toString(),
        );
      }
    }
  }
}
