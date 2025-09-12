

class ProductModel {
  final String title;
  final double price;
  final String image;
  final String category;
  final String description;
  final double rating;
  final int ratingCount;


  ProductModel({required this.title,required this.price, required this.image,required this.category,required this.description, required this.rating, required this.ratingCount});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      category: json['category'],
      description: json['description'],
      rating: json['rating'] != null ? json['rating']['rate'].toDouble() : 0.0,
      ratingCount: json['rating'] != null ? json['rating']['count'] : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'image': image,
      'category': category,
      'description': description,
      'rating': {
        'rate': rating,
        'count': ratingCount,
      },
    };
  }
  

}