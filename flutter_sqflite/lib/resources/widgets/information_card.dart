import 'package:flutter/material.dart';
import 'package:state_base/resources/strings.dart';
class InformationCard extends StatelessWidget {
  final String averageMark;
  final String adjustmentResult;
  const InformationCard({Key? key, required this.averageMark, required this.adjustmentResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              Text(INFORMATION, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Text(AVERAGE_MARK +":  "+ averageMark),
              const SizedBox(height: 10,),
              Text(ADJUSTMENT_RESULT +": "+ adjustmentResult)
            ],
          ),
        ),

      ),
    );
  }
}
