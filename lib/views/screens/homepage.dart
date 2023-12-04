import 'package:adv_ecommerce_app/views/screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/api_helper.dart';
import '../../modal/api_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FakeStoreData>? cartItems = [];

  void addToCart(FakeStoreData item) {
    cartItems!.add(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Myntra"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(cart_page(), arguments: cartItems);
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: FutureBuilder(
          future: ApiHelper.apiHelper.fetchApiData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<FakeStoreData>? data = snapshot.data;
              return GridView.builder(
                itemCount: data!.length,
                padding: EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 250),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("${data[index].image}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${data[index].category}"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("Details_page",
                                    arguments: data[index]);
                              },
                              child: Text("more"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                addToCart(data[index]);
                                print(data[index]);
                                setState(() {
                                  cartItems?.add(data as FakeStoreData);
                                });
                              },
                              child: Text("ADD"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
