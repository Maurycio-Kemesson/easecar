class BrandModel {
  String name;
  String image;

  BrandModel({
    required this.name,
    required this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image};
  }
}
