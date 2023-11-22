import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onlineshop/models/user_by_basket_model.dart';

class UserBasketAdminRepository {
  String url = "https://fakestoreapi.com/carts?userId=1";

  Future<List<UserBybasketModel>> getUserBasketAdminFetch() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (jsonDecode(response.body) as List)
            .map((e) => UserBybasketModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Xatolik ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString() + "Xato repo");
    }
  }
}
