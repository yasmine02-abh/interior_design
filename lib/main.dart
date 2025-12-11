// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/home/presentation/screens/style_selection_screen.dart';
import 'features/upload/presentation/screens/upload_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Interior Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF333333), // Charcoal
          secondary: Color(0xFFBDBDBD), // Warm Gray
          background: Color(0xFFF5F5F5), // Soft White
          surface: Color(0xFFFFFFFF),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFF333333),
          onBackground: Color(0xFF333333),
          onSurface: Color(0xFF333333),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Soft White
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F5F5),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF333333)),
          titleTextStyle: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF333333), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF333333), // Charcoal
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF333333),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        useMaterial3: true,
      ),
      
      // Use home for the default screen (when app starts)
      home: const LoginScreen(),
      
      // Define all routes in one map
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/style-selection': (context) => const StyleSelectionScreen(),
        '/upload': (context) => const UploadScreen(),
      },
    );
  }
}