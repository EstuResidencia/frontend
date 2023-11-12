import 'package:flutter/material.dart';

class Post {
  final int postId;
  final int ownerId;
  final int? studentId;
  final String description;
  final int status;
  final String direccion;
  final int comuna;
  final int canonCop;
  final int areaM2;
  final int floor;
  final bool stateChanged;
  final int calificacion;
  final List<PostImage> images;

  Post({
    required this.postId,
    required this.ownerId,
    this.studentId,
    required this.description,
    required this.status,
    required this.direccion,
    required this.comuna,
    required this.canonCop,
    required this.areaM2,
    required this.floor,
    required this.stateChanged,
    required this.calificacion,
    required this.images,
  });

  Post.fromJson(Map<String, dynamic> json)
      : postId = json['id'],
        ownerId = json['usuario'],
        studentId = json['inquilino'],
        description = json['descripcion'],
        status = json['estado'],
        direccion = json['direccion'],
        comuna = json['comuna'],
        canonCop = json['canon_cop'],
        areaM2 = json['area_m2'],
        floor = json['piso'],
        stateChanged = json['estado_cambiado'],
        calificacion = json['calificacion'],
        images = parseImages(json['imagenes']);

  @override
  String toString() {
    return 'Post(postId: $postId, ownerId: $ownerId, studentId: $studentId, description: $description, status: $status, direccion: $direccion, comuna: $comuna, canonCop: $canonCop, areaM2: $areaM2, floor: $floor, stateChanged: $stateChanged, calificacion: $calificacion, images: $images)';
  }

  static List<PostImage> parseImages(List<dynamic> images) {
    return images
        .map((item) => PostImage(imageId: item['id'], data: item['data']))
        .toList();
  }
}

class PostImage {
  final int imageId;
  final String data;

  PostImage({
    required this.imageId,
    required this.data,
  });

  @override
  String toString() =>
      'PostImage(imageId: $imageId, data: ${data.characters.take(20).toString()})';
}
