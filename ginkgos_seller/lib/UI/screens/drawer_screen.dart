import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/screens/balanceScreen.dart';
import 'package:ginkgos_seller/UI/screens/completedOrders.dart';
import 'package:ginkgos_seller/UI/screens/ginkgosStore.dart';
import 'package:ginkgos_seller/UI/screens/helpScreen.dart';
import 'package:ginkgos_seller/UI/screens/inventoryScreen.dart';
import 'package:ginkgos_seller/UI/screens/profileScreen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              DrawerTile(
                title: 'My Profile',
                iconData: Icons.account_circle_sharp,
                route: ProfileScreen.id,
              ),
              DrawerTile(
                title: 'Completed Orders',
                iconData: Icons.thumb_up_alt_outlined,
                route: CompletedOrders.id,
              ),
              DrawerTile(
                title: 'Balance',
                iconData: Icons.account_balance_outlined,
                route: BalanceScreen.id,
              ),
              DrawerTile(
                title: 'My Inventory',
                iconData: Icons.inventory_2_outlined,
                route: InventoryScreen.id,
              ),
              DrawerTile(
                title: 'Ginkgos Store',
                iconData: Icons.store_mall_directory_outlined,
                route: GinkgosStoreScreen.id,
              ),
              DrawerTile(
                title: 'Help',
                iconData: Icons.help_outline,
                route: HelpScreen.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    this.title,
    this.iconData,
    this.arguments,
    required this.route,
  }) : super(key: key);
  final title;
  final String route;
  final iconData;
  final arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey[200]!,
            child: Icon(iconData, color: Colors.red)),
        horizontalTitleGap: 0,
        onTap: () {
          Navigator.popAndPushNamed(context, route);
        },
      ),
    );
  }
}
