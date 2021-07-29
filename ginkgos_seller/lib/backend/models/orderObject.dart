import 'package:firebase_database/firebase_database.dart';

class Order {
  final String orderId;
  final String orderDate;
  final String modeOfPayment;
  final String status;
  final String sellerId;
  final List<OrderItem> orderItems;

  Order({
    required this.modeOfPayment,
    required this.orderId,
    required this.orderDate,
    required this.status,
    required this.orderItems,
    required this.sellerId,
  });
  factory Order.fromJson(DataSnapshot json) {
    print(json.value['OrderItems']);
    return Order(
      modeOfPayment: json.value['ModeOfPayment'],
      orderId: json.value['OrderId'],
      orderDate: json.value['OrderDate'],
      orderItems: buildOrderItemsExternal(
          json.value['OrderItems'], json.value['OrderId']),
      sellerId: json.value['SellerId'],
      status: json.value['Status'],
    );
  }
}

class OrderItem {
  final name;
  final qty;
  final price;

  OrderItem({
    this.name,
    this.qty,
    this.price,
  });

  factory OrderItem.fromExternalJson(
      Map<Object?, Object?> json, String orderId) {
    return OrderItem(
        name: json['Name'], price: json['Price'], qty: json['Qty']);
  }
}

List<OrderItem> buildOrderItemsExternal(List list, String orderId) {
  List<OrderItem> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(OrderItem.fromExternalJson(list[i], orderId));
  }
  return result;
}

Future<List<Order>> retrieveOrders(List<String> ids) async {
  List<Order> list = [];
  for (var id in ids) {
    list.add(await FirebaseDatabase.instance
        .reference()
        .child('OrdersV2')
        .child(id)
        .get()
        .then((DataSnapshot? snapshot) => (Order.fromJson(snapshot!))));
  }
  return list;
}
