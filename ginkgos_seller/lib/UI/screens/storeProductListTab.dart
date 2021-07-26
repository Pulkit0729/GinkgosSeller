import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ginkgos_seller/UI/widgets/storeProductCard.dart';
import 'package:ginkgos_seller/backend/getProductList.dart';
import 'package:ginkgos_seller/backend/models/storeProduct.dart';

class ProductListTab extends StatelessWidget {
  final String category;
  const ProductListTab({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getItemsIdList(category),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // if (snapshot.connectionState == ConnectionState.done) {
          //   if (snapshot.hasData) {
          return GridView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.5)),
              itemBuilder: (BuildContext context, int index) {
                return StoreProductCard(
                  storeProduct: StoreProduct(
                    image: [
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-lGG100wPjSZqwwiob120fKzMVMeQM56FWg&usqp=CAU'
                    ],
                    name: 'Croton',
                    short: 'good',
                    id: '123',
                  ),
                  // product: Product.fromJson(snapshot.data[index]), storeProduct: null,
                );
              });
          //   } else {
          //     return Text('Check Internet Connection');
          //   }
          // } else {
          //   return SpinKitCircle(color: Colors.blue);
          // }
        });
  }
}
