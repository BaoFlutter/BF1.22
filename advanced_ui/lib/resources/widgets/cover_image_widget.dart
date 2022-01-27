import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CoverImageWidget extends StatelessWidget {
  final String imageUrl;
  const CoverImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageUrl,
      fit: BoxFit.cover,
      height: Get.height/2.5,
      width: Get.width,
    );
  }
}
