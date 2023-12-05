import 'package:flutter/cupertino.dart';
import 'package:neel/helper/api_helper.dart';

import '../../modal/api_modal.dart';

class Product_provider extends ChangeNotifier {
  Future<List<FakeStoreData>?> productdata() async {
    List<FakeStoreData>? data = await ApiHelper.apiHelper.fetchApiData();
    return data;
  }
}
