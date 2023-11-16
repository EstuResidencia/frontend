import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortProvider = StateProvider((ref) => false);

final sortCategoryProvider = StateProvider<int>((ref) => 0 );
