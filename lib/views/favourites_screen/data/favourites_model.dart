class FavoritePlace {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String rate;

  FavoritePlace({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'rate': rate,
    };
  }

  factory FavoritePlace.fromJson(Map<String, dynamic> json) {
    return FavoritePlace(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      rate: json['rate'],
    );
  }
}
