import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> updateInstock(
    {required String inStock, required String itemId}) async {
  String _url =
      'https://www.gikgos.online/api/v1/seller/inventory/updateInstock';
  return await http.patch(Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
      },
      body: jsonEncode(<String?, String?>{'Id': itemId, 'InStock': inStock}));
}

Future<http.Response> updateSellingPrice(
    {required String sellingPrice, required String itemId}) async {
  print(sellingPrice);
  String _url = 'https://www.gikgos.online/api/v1/seller/inventory/updateSP';
  return await http.patch(Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
      },
      body: jsonEncode(
          <String?, String?>{'Id': itemId, 'SellingPrice': sellingPrice}));
}
