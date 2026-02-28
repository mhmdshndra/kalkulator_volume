import 'package:flutter/material.dart';
import 'kalkulator_screen.dart';
import '../widgets/kubus_form.dart';
import '../widgets/kerucut_form.dart';
import '../widgets/bola_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 81, 116),
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        title: const Text(
          'Kalkulator Volume Ruang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                "Daftar Bangun Ruang",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildMenuCard(
                      context,
                      title: 'Kubus',
                      subtitle: 'Sisi x Sisi x Sisi',
                      imagePath: 'assets/kubus.png',
                      color: const Color(0xFF4A90E2),
                      targetWidget: const KubusForm(),
                    ),
                    _buildMenuCard(
                      context,
                      title: 'Kerucut',
                      subtitle: '1/3 x π x r² x t',
                      imagePath: 'assets/kerucut.png',
                      color: const Color(0xFF4A90E2),
                      targetWidget: const KerucutForm(),
                    ),
                    _buildMenuCard(
                      context,
                      title: 'Bola',
                      subtitle: '4/3 x π x r³',
                      imagePath: 'assets/bola.png',
                      color: const Color(0xFF4A90E2),
                      targetWidget: const BolaForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {required String title, required String subtitle, required String imagePath, required Color color, required Widget targetWidget}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KalkulatorScreen(title: title, formWidget: targetWidget)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(imagePath, width: 32, height: 32, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported, color: color)),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2D3142))),
                      const SizedBox(height: 4),
                      Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}