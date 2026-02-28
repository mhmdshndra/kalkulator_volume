import 'package:flutter/material.dart';

class KalkulatorScreen extends StatelessWidget {
  final String title;
  final Widget formWidget;

  const KalkulatorScreen({Key? key, required this.title, required this.formWidget}) : super(key: key);

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
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Hitung Volume $title",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: formWidget,
        ),
      ),
    );
  }
}