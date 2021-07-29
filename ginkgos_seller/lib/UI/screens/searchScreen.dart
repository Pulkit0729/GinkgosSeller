import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/screens/inventoryAndStore.dart';
import 'package:ginkgos_seller/UI/widgets/inventoryProductCard.dart';
import 'package:ginkgos_seller/UI/widgets/store/storeProductCard.dart';
import 'package:ginkgos_seller/backend/models/inventoryProduct.dart';
import 'package:ginkgos_seller/backend/models/storeProduct.dart';
import 'package:ginkgos_seller/backend/searchQuery.dart';
import 'package:ginkgos_seller/main.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'StoreSearchScreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Timer? debouncer;
  String? text;
  void debounce(VoidCallback callback,
      {Duration duration = const Duration(seconds: 1)}) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  @override
  void dispose() {
    debouncer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    var type = arg.type;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 35,
          child: TextFormField(
            onChanged: (value) {
              debounce(() async {
                setState(() {
                  text = value;
                });
              });
            },
            autofocus: true,
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child:
                        Icon(Icons.search, color: kSecondaryColor, size: 25)),
                prefixIconConstraints: BoxConstraints(maxHeight: 30),
                suffixIconConstraints: BoxConstraints(maxHeight: 20),
                suffixIcon: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.close_sharp, color: Colors.black38))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
                enabledBorder: InputBorder.none,
                fillColor: Colors.white,
                filled: true),
          ),
        ),
      ),
      body: (text == null || text == '')
          ? Container()
          : FutureBuilder(
              future: type == InventoryAndStore.store
                  ? storeSearchQuery(text!)
                  : inventorySearchQuery(text!),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data.toString() != '[]') {
                    print(snapshot.data);
                    return type == InventoryAndStore.store
                        ? GridView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.3)),
                            itemBuilder: (BuildContext context, int index) {
                              return StoreProductCard(
                                storeProduct:
                                    StoreProduct.fromJson(snapshot.data[index]),
                              );
                            })
                        : ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              return InventoryProductCard(
                                  inventoryProduct: InventoryProduct.fromJson(
                                      snapshot.data[index]));
                            });
                  } else {
                    return Text('Nothing Found');
                  }
                } else {
                  return SpinKitCircle(color: kLoadingColor);
                }
              },
            ),
    );
  }
}
