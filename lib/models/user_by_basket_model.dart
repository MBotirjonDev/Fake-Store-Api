// To parse this JSON data, do
//
//     final userBybasketModel = userBybasketModelFromJson(jsonString);

import 'dart:convert';

List<UserBybasketModel> userBybasketModelFromJson(String str) => List<UserBybasketModel>.from(json.decode(str).map((x) => UserBybasketModel.fromJson(x)));

String userBybasketModelToJson(List<UserBybasketModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserBybasketModel {
    int id;
    int userId;
    DateTime date;
    List<Product> products;
    int v;

    UserBybasketModel({
        required this.id,
        required this.userId,
        required this.date,
        required this.products,
        required this.v,
    });

    factory UserBybasketModel.fromJson(Map<String, dynamic> json) => UserBybasketModel(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "__v": v,
    };
}

class Product {
    int productId;
    int quantity;

    Product({
        required this.productId,
        required this.quantity,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
    };
}
