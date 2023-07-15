import 'package:flutter/material.dart';
import 'package:grocery_application/UI/product.dart';
import 'package:grocery_application/Util/color_constant.dart';
import 'package:grocery_application/model/CartModel.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Categories'),),
      body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: authProv.CategoriesImages.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 3 / 4),
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(ProductPage.routename, arguments: {
                  'title': authProv.CategoriesImages[i].title,
                  'id': authProv.CategoriesImages[i].id
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstant.gray90014)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(authProv.CategoriesImages[i].img),
                      ),
                    ),
                    7.heightBox,
                    Text(
                      "${authProv.CategoriesImages[i].title}",
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}