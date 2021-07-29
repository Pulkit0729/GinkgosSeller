import 'dart:convert';

class InventoryProduct {
  final String itemId;
  final String name;
  final String height;
  final String diameter;
  final String sellingPrice;
  final List<dynamic> images;
  final String inStock;

  InventoryProduct({
    required this.name,
    required this.height,
    required this.images,
    required this.inStock,
    required this.itemId,
    required this.diameter,
    required this.sellingPrice,
  });

  factory InventoryProduct.fromJson(json) {
    print(json);
    return InventoryProduct(
        name: json['Name'],
        height: json['Height'],
        images: jsonDecode(json['Images']),
        inStock: json['InStock'].toString(),
        itemId: json['ID'].toString(),
        sellingPrice: json['SellingPrice'].toString(),
        diameter: json['Diameter']);
  }
}
