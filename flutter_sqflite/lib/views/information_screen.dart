import 'package:flutter/material.dart';
import 'package:state_base/databases/result_database.dart';
import 'package:state_base/models/result.dart';
import 'package:state_base/resources/strings.dart';
import 'package:state_base/resources/widgets/information_card.dart';
class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {

  Future<List<Result>>? resultList ;
  final db = ResultDatabase();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getResultsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result List"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Result>>(
          future: resultList,
          builder: (context, snapshot){
            if(snapshot.hasError) return Center(
              child: Text("Error Loading"),
            );
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );

            List<Result> list = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(10),
                itemCount: list.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  child: Card(
                    child: Container(
                      child: Column(
                        children: [
                          Text("Average Mark" + list[index].average_mark.toString()),
                          Text("Adjustment" + list[index].adjustment.toString())
                        ],
                      ),
                    ),
                  ),
                );

              }, separatorBuilder: (BuildContext context, int index) {
                return Divider();
            },
            );

          },
        ),

      ),
    );
  }

  getResultsFromDatabase(){

    resultList = db.fetchAll();

  }
}

