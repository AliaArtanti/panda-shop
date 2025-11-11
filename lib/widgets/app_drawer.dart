import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/add_product_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Panda Shop Menu",
              style: TextStyle(color: Colors.white),
            ),
          ),

          ListTile(
            title: const Text("Halaman Utama"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),

          ListTile(
            title: const Text("Tambah Produk"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AddProductPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
