import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedLanguageProvider = StateProvider<int>((ref) => 0);
// password_visibility_provider.dart


class PasswordVisibilityNotifier extends StateNotifier<bool> {
  PasswordVisibilityNotifier() : super(true); // default to obscure text

  void toggleVisibility() {
    state = !state;
  }
}

final passwordVisibilityProvider =
StateNotifierProvider<PasswordVisibilityNotifier, bool>((ref) {
  return PasswordVisibilityNotifier();
});
