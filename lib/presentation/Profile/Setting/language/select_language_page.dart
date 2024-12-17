import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/Riverpod/setting.dart';
import 'package:garagecare/presentation/Profile/Setting/language/components/language_tile.dart';


class SelectLanguagePage extends ConsumerWidget {
  final VoidCallback onNavigateBack;

  const SelectLanguagePage({super.key, required this.onNavigateBack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguageIndex = ref.watch(selectedLanguageProvider.state);

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildAppBar(context, width),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selected Language',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                LanguageTile(
                  flagUrl: "assets/svgs/us.svg",
                  language: 'English (US)',
                  isSelected: selectedLanguageIndex.state == 0,
                  onTap: () {
                    selectedLanguageIndex.state = 0;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Other Languages',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                ..._buildOtherLanguages(selectedLanguageIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double width) {
    return Container(
      height: 110,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: onNavigateBack,
            ),
            Expanded(
              child: Text(
                'Select Language',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.055,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOtherLanguages(StateController<int> selectedLanguageIndex) {
    final languages = [
      {"flagUrl": "assets/svgs/arbi.svg", "language": "عربى"},
      {"flagUrl": "assets/svgs/uk.svg", "language": "English (UK)"},
      {"flagUrl": "assets/svgs/hindi.svg", "language": "Hindi"},
    ];

    return List.generate(languages.length, (index) {
      final language = languages[index];
      return Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: LanguageTile(
          flagUrl: language["flagUrl"]!,
          language: language["language"]!,
          isSelected: selectedLanguageIndex.state == index + 1,
          onTap: () {
            selectedLanguageIndex.state = index + 1;
          },
        ),
      );
    });
  }
}
