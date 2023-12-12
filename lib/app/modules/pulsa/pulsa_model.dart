class PulsaModel {
  String provider;
  String productCode;
  String productName;

  PulsaModel(this.provider, this.productCode, this.productName);
}

// class ProductModel {
//   final String productCode;
//   final String productName;
//   final String price;

//   ProductModel({
//     required this.productCode,
//     required this.productName,
//     required this.price,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       productCode: json['productCode'],
//       productName: json['productName'],
//       price: json['price'],
//     );
//   }
// }
