import 'package:flutter/material.dart';
import 'package:ginkgos_seller/backend/models/storeProduct.dart';

class StoreProductCard extends StatelessWidget {
  final StoreProduct storeProduct;
  const StoreProductCard({Key? key, required this.storeProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, ProductDescriptionScreen.id,
        //     arguments: ScreenArguments(product: product));
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                  right: BorderSide(color: Colors.grey[300]!))),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(storeProduct.image[0]))),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      storeProduct.name,
                      maxLines: 1,
                    ),
                    Text(storeProduct.short != 'null'
                        ? storeProduct.short
                        : 'Good'),
                    SizedBox(height: 7),
                  ]),
            ),
          ])),
    );
  }
}
