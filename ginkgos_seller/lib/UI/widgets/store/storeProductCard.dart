import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/screens/storeProductDescription.dart';
import 'package:ginkgos_seller/UI/widgets/store/addToInventoryBottomSheet.dart';
import 'package:ginkgos_seller/backend/models/storeProduct.dart';

class StoreProductCard extends StatelessWidget {
  final StoreProduct storeProduct;
  const StoreProductCard({Key? key, required this.storeProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StoreProductDescription(
                    storeProduct: storeProduct,
                  )));
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                    right: BorderSide(color: Colors.grey[300]!))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 6,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(storeProduct.images[0])))),
                  Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(storeProduct.name, maxLines: 1),
                                Text(storeProduct.short != 'null'
                                    ? storeProduct.short
                                    : 'Good'),
                                SizedBox(height: 7)
                              ]))),
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kStoreColor)),
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return AddToInventory(
                                          id: storeProduct.id,
                                          name: storeProduct.name);
                                    });
                              },
                              child: Text('Add to Inventory',
                                  style: TextStyle(color: Colors.white)))))
                ])));
  }
}
