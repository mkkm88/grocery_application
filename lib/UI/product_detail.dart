import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/UI/cart_page.dart';
import 'package:grocery_application/Util/color_constant.dart';
import 'package:grocery_application/model/CartModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import 'favorite_page.dart';

class ProductDetailPage extends StatefulWidget {
  static const routename = 'productdetailpage';

  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<HomeProvider>(context);
    final Args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final title = Args['title'];
    final image = Args['image'];
    final price = Args['price'];
    final section = Args['category'];
    final unit = Args['unit'];
    final description = Args['description'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                carouselController: authProv.controller,
                items: [
                  Image.network(image),
                ],
                options: CarouselOptions(onPageChanged: (i, r) {
                  authProv.setIndex(i);
                })),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedSmoothIndicator(
                activeIndex: authProv.currentIndex,
                count: 2,
                effect: ExpandingDotsEffect(
                    activeDotColor: Colors.orange,
                    dotColor: Colors.grey.withOpacity(0.3),
                    spacing: 10,
                    radius: 10,
                    dotHeight: 12,
                    expansionFactor: 1.4),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FavoritePage()));
                    },
                    child: const Icon(
                      Icons.favorite_border_rounded,
                    ),
                  )
                ],
              ),
            ),
            Text(section,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              children: [
                Text(
                  NumberFormat.simpleCurrency().format(price),
                  style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                "$unit"
                    .text
                    .fontWeight(FontWeight.w400)
                    .color(Colors.grey)
                    .make(),
                const Spacer(),
                Container(
                  width: 80,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: ColorConstant.tealA400,
                      shape: BoxShape.rectangle),
                  child: Consumer<HomeProvider>(builder: (_, auth, child) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () => auth.decreement(),
                            child: const Icon(
                              EvaIcons.minus,
                              color: Colors.white,
                              size: 15,
                            )),
                        Text('${auth.current}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                        GestureDetector(
                            onTap: () => auth.increement(),
                            child: const Icon(
                              EvaIcons.plus,
                              color: Colors.white,
                              size: 15,
                            ))
                      ],
                    );
                  }),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Text(
              'About the product',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              description,
              style: const TextStyle(fontWeight: FontWeight.w500,letterSpacing: 0.2),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CartPage()));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorConstant.tealA400,
                ),
                width: 350,
                height: 50,
                child: const Text(
                  'Add to Cart',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}