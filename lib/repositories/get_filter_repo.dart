import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onlineshop/models/filter_category_model.dart';

class FilterCategoryRepository {
  static String? urildata;

  Future<List<CategoryTapModel>> getFilter() async {
    String urlFilter = "https://fakestoreapi.com/products/category/$urildata";

    try {
      final response = await http.get(Uri.parse(urlFilter));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(urildata);
        print(urlFilter);

        List<CategoryTapModel> listPro;
        listPro = (jsonDecode(response.body) as List)
            .map((data) => CategoryTapModel.fromJson(data))
            .toList();
        print(response.statusCode);

        print(listPro);

        return listPro;
      } else {
        throw Exception("Xatolik bor ${response.statusCode}");
      }
    } catch (e) {
      final response = await http.get(Uri.parse(urlFilter));
      print("Xato repo");
      return (jsonDecode(response.body) as List)
          .map((data) => CategoryTapModel.fromJson(data))
          .toList();
    }
  }
}
