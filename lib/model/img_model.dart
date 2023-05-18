import 'detailmodel.dart';

class imageModel{
  String id;
  String img;
  String? title;
  double? price;
  Function? onTap;
  imageModel(this.id, this.img, {this.title, this.price,this.onTap});

  Map toJson()=>{
    'id':id,
    'img':img,
    'title': title,
    'price': price
  };
}

final List<imageModel> imageinfo = [
  imageModel(DateTime.now().toString(), 'assets/images/BakeryImg.jpg',title: "30% off on bakery"),
  imageModel(DateTime.now().toString(), 'assets/images/fruitimg.jpg',title: "30% discount on Fruits"),
];

final List<imageModel> fruitsCategoriesImages = [
  imageModel(DateTime.now().toString(), 'assets/images/AppleImg.jpg', title: "Apple", price: 1.80),
  imageModel(DateTime.now().toString(), 'assets/images/OrangeImg.jpg', title: "Orange", price: 3.00),
  imageModel(DateTime.now().toString(), 'assets/images/BananaImg.png', title: "Banana", price: 2.00),
  imageModel(DateTime.now().toString(), 'assets/images/GrapesImg.jpg', title: "Grapes", price: 5.00),
  imageModel(DateTime.now().toString(), 'assets/images/KiwiImg.jpg', title: "Kiwi", price: 10.99),
  imageModel(DateTime.now().toString(), 'assets/images/PearImg.jpg', title: "Pear", price: 7.99),
];
final List<imageModel> AuthImages = [
  imageModel(DateTime.now().toString(), 'assets/images/img.jpg', title: "Logo"),
  imageModel(DateTime.now().toString(), 'assets/images/google.png', title: "Google"),
  imageModel(DateTime.now().toString(), 'assets/images/facebook.png', title: "Facebook"),
  imageModel(DateTime.now().toString(), 'assets/images/apple.png', title: "Apple"),
];
final List<imageModel> favoriteItems = [];