import 'package:estu_residencia_app/domain/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedSectionProvider = StateProvider<int>((ref) => 0);
final loggedUserProvider = StateProvider<User?>((ref) => null);
