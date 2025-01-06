// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/pages/dashboard_page.dart';
import 'package:flutter_ppks_apps/pages/register_page.dart';
import 'pages/login_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/register': (context) => const RegisterPage(),
        '/dashboard': (context) => const DashboardPage(),
      }, 
    );
  }
}
