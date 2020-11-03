import 'dart:math';

import 'package:app_shop/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import '../providers/orders.dart' as orders;
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

//   @override
//   _OrdersScreenState createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
//  var _isLoading = false;
//   @override
//   void initState() {
//     Future.delayed(Duration.zero).then((_) async {
//     setState(() {
//       _isLoading = true;
//     });
//     Provider.of<orders.Orders>(context, listen: false)
//         .fetchAndSetOrders()
//         .then((_) {
//       setState(() {
//         _isLoading = false;
//       });
//     });
//     });

//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<orders.Orders>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: Provider.of<orders.Orders>(context, listen: false)
              .fetchAndSetOrders(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                // DO Error Handling
                return Center(
                  child: Text('An error occurred'),
                );
              } else {
                return Consumer<orders.Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (ctx, index) =>
                        OrderItem(orderData.orders[index]),
                  ),
                );
              }
            }
          },
        )
        //     .fetchAndSetOrders())

        );
  }
}
