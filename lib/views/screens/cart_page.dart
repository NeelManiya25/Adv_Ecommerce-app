import 'package:flutter/material.dart';

import '../../modal/api_modal.dart';
import 'package:pdf/pdf.dart' as pdf;

class cart_page extends StatefulWidget {
  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  List<FakeStoreData>? cartItems;

  @override
  dynamic total = 0;

  void initState() {
    super.initState();
    cartItems?.forEach((element) {
      total += element.price as dynamic;
    });
  }

  Widget build(BuildContext context) {
    List<FakeStoreData>? cartItems =
        ModalRoute.of(context)!.settings.arguments as List<FakeStoreData>?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network("${cartItems![index].image}"),
                  title: Text(cartItems[index].category),
                  subtitle: Text(cartItems[index].price.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      removeFromCart(index);
                    },
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Container(
                // height: 100,
                // width: 150,
                child: Text(
                  "RS.${total}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.picture_as_pdf))
            ],
          ),
        ],
      ),
    );
  }

  void removeFromCart(int index) {
    setState(() {
      cartItems!.removeAt(index);
    });
  }
}
