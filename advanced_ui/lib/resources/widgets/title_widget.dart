import 'package:flutter/material.dart';
class TitleWidget extends StatelessWidget {
  final String title;
  final String address;
  final int rate;
  const TitleWidget({Key? key, required this.title, required this.address, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 40, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    Text(address, style: TextStyle(color: Colors.black38),)
                  ],
                ),
              ),),
          Expanded(
              flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.red,),
                Text(rate.toString())
              ],
            ),
          )),
          // title

          // rate& star

        ],
      ),
    );
  }
}
