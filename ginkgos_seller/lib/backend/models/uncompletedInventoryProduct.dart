import 'package:http/http.dart' as http;

class IncompleteInventoryProduct {
  final String id;
  final String height;
  final String diameter;
  final String sellingPrice;
  final String inStock;

  IncompleteInventoryProduct(
      {required this.height,
      required this.diameter,
      required this.sellingPrice,
      required this.inStock,
      required this.id});

  // factory IncompleteInventoryProduct.fromJson(json) {
  //   return IncompleteInventoryProduct(
  //       height: json['Height'],
  //       diameter: json['Diameter'],
  //       sellingPrice: '',
  //       inStock: json['InStock'],
  //       id: json['ID']);
  // }
}
