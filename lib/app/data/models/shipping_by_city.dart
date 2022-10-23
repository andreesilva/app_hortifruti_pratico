class ShippingCityModel {
  int id;
  String name;
  String cost;
  
  ShippingCityModel(
      {required this.id,
      required this.name,
      required this.cost,
     });

  factory ShippingCityModel.fromJson(Map<String, dynamic> json) => ShippingCityModel(
      id: json['id'],
      name: json['cidade'],
      cost: json['custo_entrega'].toString(),
      );
}