import 'package:flutter/material.dart';
class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function onTap;
  const SquareTile({Key? key, required this.imagePath, required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(imagePath, height: 40,),
      ),
    );
  }
}

Widget RectangleButton({required Function onTap, required String iconPath, required String name}){
  return GestureDetector(
    onTap: ()=>onTap(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(iconPath,
                height: 30),
            Text(name,
              style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
            ),
          ],
        ),
      ),
    ),
  );
}