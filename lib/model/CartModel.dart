import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'detailmodel.dart';
import 'img_model.dart';
import 'item.dart';

class CartModel extends ChangeNotifier {
  int current = 0;
  int currentIndex = 0;
  Position? currentPosition;
  var currentAddress;
  CarouselController controller = CarouselController();

  void getCurrentLocation() async {
    Position position = await _determinePosition();
    currentPosition = position;
    getAddressFromLatLng(currentPosition!);
    notifyListeners();
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemark) {
      Placemark place = placemark[0];
      currentAddress =
      '${place.street}, ${place.subLocality}\n${place.subAdministrativeArea}, ${place.postalCode}';
      notifyListeners();
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission are denied');
      }
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  void increement() {
    current++;
    notifyListeners();
  }

  void decreement() {
    if (current > 0) {
      current--;
    }
    notifyListeners();
  }

  setIndex(int i) {
    currentIndex = i;
    notifyListeners();
  }

  findbyid(String id) {
    return CategoryDetailItemDb.where(
            (element) => element.categoriesid.contains(id)).toList();
  }

  final List<imageModel> CategoriesImages = [
    imageModel('c1', 'assets/images/ChickenImg.jpg', title: "Chicken"),
    imageModel('c2', 'assets/images/ChocolateImg.jpg', title: "Chocolate"),
    imageModel('c3', 'assets/images/DailyProductImg.jpg', title: "Daily Products"),
    imageModel('c4', 'assets/images/DrinksImg.jpg', title: "Drinks"),
    imageModel('c5', 'assets/images/FishImg.jpg', title: "Fish"),
    imageModel('c6', 'assets/images/FruitCircularImg.jpg', title: "Fruits"),
    imageModel('c7', 'assets/images/IcecreamImg.jpg', title: "Ice Creams"),
    imageModel('c8', 'assets/images/JamsImg.jpg', title: "Jams"),
    imageModel('c9', 'assets/images/MeatImg.jpg', title: "Meat"),
    imageModel('c10', 'assets/images/SweetsImg.jpg', title: "Sweets"),
    imageModel('c11', 'assets/images/VegetablesImg.jpg', title: "Vegetables"),
  ];

  final List<imageModel> CircularImages = [
    imageModel('c1', 'assets/images/ChickenImg.jpg', title: "Chicken"),
    imageModel('c2', 'assets/images/ChocolateImg.jpg', title: "Chocolate"),
    imageModel('c3', 'assets/images/DailyProductImg.jpg', title: "Daily Products"),
    imageModel('c4', 'assets/images/DrinksImg.jpg', title: "Drinks"),
    imageModel('c5', 'assets/images/FishImg.jpg', title: "Fish"),
  ];

