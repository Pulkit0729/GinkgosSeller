import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/screens/storeProductListTab.dart';

class PlantsTab extends StatefulWidget {
  const PlantsTab({Key? key}) : super(key: key);

  @override
  _PlantsTabState createState() => _PlantsTabState();
}

class _PlantsTabState extends State<PlantsTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

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
                  indicatorColor: Colors.blue,
                  indicatorWeight: 4,
                  labelColor: Colors.black,
                  controller: _tabController,
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
            controller: _tabController,
            children: [
              ProductListTab(
                category: 'Ornamentals',
              ),
              ProductListTab(
                category: 'Flowers',
              ),
              ProductListTab(
                category: 'Fruits',
              ),
              ProductListTab(
                category: 'Medicinal',
              ),
            ],
          ),
        ));
  }
}
