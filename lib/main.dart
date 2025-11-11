import 'package:flutter/material.dart';
import 'pages/home_page.dart';

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
