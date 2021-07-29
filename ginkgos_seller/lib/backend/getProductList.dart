import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getStoreFromCategory(String category) async {
  ///Fetching list from server////
  String _url = "http://13.127.160.96/api/v1/store/itemsList/$category";
  var data = await http.get(Uri.parse(_url), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
  });
  return jsonDecode(data.body);
}

Future<List<dynamic>> getInventoryFromCategory(String category) async {
  ///Fetching list from server////
  String _url =
      "http://13.127.160.96/api/v1/seller/${FirebaseAuth.instance.currentUser!.email!.split('@')[0]}/category/$category";
  var data = await http.get(Uri.parse(_url), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
  });
  return jsonDecode(data.body);
}
