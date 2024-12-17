import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpViewModel extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? usernameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;
  bool isLoading = false;

  SignUpViewModel() {
    // Add listener to confirm password field
    confirmPasswordController.addListener(() {
      if (confirmPasswordController.text != passwordController.text) {
        confirmPasswordError = "Passwords do not match.";
      } else {
        confirmPasswordError = null; // Clear the error if they match
      }
      notifyListeners();
    });
  }

  void clearUsernameError() {
    usernameError = null;
    notifyListeners();
  }

  void clearEmailError() {
    emailError = null;
    notifyListeners();
  }

  void clearPasswordError() {
    passwordError = null;
    notifyListeners();
  }

  void clearConfirmPasswordError() {
    confirmPasswordError = null;
    notifyListeners();
  }

  void resetFields() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();

    usernameError = null;
    emailError = null;
    passwordError = null;
    confirmPasswordError = null;

    notifyListeners();
  }

  bool validateFields() {
    usernameError = null;
    emailError = null;
    passwordError = null;
    confirmPasswordError = null;
    bool isValid = true;

    // Validate username
    if (usernameController.text.isEmpty) {
      usernameError = "Username is required.";
      isValid = false;
    }

    // Validate email
    if (emailController.text.isEmpty) {
      emailError = "Email is required.";
      isValid = false;
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(emailController.text)) {
      emailError = "Invalid email address.";
      isValid = false;
    }

    // Validate password
    String password = passwordController.text;
    if (password.isEmpty) {
      passwordError = "Password is required.";
      isValid = false;
    } else if (password.length < 8) {
      passwordError = "Password must be at least 8 characters.";
      isValid = false;
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      passwordError = "Password must contain at least one capital letter.";
      isValid = false;
    } else if (!RegExp(r'\d').hasMatch(password)) {
      passwordError = "Password must contain at least one number.";
      isValid = false;
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      passwordError = "Password must contain at least one special character.";
      isValid = false;
    }

    // Validate confirm password
    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError = "Confirm Password is required.";
      isValid = false;
    } else if (confirmPasswordController.text != passwordController.text) {
      confirmPasswordError = "Passwords do not match.";
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  Future<String?> signUp() async {
    isLoading = true;
    notifyListeners();

    try {
      if (!validateFields()) {
        return null; // Validation failed
      }

      final response = await http.post(
        Uri.parse('https://your-api-url.com/signup'), // Replace with your API URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['success']) {
          return null; // Successful signup
        } else {
          emailError = data['message'];
          notifyListeners();
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
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

final signUpProvider = ChangeNotifierProvider((ref) => SignUpViewModel());
