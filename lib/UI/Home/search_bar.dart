import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 32, top: 64),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    showCursor: true,
                    cursorColor: Colors.grey.shade600,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: ' Search products',
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
                    controller: fieldText,
                  ),
                ),
                const SizedBox(width: 20,),
                GestureDetector(
                  onTap: () {
                    clearText();
                  },
                    child: const Icon(Icons.close)),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Divider(thickness: 2,),
          const SizedBox(height: 16,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                Text('Delete all', style: TextStyle(color: Color(0xFFf5830a), fontSize: 16, fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          const SizedBox(height: 20.0,),
      ],),
    );
  }
}