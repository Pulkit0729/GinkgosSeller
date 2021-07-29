import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ginkgos_seller/UI/screens/inventoryAndStore.dart';
import 'package:ginkgos_seller/UI/widgets/inventoryProductCard.dart';
import 'package:ginkgos_seller/UI/widgets/store/storeProductCard.dart';
import 'package:ginkgos_seller/backend/getProductList.dart';
import 'package:ginkgos_seller/backend/models/inventoryProduct.dart';
import 'package:ginkgos_seller/backend/models/storeProduct.dart';

class ProductListTab extends StatelessWidget {
  final String type;
  final String category;
  const ProductListTab({Key? key, required this.category, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: type == InventoryAndStore.store
            ? getStoreFromCategory(category)
            : getInventoryFromCategory(category),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return type == InventoryAndStore.store
                  ? GridView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.5)),
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
              return Text('Check Internet Connection');
            }
          } else {
            return SpinKitCircle(color: Colors.blue);
          }
        });
  }
}
