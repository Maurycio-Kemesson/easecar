import '../../domain/enuns/store_type_enum.dart';

class StoryProfileModel {
  final String imageUrl;
  final String name;
  final String location;
  final int ratingStars;
  final int reviewCount;
  final StoreTypeEnum type;

  StoryProfileModel({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.ratingStars,
    required this.reviewCount,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'location': location,
      'ratingStars': ratingStars,
      'reviewCount': reviewCount,
      'type': type,
    };
  }

  factory StoryProfileModel.fromMap(Map<String, dynamic> map) {
    return StoryProfileModel(
      imageUrl: map['imageUrl'],
      name: map['name'],
      location: map['location'],
      ratingStars: map['ratingStars'],
      reviewCount: map['reviewCount'],
      type: map['type'],
    );
  }
}
