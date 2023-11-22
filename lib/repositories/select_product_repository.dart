import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onlineshop/models/select_product_model.dart';

class SelectProRepository {
  static String? selectId;

  Future<List<SelectProductModel>> selectProFetch() async {
    print(selectId);
    try {
      final response = await http.get(Uri.parse(selectId!));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (jsonDecode(response.body) as List)
            .map((e) => SelectProductModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Xatolik bor ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Server bilan bog'liq xatolik: $e");
    }
  }
}
