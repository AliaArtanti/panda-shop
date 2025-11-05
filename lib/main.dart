import 'package:flutter/material.dart';

void main() {
  runApp(const PandaShopApp());
}

class PandaShopApp extends StatelessWidget {
  const PandaShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panda Shop – Football Shop',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green, 
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Panda Shop – Football Shop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Headline / branding sederhana
            const Text(
              'Football Shop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // All Products (biru)
            SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showSnackBar(context, 'Kamu telah menekan tombol All Products');
                },
                icon: const Icon(Icons.sports_soccer),
                label: const Text('All Products'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // warna biru
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // My Products (hijau)
            SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showSnackBar(context, 'Kamu telah menekan tombol My Products');
                },
                icon: const Icon(Icons.inventory_2),
                label: const Text('My Products'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // warna hijau
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Create Product (merah)
            SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showSnackBar(context, 'Kamu telah menekan tombol Create Product');
                },
                icon: const Icon(Icons.add_circle),
                label: const Text('Create Product'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // warna merah
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const Spacer(),

          
            const Center(
              child: Text(
                '⚽ Temukan perlengkapan sepak bola favoritmu di Panda Shop!',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
