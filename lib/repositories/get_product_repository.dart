import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onlineshop/models/get_product_model.dart';

class GetProductRepository {
  String getProUrl = "https://fakestoreapi.com/products";
  Future<List<GetProductModel>> getProFetch() async {
    final response = await http.get(Uri.parse(getProUrl));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
      return (jsonDecode(response.body) as List)
          .map((data) => GetProductModel.fromJson(data))
          .toList();
      } else {
        throw Exception("Xatolik bor ${response.statusCode}");
      }
    } catch (err) {
      print(response.statusCode);
      print("Xato repo");
      return (jsonDecode(response.body) as List)
          .map((e) => GetProductModel.fromJson(e))
        .toList();
    }
  }
}
