import 'package:app_shop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import '../providers/orders.dart' as orders;
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<orders.Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, index) => OrderItem(orderData.orders[index]),
      ),
    );
  }
}
