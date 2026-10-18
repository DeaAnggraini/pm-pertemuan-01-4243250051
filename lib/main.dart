import 'package:flutter/material.dart';

void main() {
  runApp(const HelloApp());
}

// Widget akar aplikasi.
class HelloApp extends StatelessWidget {
  const HelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HelloPage(),
    );
  }
}

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemrograman Mobile'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(size: 96),
            SizedBox(height: 24),
            Text(
              'Hello, World!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Nama : Dea Anggraini'),
            Text('NIM : 4243250051'),
            Text('Kelas : PSIK 24 C'),
            SizedBox(height: 16),
            // Widget tambahan pilihan sendiri (syarat tugas)
            Icon(Icons.favorite, color: Colors.red, size: 40),
          ],
        ),
      ),
    );
  }
}