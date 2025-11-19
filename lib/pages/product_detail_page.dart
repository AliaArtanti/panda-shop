import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3E9),
      appBar: AppBar(
        title: Text(
          product.name, 
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF79B84C),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  product.thumbnail, 
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 220,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.name, 
              style: const TextStyle(
                color: Color(0xFF79B84C),
                fontFamily: 'Inter',
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),


            Text(
              "Rp ${product.price}", 
              style: const TextStyle(
                color: Color(0xFF79B84C),
                fontFamily: 'Inter',
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 20),


            Row(
              children: [
                Chip(
                  label: Text(
                    product.category, 
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                    ),
                  ),
                  backgroundColor: const Color(0xFF79B84C),
                ),
                const SizedBox(width: 8),
                if (product.isFeatured) 
                  const Chip(
                    label: Text(
                      "Featured",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                      ),
                    ),
                    backgroundColor: Colors.amber,
                  ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Description",
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product.description, 
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                height: 1.4,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                const Icon(Icons.person, size: 20, color: Colors.black54),
                const SizedBox(width: 6),
                Text(
                  "Owner: ${product.owner}", 
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Center(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF79B84C),
                  side: const BorderSide(color: Color(0xFF79B84C)),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  "Back to list",
                  style: TextStyle(fontFamily: 'Inter'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
