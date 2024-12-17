import 'package:flutter_riverpod/flutter_riverpod.dart';

// ServicePackage model
class ServicePackage {
  final String id;
  final String name;
  final String description;
  final double price;
  final String  assetImageUrl;

  ServicePackage({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this. assetImageUrl,
  });
}

// ServiceProvider to manage selected services
class ServiceSelectionNotifier extends StateNotifier<List<bool>> {
  ServiceSelectionNotifier() : super([false, false, false, false]);

  void toggleService(int index) {
    state[index] = !state[index];
    state = [...state]; // Notify listeners
  }
}

// Provider declaration
final serviceSelectionProvider = StateNotifierProvider<ServiceSelectionNotifier, List<bool>>((ref) {
  return ServiceSelectionNotifier();
});


class ServiceDetail {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ServiceDetail({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Provider for service details
final serviceDetailProvider = Provider<ServiceDetail>((ref) {
  return ServiceDetail(
    name: 'Basic Service',
    description: 'Our Basic Service Package is the perfect solution for those who want to ensure their vehicle is running smoothly without breaking the bank...',
    price: 159.00,
    imageUrl: 'assets/images/default.png', // Default image, can be updated
  );
});


// Booking State
class BookingState {
  final bool isSearchVisible;
  final bool isCustomerDetailsVisible;
  final bool isDeliveryDetailsVisible;
  final String searchText;
  final String? selectedAddress;

  BookingState({
    required this.isSearchVisible,
    required this.isCustomerDetailsVisible,
    required this.isDeliveryDetailsVisible,
    required this.searchText,
    this.selectedAddress,
  });

  BookingState copyWith({
    bool? isSearchVisible,
    bool? isCustomerDetailsVisible,
    bool? isDeliveryDetailsVisible,
    String? searchText,
    String? selectedAddress,
  }) {
    return BookingState(
      isSearchVisible: isSearchVisible ?? this.isSearchVisible,
      isCustomerDetailsVisible: isCustomerDetailsVisible ?? this.isCustomerDetailsVisible,
      isDeliveryDetailsVisible: isDeliveryDetailsVisible ?? this.isDeliveryDetailsVisible,
      searchText: searchText ?? this.searchText,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }
}

// Booking Notifier
class BookingNotifier extends StateNotifier<BookingState> {
  BookingNotifier()
      : super(BookingState(
    isSearchVisible: false,
    isCustomerDetailsVisible: false,
    isDeliveryDetailsVisible: false,
    searchText: '',
    selectedAddress: null,
  ));

  void toggleSearchVisibility() {
    state = state.copyWith(isSearchVisible: !state.isSearchVisible);
  }

  void toggleCustomerDetailsVisibility() {
    state = state.copyWith(isCustomerDetailsVisible: !state.isCustomerDetailsVisible);
  }

  void toggleDeliveryDetailsVisibility() {
    state = state.copyWith(isDeliveryDetailsVisible: !state.isDeliveryDetailsVisible);
  }

  void updateSearchText(String text) {
    state = state.copyWith(searchText: text);
  }

  void updateSelectedAddress(String? address) {
    state = state.copyWith(selectedAddress: address);
  }
}

// Provider
final bookingProvider = StateNotifierProvider<BookingNotifier, BookingState>((ref) {
  return BookingNotifier();
});