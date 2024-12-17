// password_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/Riverpod/setting.dart';


class PasswordField extends ConsumerWidget {
  final String label;

  PasswordField({required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the password visibility state
    final isPasswordVisible = ref.watch(passwordVisibilityProvider);

    return TextField(
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SvgPicture.asset(
            "assets/svgs/Password.svg",
            color: Colors.grey,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            size: 18,
            isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
          onPressed: () {
            ref.read(passwordVisibilityProvider.notifier).toggleVisibility();
          },
        ),
      ),
    );
  }
}
