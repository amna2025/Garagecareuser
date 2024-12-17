import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController emailOrUsernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailOrUsernameError;
  String? passwordError;
  bool rememberMe = false;
  bool isLoading = false;
  Color passwordFieldColor = Colors.grey.shade100;

  void toggleRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  void clearEmailOrUsernameError() {
    emailOrUsernameError = null;
    notifyListeners();
  }

  void clearPasswordError() {
    passwordError = null;
    notifyListeners();
  }

  bool validateFields() {
    emailOrUsernameError = null;
    passwordError = null;
    bool isValid = true;

    // Validate email or username
    if (emailOrUsernameController.text.isEmpty) {
      emailOrUsernameError = "Email or Username is required.";
      isValid = false;
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(emailOrUsernameController.text) &&
        !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(emailOrUsernameController.text)) {
      emailOrUsernameError = "Enter a valid email or username.";
      isValid = false;
    }

    // Validate password
    if (passwordController.text.isEmpty) {
      passwordError = "Password is required.";
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passwordError = "Password must be at least 8 characters.";
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  Future<String?> signIn() async {
    isLoading = true;
    notifyListeners();

    try {
      // Validate fields before proceeding
      if (!validateFields()) {
        return null; // Validation failed, show existing error messages
      }

      // Simulate API call for sign-in
      final response = await http.post(
        Uri.parse('https://your-api-url.com/signin'), // Replace with your API URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'emailOrUsername': emailOrUsernameController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['success']) {
          passwordFieldColor = Colors.green;
          return null; // Successful sign-in
        } else {
          passwordError = data['message'];
          passwordFieldColor = Colors.red;
        }
      } else {
        return "An error occurred. Please try again.";
      }
    } catch (e) {
      return "An error occurred. Please try again.";
    } finally {
      isLoading = false;
      notifyListeners();
    }

    return null;
  }

  Future<String?> signUp() async {
    isLoading = true;
    notifyListeners();

    try {
      if (!validateFields()) {
        return null; // Validation failed, show existing error messages
      }

      final response = await http.post(
        Uri.parse('https://your-api-url.com/signup'), // Replace with your API URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'emailOrUsername': emailOrUsernameController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['success']) {
          return null; // Successful signup
        } else {
          emailOrUsernameError = data['message'];
        }
      } else {
        return "An error occurred. Please try again.";
      }
    } catch (e) {
      return "An error occurred. Please try again.";
    } finally {
      isLoading = false;
      notifyListeners();
    }

    return null;
  }

  @override
  void dispose() {
    emailOrUsernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void clearTextFields() {
    emailOrUsernameController.clear();
    passwordController.clear();
  }
}

final signInProvider = ChangeNotifierProvider((ref) => SignInViewModel());
