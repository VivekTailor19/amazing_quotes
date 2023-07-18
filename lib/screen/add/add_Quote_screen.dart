import 'package:flutter/material.dart';

class Add_Quote_Screen extends StatefulWidget {
  const Add_Quote_Screen({super.key});

  @override
  State<Add_Quote_Screen> createState() => _Add_Quote_ScreenState();
}

class _Add_Quote_ScreenState extends State<Add_Quote_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("Quote"),
    );
  }
}
