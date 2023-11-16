import 'package:flutter_riverpod/flutter_riverpod.dart';




final filterAreaMinProvider = StateProvider<int>((ref) => 0 );
final filterComunaProvider = StateProvider<int>((ref) => 0 );


final filterMinPriceProvider = StateProvider<int>((ref) => 0 );
final filterMaxPriceProvider = StateProvider<int>((ref) => 3000000 );

