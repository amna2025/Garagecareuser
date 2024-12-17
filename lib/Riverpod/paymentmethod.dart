import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodNotifier extends StateNotifier<String?> {
  PaymentMethodNotifier() : super(null);

  // Method to set the selected payment method
  void selectPaymentMethod(String method) {
    state = method;
  }
}

// Create a provider for the PaymentMethodNotifier
final paymentMethodProvider = StateNotifierProvider<PaymentMethodNotifier, String?>((ref) {
  return PaymentMethodNotifier();
});
