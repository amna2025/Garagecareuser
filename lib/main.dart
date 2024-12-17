import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/core/routes/app_routes.dart';
import 'package:garagecare/core/routes/on_generate_route.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: RouteGenerator.onGenerate,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}

