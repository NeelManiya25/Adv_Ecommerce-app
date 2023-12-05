import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/add-remove_cart.dart';
import '../../modal/api_modal.dart';

class cart_page extends StatefulWidget {
  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    List<FakeStoreData>? cartItems =
        ModalRoute.of(context)!.settings.arguments as List<FakeStoreData>?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: cartItems?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${cartItems![index].image}"))),
            ),
            title: Text(cartItems[index].category),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .removeFromCart(cartItems![index]);
              },
            ),
          );
        },
      ),
    );
  }
}
