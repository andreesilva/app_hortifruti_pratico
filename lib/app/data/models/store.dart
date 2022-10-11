import 'package:app_hortifruti_pratico/app/data/models/category.dart';

class StoreModel {
  int id;
  String nome;
  String image;
  bool isOnline;
  List<CategoryModel> categories;

  StoreModel(
      {required this.id,
      required this.nome,
      required this.image,
      required this.isOnline,
      required this.categories});

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'],
      nome: json['nome'],
      image: json['logo'],
      isOnline: json['online'] == 1,
      categories: json['categorias'] == null
          ? []
          : List<CategoryModel>.from(json["categorias"]
              .map((category) => CategoryModel.fromJson(category))));
}
