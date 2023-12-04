import 'package:flutter/material.dart';

import '../../modal/api_modal.dart';

class Details_page extends StatefulWidget {
  const Details_page({super.key});

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  @override
  Widget build(BuildContext context) {
    FakeStoreData data =
        ModalRoute.of(context)!.settings.arguments as FakeStoreData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("${data.image}"),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ActionChip(label: Text("Price : ${data.price}")),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Title : ${data.title}"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Category : ${data.category}"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text("Description : ${data.description}"),
          ],
        ),
      ),
    );
  }
}
