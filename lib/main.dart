// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/app/dashboard_page.dart';
import 'package:flutter_ppks_apps/app/profile_secreen.dart';
import 'package:flutter_ppks_apps/app/register_page.dart';
import 'package:flutter_ppks_apps/core/models/login_view_model.dart';
import 'package:flutter_ppks_apps/core/models/logout_view_model.dart';
import 'package:provider/provider.dart';
import 'app/login_page.dart'; 

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => LogoutViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfileScreen(),
        '/login' : (context) =>  LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        
      }, 
    );
  }
}
