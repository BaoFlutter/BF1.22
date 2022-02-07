import 'package:flutter/material.dart';
class TextInputWidget extends StatelessWidget {
  final String lableText;
  final String hintText;
  final controller;
  const TextInputWidget({Key? key, required this.lableText, required this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: lableText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
