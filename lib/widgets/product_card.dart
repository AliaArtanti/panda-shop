import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Card(
          color: const Color(0xFFE9F3D8),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.thumbnail, 
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Text info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TITLE
                      Text(
                        product.name, 
                        style: const TextStyle(
                          color: Color(0xFF79B84C),
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // PRICE
                      Text(
                        "Rp ${product.price}", 
                        style: const TextStyle(
                          color: Color(0xFF79B84C),
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // DESCRIPTION
                      Text(
                        product.description, 
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // CATEGORY + FEATURED
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
                            visualDensity: VisualDensity.compact,
                          ),
                          const SizedBox(width: 6),
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
                              visualDensity: VisualDensity.compact,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
