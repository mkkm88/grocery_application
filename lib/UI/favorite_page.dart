import 'package:flutter/material.dart';
import 'package:grocery_application/UI/cart_page.dart';
import 'package:grocery_application/UI/components/test/data.dart';
import 'package:grocery_application/Util/color_constant.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Favorite'),
      ),
      body: SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favorites.length,
            itemBuilder: (ctx, i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 135,
                        width: 150,
                        child: Image.asset(favorites[i].img, fit: BoxFit.cover),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!favorites.contains(favorites[i])) {
                            favorites.add(favorites[i]);
                          }
                        },
                        child: const Icon(
                          Icons.favorite_border_rounded,
                        ),
                      ).box.make().p8()
                    ],
                  ),
                  favorites[i]
                      .title!
                      .text
                      .fontWeight(FontWeight.w600)
                      .make()
                      .p(8),
                  Row(
                    children: [
                      NumberFormat.simpleCurrency()
                          .format(favorites[i].price)
                          .text
                          .color(Colors.orange)
                          .fontWeight(FontWeight.w600)
                          .make()
                          .pOnly(left: 8),
                      " / kg"
                          .text
                          .fontWeight(FontWeight.w400)
                          .color(Colors.grey)
                          .make(),
                      40.widthBox,
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const CartPage()));
                          },
                          child: Icon(Icons.add_circle_rounded,
                              color: ColorConstant.tealA400))
                    ],
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
    );
  }
}
