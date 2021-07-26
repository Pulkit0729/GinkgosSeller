import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/screens/plantsTab.dart';
import 'package:ginkgos_seller/UI/screens/storeProductListTab.dart';
import 'package:ginkgos_seller/UI/screens/searchScreenStore.dart';

class GinkgosStoreScreen extends StatelessWidget {
  static String id = 'ginkgosStore';
  const GinkgosStoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Ginkgos Store'),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                        child: Icon(Icons.search_outlined, size: 26.0),
                        onTap: () {
                          Navigator.pushNamed(context, StoreSearchScreen.id);
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
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              PlantsTab(),
              ProductListTab(
                category: 'Pots',
              ),
              ProductListTab(category: 'Accessories'),
            ],
          ),
        ));
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
