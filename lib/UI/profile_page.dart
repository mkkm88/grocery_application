import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_application/UI/components/my_button.dart';
import 'package:grocery_application/Util/color_constant.dart';
import 'package:grocery_application/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (_, authProv, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 25, bottom: 30),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("${authProv.user?.photoURL}"),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${authProv.user?.displayName}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "${authProv.user?.email}",
                        style: TextStyle(
                            fontSize: 15, color: ColorConstant.gray900),
                      )
                    ],
                  )
                ],
              ),
            ),
            CustomTile(
                context,
                const Icon(
                  EvaIcons.shoppingBagOutline,
                  size: 35,
                ),
                'Orders'),
            CustomTile(
                context,
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SvgPicture.asset(
                    'assets/icons/MyDetailsicon.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                'My Details'),
            CustomTile(
                context,
                const Icon(Icons.location_on_outlined, size: 30),
                'Delivery Address'),
            CustomTile(context,
                const Icon(Icons.help_outline_rounded, size: 35), 'Help'),
            CustomTile(
                context, const Icon(Icons.info_outlined, size: 35), 'About'),
            Divider(thickness: 2),
            Spacer(),
            CustomButton(onTap: (){
              FirebaseAuth.instance.signOut();
              GoogleSignIn().signOut();
            })
          ],
        );
      }),
    );
  }
}

Widget CustomTile(BuildContext context, Widget child, String title) {
  return Column(
    children: [
      Divider(
        thickness: 2,
      ),
      Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            child,
            SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_outlined,
              size: 35,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget CustomButton({required Function onTap}) {
  return GestureDetector(
    onTap: ()=>onTap(),
    child: Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.all(20),
      width: 350,
      height: 70,
      decoration: BoxDecoration(
          color: Color(0xFFF2F3F2), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.logout,
            color: Colors.green,
            size: 28,
          ),
          Spacer(),
          Text(
            'Log Out',
            style: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Spacer()
        ],
      ),
    ),
  );
}