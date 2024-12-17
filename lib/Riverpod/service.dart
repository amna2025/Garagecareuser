import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier for managing the dialog state
class DialogStateNotifier extends StateNotifier<bool> {
  DialogStateNotifier() : super(false);

  // Function to open the dialog
  void openDialog() => state = true;

  // Function to close the dialog
  void closeDialog() => state = false;
}

// Provider for accessing the dialog state
final dialogStateProvider = StateNotifierProvider<DialogStateNotifier, bool>((ref) {
  return DialogStateNotifier();
});
