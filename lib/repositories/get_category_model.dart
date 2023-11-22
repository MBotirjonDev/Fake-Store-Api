import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onlineshop/models/get_category.dart';

class GetCategory {
  String urlCategory = "https://fakestoreapi.com/products/categories";

  Future<List<CategoryModel>> getCategory() async {
    final response = await http.get(Uri.parse(urlCategory));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (jsonDecode(response.body) as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Xatolik bor ${response.statusCode}");
      }
    } catch (e) {
      print("Xato repo");
      print(response.statusCode);

      return (jsonDecode(response.body) as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    }
  }
}
// json xatoligi sababli kelmadi

// ["electronics","jewelery","men's clothing","women's clothing"] shu json to'g'rimi 