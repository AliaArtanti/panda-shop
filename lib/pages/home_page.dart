import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'product_list_page.dart';
import 'add_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3E9), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF79B84C),
        foregroundColor: Colors.white,
        title: const Text(
          "Panda Shop",
          style: TextStyle(fontFamily: "Inter"),
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                "Welcome to Panda Shop!",
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF79B84C),
                ),
              ),

              const SizedBox(height: 30),

              // VIEW PRODUCTS BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF79B84C),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProductListPage()),
                    );
                  },
                  child: const Text("View My Products"),
                ),
              ),

              const SizedBox(height: 16),

              // ADD PRODUCT BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF79B84C),
                    side: const BorderSide(color: Color(0xFF79B84C), width: 2),
                    textStyle: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddProductPage()),
                    );
                  },
                  child: const Text("Add New Product"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
