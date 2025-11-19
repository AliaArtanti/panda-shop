class Product {
  final int id;
  final String name;
  final int price;
  final String description;
  final String thumbnail;
  final String category;
  final bool isFeatured;
  final String owner;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.owner,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      description: json["description"],
      thumbnail: json["thumbnail"],
      category: json["category"],
      isFeatured: json["is_featured"],
      owner: json["owner"],
    );
  }
}