  final List<DetailItemModel> CategoryDetailItemDb = [
    DetailItemModel(
        description:
        "Fried chicken, also known as Southern fried chicken, is a dish consisting of chicken pieces that have been coated with seasoned flour or batter and pan-fried, deep fried, pressure fried, or air fried.",
        categoriesid: ['c1'],
        id: 'm1',
        image:
        'https://i.pinimg.com/564x/ca/88/9d/ca889d0a804d390726646b973a291468.jpg',
        title: 'Fry Chicken',
        price: 29.99,
        unit: " / kg"),
    DetailItemModel(
        unit: " / pcs",
        description:
        "A chicken sandwich is a sandwich that typically consists of boneless, skinless chicken breast or thigh served between slices of bread, on a bun, or on a roll.",
        categoriesid: ['c2'],
        id: 'm2',
        image:
        'https://i.pinimg.com/564x/a7/73/88/a7738832dd035aef3d4b781562d7e86b.jpg',
        title: 'Chicken Sandwich',
        price: 19.99),
    DetailItemModel(
        unit: " / ltr",
        description:
        "Whole cow's milk contains about 87% water. The remaining 13% contains protein, fat, carbohydrates, vitamins, and minerals.",
        categoriesid: ['c3'],
        id: 'm3',
        image:
        'https://i.pinimg.com/564x/55/63/d7/5563d7dd390f77ff390d55cba866ab7a.jpg',
        title: 'Whole Milk',
        price: 39.99),
    DetailItemModel(
        unit: " / pcs",
        description:
        "Rockstar Energy Drink contains Caffeine, Taurine, guarana, ginseng, and milk thistle. Formulated for those who lead active lifestyles, from athletes to rock stars.",
        categoriesid: ['c4'],
        id: 'm4',
        image:
        'https://i.pinimg.com/564x/a8/d2/7a/a8d27a79e3f93f11a80da9c52df00693.jpg',
        title: 'Rockstar Drink',
        price: 09.99),
    DetailItemModel(
        unit: " / kg",
        description:
        "fish meal, coarsely ground powder made from the cooked flesh of fish. Though formerly important as a fertilizer, fish meal is now primarily used in animal feed—especially for poultry, swine, mink, farm-raised fish, and pets.",
        categoriesid: ['c5'],
        id: 'm5',
        image:
        'https://i.pinimg.com/564x/d8/1c/0f/d81c0f550bcfcf59324881c47126312e.jpg',
        title: 'Fish Food',
        price: 59.99),
    DetailItemModel(
        unit: " / kg",
        description:
        "orange, any of several species of small trees or shrubs of the genus Citrus of the family Rutaceae and their nearly round fruits, which have leathery and oily rinds and edible, juicy inner flesh.",
        categoriesid: ['c6'],
        id: 'm6',
        image:
        'https://i.pinimg.com/564x/7a/aa/a5/7aaaa545e00e8a434850e80b8910dd94.jpg',
        title: 'Orange',
        price: 05.99),
    DetailItemModel(
        unit: " / ltr",
        description:
        "Re-create that old-fashioned ice cream parlor restaurant look without leaving the house - or spending the dough. All it takes is a little creativity, a whole lot of ice cream, and these 6, 12-ounce classic-style fountain shoppe glasses to get the whole family together for a little homemade dessert.",
        categoriesid: ['c7'],
        id: 'm7',
        image:
        'https://i.pinimg.com/736x/c5/8f/07/c58f07f9b1bfd5847d4137a869ed5b4f.jpg',
        title: 'Libbey MilkShake',
        price: 34.99),
    DetailItemModel(
        unit: " / 100gr",
        description:
        "Our Rhubarb & Ginger Jam is delicious on freshly baked bread and warm buttered crumpets. Add to smoothies and yogurts for a real lift of flavour.",
        categoriesid: ['c8'],
        id: 'm8',
        image:
        'https://i.pinimg.com/564x/00/c6/79/00c67941801b586b461dc6c83ce3a64a.jpg',
        title: 'Rhubarb & Ginger',
        price: 05.89),
    DetailItemModel(
        unit: " / kg",
        description:
        "Easy and delicious baked boneless ribeye roast recipe with a crunchy crust and tons of juicy ribeye flavor in less than 3 hours!",
        categoriesid: ['c9'],
        id: 'm9',
        image:
        'https://i.pinimg.com/564x/35/9a/f1/359af1294f9cfc9276518545111f33b0.jpg',
        title: 'Beef Ribeye Roast',
        price: 91.99),
    DetailItemModel(
        unit: " / pcs",
        description:
        "It is pink in colour, slightly reminiscent of 'Ruby' chocolate. However, it is white chocolate. The white chocolate is creamy and milky, and the chunks of strawberry fruit are chewy: with a tangy and 'fruity' taste.",
        categoriesid: ['c10'],
        id: 'm10',
        image:
        'https://i.pinimg.com/564x/c0/dc/7b/c0dc7b8028f0e2f6be97a934abf9e1e0.jpg',
        title: 'Strawberry Chocolate',
        price: 69.99),
    DetailItemModel(
        unit: " / kg",
        description:
        "The flesh of Coccinia is crunchy with a mild bitter after taste but the matured ones taste even sweeter.",
        categoriesid: ['c11'],
        id: 'm11',
        image:
        'https://i.pinimg.com/564x/b6/d5/d1/b6d5d18b3535ee965662460d08264dbd.jpg',
        title: 'Tindora',
        price: 10.69),
  ];
}