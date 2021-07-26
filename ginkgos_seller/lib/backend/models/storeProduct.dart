import 'dart:convert';

class StoreProduct {
  const StoreProduct({
    required this.id,
    required this.name,
    required this.short,
    required this.image,
  });
  final String id;
  final String name;
  final String short;
  final List<dynamic> image;
  factory StoreProduct.fromJson(json) {
    return StoreProduct(
        id: json['ID'].toString(),
        name: json['Name'].toString(),
        short: json['ShortDescription'].toString(),
        image: jsonDecode(json['Images']));
  }
}
