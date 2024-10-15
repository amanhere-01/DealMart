import 'package:deal_mart/presentation/pages/home_page.dart';
import 'package:deal_mart/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      // home: const SignIn(),
      home: HomePage(),
    );
  }
}

