import 'dart:math';
import 'package:flutter/material.dart';

class BolaForm extends StatefulWidget {
  const BolaForm({Key? key}) : super(key: key);

  @override
  _BolaFormState createState() => _BolaFormState();
}

class _BolaFormState extends State<BolaForm> {
  final _rController = TextEditingController();
  String? _hasil;
  String? _langkah;
  String? _errorMessage;

  String _formatAngka(double nilai) {
    if (nilai % 1 == 0) {
      String hasil = nilai.toInt().toString();
      return hasil.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    } else {
      String hasil = nilai.toStringAsFixed(2);
      List<String> parts = hasil.split('.');
      String ribuan = parts[0].replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
      return '$ribuan,${parts[1]}';
    }
  }

  void _hitung() {
    FocusScope.of(context).unfocus();

    if (_rController.text.trim().isEmpty) {
      setState(() {
        _errorMessage = "Harap isi kolom jari-jari terlebih dahulu!";
        _hasil = null;
        _langkah = null;
      });
      return;
    }

    double r = double.tryParse(_rController.text) ?? 0;
    
    double piValue = (r % 7 == 0 && r != 0) ? (22 / 7) : 3.14;
    String piString = (r % 7 == 0 && r != 0) ? "22/7" : "3,14";

    double hitung = (4 / 3) * piValue * pow(r, 3);

    setState(() {
      _errorMessage = null;
      _langkah = "Volume = 4/3 × π × r³\n"
                 "Volume = 4/3 × $piString × (${_formatAngka(r)})³\n"
                 "Volume = 4/3 × $piString × ${_formatAngka(pow(r, 3).toDouble())}";
      _hasil = _formatAngka(hitung);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Masukkan Nilai", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              TextField(
                controller: _rController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Jari-jari Bola (r)",
                  hintText: "Contoh: 7",
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE74C3C),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: _hitung,
                  child: const Text("Hitung Sekarang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        if (_errorMessage != null)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.red),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        if (_hasil != null && _errorMessage == null)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFE74C3C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE74C3C).withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Langkah Penyelesaian:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFE74C3C))),
                const SizedBox(height: 8),
                Text(_langkah!, style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: Colors.black12, thickness: 1),
                ),
                const Text("Total Volume Bola", style: TextStyle(fontSize: 14, color: Colors.black54)),
                const SizedBox(height: 8),
                Text(
                  _hasil!,
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Color(0xFFE74C3C)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}