import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/screens/balanceScreen.dart';
import 'package:ginkgos_seller/UI/screens/completedOrders.dart';
import 'package:ginkgos_seller/UI/screens/ginkgosStore.dart';
import 'package:ginkgos_seller/UI/screens/helpScreen.dart';
import 'package:ginkgos_seller/UI/screens/inventoryScreen.dart';
import 'package:ginkgos_seller/UI/screens/login_screen.dart';
import 'package:ginkgos_seller/UI/screens/main_screen.dart';
import 'package:ginkgos_seller/UI/screens/orderDetailsScreen.dart';
import 'package:ginkgos_seller/UI/screens/profileScreen.dart';
import 'package:ginkgos_seller/UI/screens/searchScreenStore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: auth.currentUser == null ? LoginScreen.id : MainScreen.id,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          MainScreen.id: (context) => MainScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          CompletedOrders.id: (context) => CompletedOrders(),
          BalanceScreen.id: (context) => BalanceScreen(),
          InventoryScreen.id: (context) => InventoryScreen(),
          GinkgosStoreScreen.id: (context) => GinkgosStoreScreen(),
          StoreSearchScreen.id: (context) => StoreSearchScreen(),
          HelpScreen.id: (context) => HelpScreen(),
          OrderDetailsScreen.id: (context) => OrderDetailsScreen()
        });
  }
}

class ScreenArguments {
  final int? index;
  final String? phone;
  final String? list;
  final String? orderId;
  ScreenArguments({this.list, this.index, this.phone, this.orderId});
}
