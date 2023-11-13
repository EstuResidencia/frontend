import 'package:estu_residencia_app/domain/entities/post.dart';

class Request {
  final int requestId;
  final int studentId;
  final int postId;
  final int status;
  final bool isPaid;
  final String date;
  final bool stateChenged;
  Post? post;

  Request({
    required this.requestId,
    required this.studentId,
    required this.postId,
    required this.status,
    required this.isPaid,
    required this.date,
    required this.stateChenged,
    this.post,
  });

  Request.fromJson(Map<String, dynamic> json)
      : requestId = json['id'],
        postId = json['publicacion'],
        studentId = json['usuario'],
        status = json['estado'],
        isPaid = json['pagado'],
        date = json['fecha'],
        stateChenged = json['estado_cambiado'];

  @override
  String toString() {
    return 'Request(requestId: $requestId, studentId: $studentId, postId: $postId, status: $status, isPaid: $isPaid, date: $date, stateChenged: $stateChenged, post: $post)';
  }
}
