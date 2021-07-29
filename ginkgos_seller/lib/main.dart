import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/screens/balanceScreen.dart';
import 'package:ginkgos_seller/UI/screens/completedOrders.dart';
import 'package:ginkgos_seller/UI/screens/inventoryAndStore.dart';
import 'package:ginkgos_seller/UI/screens/helpScreen.dart';
import 'package:ginkgos_seller/UI/screens/login_screen.dart';
import 'package:ginkgos_seller/UI/screens/main_screen.dart';
import 'package:ginkgos_seller/UI/screens/profileScreen.dart';
import 'package:ginkgos_seller/UI/screens/searchScreen.dart';

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
          InventoryAndStore.id: (context) => InventoryAndStore(),
          SearchScreen.id: (context) => SearchScreen(),
          HelpScreen.id: (context) => HelpScreen(),
        });
  }
}

class ScreenArguments {
  final int? index;
  final String? type;
  ScreenArguments({
    this.type,
    this.index,
  });
}
