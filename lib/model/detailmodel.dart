class DetailItemModel {
  final String id;
  final List<String> categoriesid;
  final String image;
  final String title;
  final double price;
  final String description;
  final String unit;
  final int quantity;

  DetailItemModel({required this.unit, required this.description,
    required this.id,
    required this.categoriesid,
    required this.image,
    required this.title,
    required this.price,
    this.quantity = 1});

  Map toJson()=> {
    'id': id,
    'categoriesId': categoriesid,
    'image': image,
    'title': title,
    'price': price,
  };
}