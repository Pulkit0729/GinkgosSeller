import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/screens/acceptedOrders.dart';
import 'package:ginkgos_seller/UI/screens/completedOrders.dart';
import 'package:ginkgos_seller/UI/screens/drawer_screen.dart';
import 'package:ginkgos_seller/UI/screens/newOrders.dart';
import 'package:ginkgos_seller/UI/screens/outForDelivery.dart';

import '../../main.dart';

class MainScreen extends StatefulWidget {
  static String id = 'Main_Screen';
  final temp;

  const MainScreen({Key? key, this.temp}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var arg;

  DateTime? currentBackPressTime;

  List<Widget> _bottomDrawerOptions = [];

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    _bottomDrawerOptions = <Widget>[
      NewOrdersScreen(),
      AcceptedOrders(),
      OutForDelivery(),
    ];

    super.initState();

    ///To access buildContext in initState we use future
    Future.delayed(Duration.zero, () {
      setState(() {
        arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      });
      arg != null ? _selectedIndex = arg.index : _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        title: Text('Ginkgos'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  child: Icon(Icons.thumb_up_alt_outlined, size: 26.0),
                  onTap: () {
                    Navigator.pushNamed(context, CompletedOrders.id);
                  }))
        ],
      ),
      body: WillPopScope(
          onWillPop: onWillPop, child: _bottomDrawerOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        selectedItemColor: kPrimaryDark,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Accepted',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Out for Delivery',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
