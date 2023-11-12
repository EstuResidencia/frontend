import 'package:estu_residencia_app/domain/entities/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPublish {
  final int? userId;
  final String? description;
  final String? direccion;
  final int? comuna;
  final int? canonCop;
  final int? areaM2;
  final int? floor;
  final List<PostImage>? images;

  static int imageId = 0;

  PostPublish({
    this.userId,
    this.description,
    this.direccion,
    this.comuna,
    this.canonCop,
    this.areaM2,
    this.floor,
    this.images,
  });

  @override
  String toString() {
    return 'Post{userId: $userId, description: $description, direccion: $direccion, comuna: $comuna, canonCop: $canonCop, areaM2: $areaM2, floor: $floor, images: $images}';
  }

  PostPublish copyWith({
    int? userId,
    String? description,
    String? direccion,
    int? comuna,
    int? canonCop,
    int? areaM2,
    int? floor,
  }) {
    return PostPublish(
      userId: userId ?? this.userId,
      description: description ?? this.description,
      direccion: direccion ?? this.direccion,
      comuna: comuna ?? this.comuna,
      canonCop: canonCop ?? this.canonCop,
      areaM2: areaM2 ?? this.areaM2,
      floor: floor ?? this.floor,
    );
  }

  PostPublish addImage(String imageString) {
    final image = PostImage(
      imageId: imageId,
      data: imageString,
    );
    imageId++;
    return PostPublish(
      userId: userId,
      description: description,
      direccion: direccion,
      comuna: comuna,
      canonCop: canonCop,
      areaM2: areaM2,
      floor: floor,
      images: [...images ?? [], image],
    );
  }

  PostPublish removeImage(int index) {
    return PostPublish(
      userId: userId,
      description: description,
      direccion: direccion,
      comuna: comuna,
      canonCop: canonCop,
      areaM2: areaM2,
      floor: floor,
      images: [...images ?? []]..removeAt(index),
    );
  }
}

class PostNotifier extends Notifier<PostPublish> {
  // We initialize the list of todos to an empty list
  @override
  PostPublish build() {
    return PostPublish();
  }

  // Let's allow the UI to add todos.
  void changePost({
    int? userId,
    String? description,
    String? direccion,
    int? comuna,
    int? canonCop,
    int? areaM2,
    int? floor,
  }) {
    state = state.copyWith(
      userId: userId ?? state.userId,
      description: description ?? state.description,
      direccion: direccion ?? state.direccion,
      comuna: comuna ?? state.comuna,
      canonCop: canonCop ?? state.canonCop,
      areaM2: areaM2 ?? state.areaM2,
      floor: floor ?? state.floor,
    );
  }

  void addImage(String image) {
    state = state.addImage(image);
  }

  void removeImage(int index) {
    state = state.removeImage(index);
  }

  void restorePost() {
    state = PostPublish();
  }
}

final postPublishProvider = NotifierProvider<PostNotifier, PostPublish>(() {
  return PostNotifier();
});
