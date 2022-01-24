import 'package:flutter/material.dart';
import 'package:state_base/resources/strings.dart';
import 'package:state_base/resources/widgets/information_card.dart';
class InformationScreen extends StatelessWidget {
  final String averageMark;
  final String adjustmentResult;
  const InformationScreen({Key? key, required this.averageMark, required this.adjustmentResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InformationCard(
            averageMark: averageMark,
            adjustmentResult: adjustmentResult),
      ),

    );
  }
}
