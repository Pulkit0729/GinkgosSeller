import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/screens/inventoryAndStore.dart';
import 'package:ginkgos_seller/UI/screens/productListTab.dart';
import 'package:ginkgos_seller/backend/models/categoryClass.dart';

class PlantsTab extends StatelessWidget {
  final String type;

  const PlantsTab({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: 60,
              bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: type == InventoryAndStore.inventory
                      ? Colors.blue
                      : kStoreColor,
                  indicatorWeight: 4,
                  labelColor: Colors.black,
                  tabs: [
                    Column(children: [Text('Ornamentals')]),
                    Column(children: [
                      Icon(Icons.local_florist_outlined),
                      Text('Flowers')
                    ]),
                    Column(children: [Text('Fruits')]),
                    Text('Medicinal')
                  ])),
          body: TabBarView(
            children: [
              ProductListTab(
                type: type,
                category: Category.ornamental,
              ),
              ProductListTab(
                type: type,
                category: Category.flowers,
              ),
              ProductListTab(
                type: type,
                category: Category.fruits,
              ),
              ProductListTab(
                type: type,
                category: Category.medicine,
              ),
            ],
          ),
        ));
  }
}
