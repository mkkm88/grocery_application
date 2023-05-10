class DetailItemModel {
  final String id;
  final List<String> categoriesid;
  final String image;
  final String title;
  final double price;
  final String description;
  final String unit;

  DetailItemModel({required this.unit, required this.description,
    required this.id,
    required this.categoriesid,
    required this.image,
    required this.title,
    required this.price});

  Map toJson()=> {
    'id': id,
    'categoriesId': categoriesid,
    'image': image,
    'title': title,
    'price': price,
  };
}