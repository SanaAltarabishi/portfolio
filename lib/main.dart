import 'package:flutter/material.dart';
import 'package:protofolio_app/protofolio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProtofolioPage(),
    );
  }
}


//!

class TextButtonRow extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  TextButtonRow({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          6,
          (index) => TextButton(
            onPressed: () => onTap(index),
            child: Text(
              'Item $index',
              style: TextStyle(
                color: selectedIndex == index ? Colors.blue : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




//!!
//why the borderRaduis can't be apply when we use the border ,and it gives an exaption
