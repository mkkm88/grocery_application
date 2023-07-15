class ProductModel {
  String id;
  String img;
  String? title;
  double? price;

  ProductModel(this.id, this.img, {this.title, this.price});

  Map toJson() => {'id': id, 'img': img, 'title': title, 'price': price};
}

final List<ProductModel> imageinfo = [
  ProductModel(DateTime.now().toString(), 'assets/images/BakeryImg.jpg',
      title: "30% off on bakery"),
  ProductModel(DateTime.now().toString(), 'assets/images/fruitimg.jpg',
      title: "30% discount on Fruits"),
];

final List<ProductModel> fruits = [
  ProductModel(DateTime.now().toString(), 'assets/images/AppleImg.jpg',
      title: "Apple", price: 1.80),
  ProductModel(DateTime.now().toString(), 'assets/images/OrangeImg.jpg',
      title: "Orange", price: 3.00),
  ProductModel(DateTime.now().toString(), 'assets/images/BananaImg.png',
      title: "Banana", price: 2.00),
  ProductModel(DateTime.now().toString(), 'assets/images/GrapesImg.jpg',
      title: "Grapes", price: 5.00),
  ProductModel(DateTime.now().toString(), 'assets/images/KiwiImg.jpg',
      title: "Kiwi", price: 10.99),
  ProductModel(DateTime.now().toString(), 'assets/images/PearImg.jpg',
      title: "Pear", price: 7.99),
];
final List<ProductModel> AuthImages = [
  ProductModel(DateTime.now().toString(), 'assets/images/img.jpg',
      title: "Logo"),
  ProductModel(DateTime.now().toString(), 'assets/images/google.png',
      title: "Google"),
  ProductModel(DateTime.now().toString(), 'assets/images/facebook.png',
      title: "Facebook"),
  ProductModel(DateTime.now().toString(), 'assets/images/apple.png',
      title: "Apple"),
];

class CartModel {
  String? id;
  String? img;
  String? title;
  double? price;
  int multiplier = 0;

  CartModel({this.id, this.img, this.title, this.price});

  Map toJson() => {
        'id': id,
        'img': img,
        'title': title,
        'price': price,
        'multiplier': multiplier
      };

  CartModel.fromProduct(ProductModel model) {
    model.id;
    model.img;
    model.title;
    model.price;
  }
}
