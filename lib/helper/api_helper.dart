import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/api_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<List<FakeStoreData>?> fetchApiData() async {
    String api = "https://fakestoreapi.com/products";
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List decodeData = jsonDecode(response.body);
      List<FakeStoreData> allData =
          decodeData.map((e) => FakeStoreData.fromAPI(map_data: e)).toList();
      return allData;
    }
    return null;
  }
}
