import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final thumbnailController = TextEditingController();
  final categoryController = TextEditingController();
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Produk")),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Product Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Nama tidak boleh kosong";
                  if (value.length < 3) return "Minimal 3 karakter";
                  return null;
                },
              ),

              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Wajib diisi";
                  final num? price = num.tryParse(value);
                  if (price == null) return "Harus angka";
                  if (price < 0) return "Tidak boleh negatif";
                  return null;
                },
              ),

              TextFormField(
                controller: descController,
                decoration: const InputDecoration(labelText: "Description"),
                minLines: 2,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Deskripsi wajib diisi";
                  if (value.length < 10) return "Minimal 10 karakter";
                  return null;
                },
              ),

              TextFormField(
                controller: thumbnailController,
                decoration: const InputDecoration(labelText: "Thumbnail URL"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "URL wajib diisi";
                  final uri = Uri.tryParse(value);
                  if (uri == null || !uri.isAbsolute) return "URL tidak valid";
                  return null;
                },
              ),

              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: "Category"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Kategori wajib diisi";
                  return null;
                },
              ),

              SwitchListTile(
                title: const Text("Featured Product"),
                value: isFeatured,
                onChanged: (value) {
                  setState(() => isFeatured = value);
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Produk Ditambahkan"),
                        content: Text(
                          "Name: ${nameController.text}\n"
                          "Price: ${priceController.text}\n"
                          "Desc: ${descController.text}\n"
                          "Thumbnail: ${thumbnailController.text}\n"
                          "Category: ${categoryController.text}\n"
                          "Featured: $isFeatured",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
