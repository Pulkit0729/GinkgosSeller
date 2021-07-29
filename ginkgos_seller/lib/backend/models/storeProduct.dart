import 'dart:convert';

class StoreProduct {
  const StoreProduct({
    required this.id,
    required this.name,
    required this.short,
    required this.images,
    required this.description,
  });
  final String id;
  final String name;
  final String short;
  final String description;
  final List<dynamic> images;
  factory StoreProduct.fromJson(json) {
    return StoreProduct(
        id: json['ID'].toString(),
        name: json['Name'].toString(),
        short: json['ShortDescription'].toString(),
        images: jsonDecode(json['Images']),
        description: json['Description'].toString());
  }
}
