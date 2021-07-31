import 'dart:convert';
import 'package:ginkgos_seller/backend/models/uncompletedInventoryProduct.dart';
import 'package:http/http.dart' as http;

Future<http.Response> addToInventory(
    IncompleteInventoryProduct incompleteInventoryProduct,
    String sellerId) async {
  String _url = 'https://www.gikgos.online/api/v1/store/add';

  var data = await http
      .post(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
        },
        body: jsonEncode(<String?, String?>{
          'ItemId': incompleteInventoryProduct.id,
          'Height': incompleteInventoryProduct.height,
          'Diameter': incompleteInventoryProduct.diameter,
          'SellingPrice': incompleteInventoryProduct.sellingPrice,
          'InStock': incompleteInventoryProduct.inStock,
          'SellerId': sellerId,
        }),
      )
      .timeout(Duration(seconds: 4));
  print(data);
  return data;
}
