import 'package:app_hortifruti_pratico/app/data/models/category.dart';
import 'package:app_hortifruti_pratico/app/data/models/payment_method.dart';
import 'package:app_hortifruti_pratico/app/data/models/shipping_by_city.dart';

class StoreModel {
  int id;
  String nome;
  String image;
  bool isOnline;
  List<CategoryModel> categories;
  List<ShippingCityModel> shippingByCity;
  List<PaymentMethodModel> paymentMethods;

  StoreModel(
      {required this.id,
      required this.nome,
      required this.image,
      required this.isOnline,
      required this.categories,
      required this.shippingByCity,
      required this.paymentMethods});

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'],
      nome: json['nome'],
      image: json['logo'],
      isOnline: json['online'] == 1,
      categories: json['categorias'] == null
          ? []
          : List<CategoryModel>.from(json["categorias"]
              .map((category) => CategoryModel.fromJson(category))),
      shippingByCity: json['cidades'] == null
          ? []
          : List<ShippingCityModel>.from(json["cidades"]
              .map((city) => ShippingCityModel.fromJson(city))),
      paymentMethods: json['meios_pagamentos'] == null
          ? []
          : List<PaymentMethodModel>.from(json["meios_pagamentos"]
              .map((paymentMethod) => PaymentMethodModel.fromJson(paymentMethod))),        
   );
}
