import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/UI/product_detail.dart';
import 'package:grocery_application/model/CartModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Util/color_constant.dart';
import 'cart_page.dart';
import 'favorite_page.dart';

class ProductPage extends StatelessWidget {
  static const routename = '/categorydetailpages';

  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<HomeProvider>(context);
    final Args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final title = Args['title'] as String;
    final categoryId = Args['id'] as String;
    final detailid = authProv.findbyid(categoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
            child: TextField(
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.81,
            child: GridView.builder(
                itemCount: detailid.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(ProductDetailPage.routename,arguments: {
                        'title': detailid[i].title,
                        'image': detailid[i].image,
                        'price': detailid[i].price,
                        'category': title,
                        'description': detailid[i].description,
                        'unit': detailid[i].unit
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: Container(
                                  height: 150,
                                  width: double.maxFinite,
                                  child: Image.network(detailid[i].image,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FavoritePage()));
                                  },
                                  child: const Icon(
                                    Icons.favorite_border_rounded,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Text(
                              detailid[i].title,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 9),
                                child: Text(
                                  NumberFormat.simpleCurrency()
                                      .format(detailid[i].price),
                                  style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                "${detailid[i].unit}",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CartPage()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Icon(Icons.add_circle_rounded,
                                      color: ColorConstant.tealA400),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}