import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController thumbnailController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  bool isFeatured = false;
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    thumbnailController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F3E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF79B84C),
        foregroundColor: Colors.white,
        title: const Text(
          "Add Product",
          style: TextStyle(fontFamily: "Inter"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF79B84C),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  "Create New Product",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 24),

                buildInputField("Product Name", nameController, isRequired: true),
                buildInputField("Price", priceController, isRequired: true, isNumber: true),
                buildInputField("Description", descriptionController, isRequired: true),
                buildInputField("Thumbnail URL", thumbnailController, isRequired: true),
                buildInputField("Category", categoryController, isRequired: true),

                const SizedBox(height: 16),

                // IS FEATURED SWITCH
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF79B84C),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white70),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Is Featured?",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 16,
                        ),
                      ),
                      Switch(
                        value: isFeatured,
                        activeColor: Colors.white,
                        activeTrackColor: Colors.lightGreenAccent,
                        onChanged: (value) {
                          setState(() {
                            isFeatured = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // SUBMIT BUTTON
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF79B84C),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: isLoading ? null : () async {
                  
                      print("=== DEBUG ADD PRODUCT ===");
                      print("Logged in: ${request.loggedIn}");
                      print("Cookies: ${request.cookies}");
                      
                      if (!request.loggedIn) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please login first!"),
                            backgroundColor: Colors.red,
                          ),
                        );
                        Navigator.pushReplacementNamed(context, '/login');
                        return;
                      }

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          print("Sending request to add product...");
                          
                          final response = await request.post(
                            "http://localhost:8000/flutter/add/",
                            {
                              "name": nameController.text,
                              "price": priceController.text,
                              "description": descriptionController.text,
                              "thumbnail": thumbnailController.text,
                              "category": categoryController.text,
                              "is_featured": isFeatured.toString(),
                            },
                          );

                          print("Response: $response");

                          if (context.mounted) {
                            if (response["status"] == "success") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Product added successfully!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pop(context, true);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Error: ${response['message'] ?? 'Unknown error'}"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        } catch (e) {
                          print("Error: $e");
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Error: $e"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } finally {
                          if (mounted) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      }
                    },
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFF79B84C),
                            ),
                          )
                        : const Text(
                            "Submit",
                            style: TextStyle(fontFamily: "Inter", fontSize: 18),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(
    String label,
    TextEditingController controller, {
    bool isRequired = false,
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF79B84C),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white70),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextFormField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return '$label is required';
            }
            if (isNumber && value != null && value.isNotEmpty) {
              if (int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
            }
            return null;
          },
        ),
      ),
    );
  }
}