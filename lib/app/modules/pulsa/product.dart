class Product {
  final String provider;
  final String productCode;
  final String productName;
  final String price;
  final String type;

  Product({
    required this.provider,
    required this.productCode,
    required this.productName,
    required this.price,
    required this.type,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      provider: json['provider'],
      productCode: json['productCode'],
      productName: json['productName'],
      price: json['price'],
      type: json['type'],
    );
  }
}
