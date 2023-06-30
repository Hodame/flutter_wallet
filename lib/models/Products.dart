class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final num discountPercentage;
  final num rating;
  final num srock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.srock,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      srock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json["images"].map((x) => x)),
    );
  }
}

class Products {
  final int total;
  final int limit;
  final int skip;
  final List<Product> products;

  Products({
    required this.total,
    required this.limit,
    required this.skip,
    required this.products,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List;
    List<Product> productList = list.map((x) => Product.fromJson(x)).toList();

    return Products(
        limit: json['limit'],
        total: json['total'],
        skip: json['skip'],
        products: productList);
  }
}
