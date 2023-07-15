import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/UI/Home/search_bar.dart';
import 'package:grocery_application/UI/components/test/data.dart';
import 'package:grocery_application/UI/favorite_page.dart';
import 'package:grocery_application/UI/product.dart';
import 'package:grocery_application/model/CartModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Util/color_constant.dart';
import '../../model/img_model.dart';
import '../cart_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        authProv.getCurrentLocation();
                      },
                      icon: const Icon(
                        Icons.location_on_rounded,
                        color: Color(0xFFF8740F),
                      )),
                  authProv.currentAddress != null
                      ? Text(
                          '${authProv.currentAddress}',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      : const Text('Tap to get location!',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Badge(
                    backgroundColor: Colors.green,
                    isLabelVisible: true,
                    alignment: Alignment.topCenter,
                    label: const Text('3'),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          EvaIcons.bellOutline,
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
              child: TextField(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const Search()));
                },
                keyboardType: TextInputType.none,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Search products',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: const Icon(
                    EvaIcons.searchOutline,
                    color: Color(0xFF818181),
                    size: 23,
                  ),
                  fillColor: const Color(0xFFe6e6e6),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(35)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            25.heightBox,
            VxSwiper(
              aspectRatio: 15 / 8,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              items: imageinfo.map((i) {
                return Stack(
                  children: [
                    Image.asset(
                      i.img,
                      fit: BoxFit.fill,
                    ).box.clip(Clip.antiAliasWithSaveLayer).rounded.make(),
                    i.title!.text
                        .color(Colors.black)
                        .fontWeight(FontWeight.bold)
                        .size(40)
                        .make()
                        .box
                        .size(100, 70)
                        .margin(const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 15))
                        .color(Colors.transparent)
                        .make()
                  ],
                );
              }).toList(),
            ),
            40.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child:
                  "Categories".text.fontWeight(FontWeight.w600).size(20).make(),
            ),
            20.heightBox,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: authProv.CircularImages.map((index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProductPage.routename, arguments: {
                              'title': index.title,
                              'id': index.id
                            });
                          },
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(index.img),
                          ),
                        ),
                        7.heightBox,
                        Text(
                          "${index.title}",
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            30.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Fruits".text.fontWeight(FontWeight.w600).size(20).make(),
                  "See all"
                      .text
                      .fontWeight(FontWeight.w600)
                      .size(15)
                      .color(const Color(0xFF41A656))
                      .make()
                      .onTap(() {})
                ],
              ),
            ),
            30.heightBox,
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fruits.length,
                  itemBuilder: (ctx, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SizedBox(
                              height: 135,
                              width: 150,
                              child:
                                  Image.asset(fruits[i].img, fit: BoxFit.cover),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (favorites.contains(fruits[i])) {
                                  favorites.remove(fruits[i]);
                                } else {
                                  favorites.add(fruits[i]);
                                }
                                setState(() {});
                              },
                              child: Icon(
                                favorites.contains(fruits[i])
                                    ? Icons.favorite
                                    : Icons.favorite_border_rounded,
                              ),
                            ).box.make().p8()
                          ],
                        ),
                        fruits[i]
                            .title!
                            .text
                            .fontWeight(FontWeight.w600)
                            .make()
                            .p(8),
                        SizedBox(
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NumberFormat.simpleCurrency()
                                  .format(fruits[i].price)
                                  .text
                                  .color(Colors.orange)
                                  .fontWeight(FontWeight.w600)
                                  .maxFontSize(12)
                                  .make()
                                  .pOnly(left: 8),
                              " / kg"
                                  .text
                                  .fontWeight(FontWeight.w400)
                                  .maxFontSize(12)
                                  .color(Colors.grey)
                                  .make(),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    if (cart.contains(fruits[i])) {
                                      cart.remove(fruits[i]);
                                    } else {
                                      cart.add(fruits[i]);
                                    }
                                    setState(() {});
                                  },
                                  child: cartMap.containsKey(fruits[i].id)
                                      ? Container(
                                          width: 50,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  cartMap[fruits[i]]!
                                                      .multiplier += 1;
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 16,
                                                ),
                                              ),
                                              Text(cartMap[fruits[i].id]!
                                                  .multiplier
                                                  .toString()),
                                              InkWell(
                                                onTap: () {
                                                  cartMap[fruits[i]]!
                                                      .multiplier += 1;
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            cartMap[fruits[i].id] =
                                                CartModel.fromProduct(
                                                    fruits[i]);
                                            setState(() {});
                                          },
                                          child: Icon(Icons.add_circle_rounded,
                                              color: ColorConstant.tealA400),
                                        ))
                            ],
                          ),
                        )
                      ],
                    )
                        .box
                        .border(width: 1, color: Colors.grey.shade200)
                        .roundedSM
                        .clip(Clip.antiAliasWithSaveLayer)
                        .margin(const EdgeInsets.symmetric(horizontal: 10))
                        .make();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
