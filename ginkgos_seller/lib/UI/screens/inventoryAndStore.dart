import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/screens/plantsTab.dart';
import 'package:ginkgos_seller/UI/screens/productListTab.dart';
import 'package:ginkgos_seller/UI/screens/searchScreen.dart';
import 'package:ginkgos_seller/backend/models/categoryClass.dart';
import 'package:ginkgos_seller/main.dart';

class InventoryAndStore extends StatelessWidget {
  static String inventory = 'inventory';
  static String store = 'store';
  static String id = 'InventoryAndStore';
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    String type = arg.type!;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: type == store ? kStoreColor : Colors.blue,
                title:
                    Text(type == inventory ? 'My Inventory' : 'Ginkgos Store'),
                actions: [
                  Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                          child: Icon(Icons.search_outlined, size: 26.0),
                          onTap: () {
                            Navigator.pushNamed(context, SearchScreen.id,
                                arguments: ScreenArguments(type: type));
                          }))
                ],
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 6,
                    tabs: [
                      Tab(child: Text('Plants')),
                      Tab(child: Text('Pots')),
                      Tab(child: Text('Accessories')),
                    ])),
            body:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              PlantsTab(type: type),
              ProductListTab(type: type, category: Category.pots),
              ProductListTab(type: type, category: Category.accessory)
            ])));
  }
}
// Padding(
// padding: EdgeInsets.all(5),
// child: GestureDetector(
// child: Column(
// children: [
// CircleAvatar(
// radius: 35,
// backgroundImage:
// AssetImage('images/product.jpeg')),
// Text(
// 'Ornamentals',
// style: TextStyle(color: Colors.white),
// )
// ],
// ),
// )),
