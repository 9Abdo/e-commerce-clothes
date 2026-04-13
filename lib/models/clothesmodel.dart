class Clothesmodel {
  final String image;
  final String clothesType;
  final double price;
  final String description;
  final int id;

  Clothesmodel({
    required this.id,
    required this.image,
    required this.clothesType,
    required this.price,
    required this.description,
  });
  factory Clothesmodel.fromjson(Map<String, dynamic> json) {
    return Clothesmodel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      image: json['images'][0] ?? "",
      clothesType: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }
}
