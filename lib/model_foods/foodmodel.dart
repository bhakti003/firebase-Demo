class FoodModel {
  int? id;
  String? image;
  String? catorgy;
  String? name;
  String? price;
  bool? isFavorite;

  FoodModel({this.id,this.image, this.catorgy,this.name, this.price, this.isFavorite});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    catorgy = json['catorgy'];
    name = json['name'];
    price = json['price'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['catorgy'] = this.catorgy;
    data['name'] = this.name;
    data['price'] = this.price;
    data['isFavorite'] = this.isFavorite;
    return data;
  }

}