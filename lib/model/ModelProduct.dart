class Modelproduct {
  final int id;
  final String title;
  final String image;
  final String category;
  final String description;
  final dynamic price;
  final RatingModel rating;

  Modelproduct({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
  });

  factory Modelproduct.fromJson(Map<String, dynamic> jsonData) {
    return Modelproduct(
      id: jsonData['id'],
      title: jsonData['title'],
      image: jsonData['image'],
      category: jsonData['category'],
      description: jsonData['description'],
      price: (jsonData['price']),
      // تحويل السعر إلى double
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : RatingModel(count: 0, rate: 0.0),
    );
  }
}

class RatingModel {
  final int count;
  final double rate;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      count: jsonData['count'],
      rate: (jsonData['rate']).toDouble(), // تحويل التقييم إلى double
    );
  }
}
