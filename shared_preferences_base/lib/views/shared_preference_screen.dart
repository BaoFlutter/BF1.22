import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_base/resources/strings.dart';
class SharedPreferenceScreen extends StatefulWidget {
  const SharedPreferenceScreen({Key? key}) : super(key: key);

  @override
  _SharedPreferenceScreenState createState() => _SharedPreferenceScreenState();
}

class _SharedPreferenceScreenState extends State<SharedPreferenceScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<Map<String, dynamic>>? futureData ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformationFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SHARED_PREFERENCES_DATA),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<Map<String, dynamic>>(
          future: futureData,
          builder: (context, snapshot){
            if(snapshot.hasError) return Center(
              child: Text(ERROR_LOAD),
            );
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            Map<String, dynamic> informationMap = snapshot.data!;
            return Container(
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      Text(informationMap['average_mark']),
                      Text(informationMap['adjustment_result'])
                    ],
                  ),
                ),
              ),
            );

          },
        ),
      ),
    );
  }

  getInformationFromSharedPreferences(){
    futureData = _prefs.then((SharedPreferences prefs) {
      String averageMark = prefs.getString("average_mark").toString();
      String adjustmentResult = prefs.getString("adjustment_result").toString();
      return {
        "average_mark" : averageMark,
        "adjustment_result" :adjustmentResult
      };
    });
  }

}
