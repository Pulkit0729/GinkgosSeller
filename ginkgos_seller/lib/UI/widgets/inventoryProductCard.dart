import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/screens/inventoryProductDescription.dart';
import 'package:ginkgos_seller/UI/widgets/customLoadingBar.dart';
import 'package:ginkgos_seller/UI/widgets/customSnackBar.dart';
import 'package:ginkgos_seller/backend/models/inventoryProduct.dart';
import 'package:ginkgos_seller/backend/updateProduct.dart';

class InventoryProductCard extends StatefulWidget {
  final InventoryProduct inventoryProduct;
  const InventoryProductCard({Key? key, required this.inventoryProduct})
      : super(key: key);

  @override
  _InventoryProductCardState createState() => _InventoryProductCardState();
}

class _InventoryProductCardState extends State<InventoryProductCard> {
  late bool _value;
  @override
  void initState() {
    _value = widget.inventoryProduct.inStock == '0' ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Expanded(
          flex: 5,
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => InventoryProductDescription(
                      inventoryProduct: widget.inventoryProduct)));
            },
            contentPadding: EdgeInsets.zero,
            leading: Image.network(widget.inventoryProduct.images[0]),
            title: Text(widget.inventoryProduct.name),
            subtitle: Text(widget.inventoryProduct.height),
            horizontalTitleGap: 0,
          )),
      Expanded(
          flex: 1,
          child: SwitchListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsets.zero,
              value: _value,
              onChanged: (bool value) async {
                LoadingBar.createLoading(context);
                var response = await updateInstock(
                    inStock: value ? '1' : '0',
                    itemId: widget.inventoryProduct.itemId);
                if (response.statusCode == 200) {
                  Navigator.pop(context);
                  setState(() {
                    _value = value;
                  });
                  CustomSnackWidgets.buildErrorSnackBar(context,
                      value ? 'Added Successfully' : 'Removed Successfully');
                } else {
                  Navigator.pop(context);
                  CustomSnackWidgets.buildErrorSnackBar(
                      context, 'Error Occurred');
                }
              }))
    ]));
  }
}
