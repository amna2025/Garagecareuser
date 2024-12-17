import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/core/constants/constants.dart';
import 'package:garagecare/customwidgets/CustomText.dart';
import 'components/filterButton.dart';
import 'components/see_more_text.dart';
import 'components/service_button.dart';
import 'components/urgent_service_button.dart';
import 'components/HeaderWithUserInfo.dart';
import 'components/OnboardingCarousel.dart';
import 'components/SearchAndFilterBar.dart';
import 'components/ServiceCard.dart';

// Riverpod providers
final selectedServiceIndexProvider = StateProvider<int>((ref) => -1);
final currentIndexProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerStatefulWidget {
  final VoidCallback onNavigateToServiceSelection;
  final String username;

  const HomeScreen({
    super.key,
    required this.onNavigateToServiceSelection,
    required this.username,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final PageController _pageController;
  Timer? _timer;
  DateTime? _lastPressed;

  final List<String> onboarding = ["Card 1", "Card 2", "Card 3"];

  final List<Map<String, String>> services = [
    {'imageUrl': 'assets/images/Top.png', 'title': 'Service 1', 'price': '\$50'},
    {'imageUrl': 'assets/images/Top2.png', 'title': 'Service 2', 'price': '\$100'},
    {'imageUrl': 'assets/images/Top2.png', 'title': 'Service 3', 'price': '\$75'},
    {'imageUrl': 'assets/images/Top.png', 'title': 'Service 4', 'price': '\$120'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      final newIndex = _pageController.page?.round();
      if (newIndex != null) {
        ref.read(currentIndexProvider.notifier).state = newIndex;
      }
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final currentIndex = ref.read(currentIndexProvider);
      ref.read(currentIndexProvider.notifier).state = (currentIndex + 1) % onboarding.length;
      _pageController.animateToPage(
        ref.read(currentIndexProvider),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _showFilterModal() {
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        final isSmallScreen = screenSize.width < 600;
        return FilterModal(isSmallScreen: isSmallScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    final selectedServiceIndex = ref.watch(selectedServiceIndexProvider);


    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8.0 : 12.0,
                vertical: isSmallScreen ? 12.0 : 19.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWithUserInfo(username: widget.username),
                  SizedBox(height: isSmallScreen ? 8 : 10),
                  SearchAndFilterBar(onFilterTap: _showFilterModal),
                  SizedBox(height: isSmallScreen ? 8 : 10),
                  OnboardingCarousel(
                    pageController: _pageController,
                    onboardingItems: onboarding,
                    screenWidth: screenWidth,
                  ),
                  SizedBox(height: isSmallScreen ? 5 : 10),
                  const SeeMoreText(),
                  SizedBox(height: isSmallScreen ? 5 : 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ServiceButton(
                          imagePath: 'assets/images/Work.png',
                          title: 'All Services',
                          onTap: widget.onNavigateToServiceSelection,
                          isSelected: selectedServiceIndex == -1,
                          width: isSmallScreen ? 120 : 141,
                        ),
                        SizedBox(width: isSmallScreen ? 4 : 8),
                        ServiceButton(
                          imagePath: 'assets/images/car2.png',
                          title: 'Major Service Package',
                          onTap: () {
                            ref.read(selectedServiceIndexProvider.notifier).state = -2;
                          },
                          isSelected: selectedServiceIndex == -2,
                          width: isSmallScreen ? 190 : 191,
                        ),
                        SizedBox(width: isSmallScreen ? 4 : 8),
                        ServiceButton(
                          imagePath: 'assets/images/car2.png',
                          title: 'Oil Change',
                          onTap: () {
                            ref.read(selectedServiceIndexProvider.notifier).state = -3;
                          },
                          isSelected: selectedServiceIndex == -3,
                          width: isSmallScreen ? 120 : 141,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 5 : 10),
                  const UrgentServiceButton(),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: isSmallScreen ? 10 : 15),
                      const Padding(
                        padding: EdgeInsets.only(left: 1),
                        child: CustomText(
                          text: "Vehicle Services",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,

                        ),
                      ),
                      for (int i = 0; i < services.length; i += 2)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ServiceCard(
                                imageUrl: services[i]['imageUrl']!,
                                title: services[i]['title']!,
                                price: services[i]['price']!,
                              ),
                            ),
                            if (i + 1 < services.length)
                              Expanded(
                                child: ServiceCard(
                                  imageUrl: services[i + 1]['imageUrl']!,
                                  title: services[i + 1]['title']!,
                                  price: services[i + 1]['price']!,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (_lastPressed == null || now.difference(_lastPressed!) > const Duration(seconds: 2)) {
      _lastPressed = now;
      return Future.value(false);
    }
    return Future.value(true);
  }
}
