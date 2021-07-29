import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> storeSearchQuery(String text) async {
  String _url = 'http://13.127.160.96/api/v1/store/search';

  var data = await http.post(Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
      },
      body: jsonEncode(<String?, String?>{'query': text}));
  return jsonDecode(data.body);
}

Future<List<dynamic>> inventorySearchQuery(String text) async {
  String _url = 'http://13.127.160.96//api/v1/seller/inventory/search';

  var data = await http.post(Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
      },
      body: jsonEncode(<String?, String?>{
        'query': text,
        'SellerId': FirebaseAuth.instance.currentUser!.email!.split('@')[0]
      }));
  return jsonDecode(data.body);
}
