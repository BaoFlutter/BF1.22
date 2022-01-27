import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final onPressed ;
  final IconData iconData;
  final String text;

  const ButtonWidget({Key? key, required this.onPressed, required this.iconData, required this.text}) : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed ,
      child: Container(
        child: Column(
          children: [
            Icon(widget.iconData, color: Colors.blue,),
            const SizedBox(height: 5,),
            Text(widget.text.toUpperCase(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
          ],
        ),

      ),
    );
  }
}

