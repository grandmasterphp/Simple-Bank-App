import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkmodeNotifier extends StateNotifier<bool> {
  DarkmodeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final darkmodeNotifierProvider =
    StateNotifierProvider<DarkmodeNotifier, bool>((ref) => DarkmodeNotifier());
