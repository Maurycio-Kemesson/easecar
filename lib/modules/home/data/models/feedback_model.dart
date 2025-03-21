class FeedbackModel {
  String clientName;
  String clientPhoto;
  String comment;
  double rating;

  FeedbackModel({
    required this.clientName,
    required this.clientPhoto,
    required this.comment,
    required this.rating,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      clientName: json['clientName'],
      clientPhoto: json['clientPhoto'],
      comment: json['comment'],
      rating: (json['rating'] as num).toDouble(), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientName': clientName,
      'clientPhoto': clientPhoto,
      'comment': comment,
      'rating': rating,
    };
  }
}
