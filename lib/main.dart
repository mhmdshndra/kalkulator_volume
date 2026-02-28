import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const VolumeApp());
}

class VolumeApp extends StatelessWidget {
  const VolumeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Volume Ruang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D3142)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}