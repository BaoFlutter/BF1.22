import 'package:api_base/models/video_model.dart';
import 'package:api_base/views/second_video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class DetailVideoScreen extends StatelessWidget {
  final VideoModel videoModel;

  const DetailVideoScreen({Key? key, required this.videoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(videoModel.title!),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.adjust),
            onPressed: (){
              var route = MaterialPageRoute(builder: (context)=> SecondVideoListScreen());
              Navigator.push(context, route);
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.network(videoModel.url_photo!),
            Html(data: videoModel.description!)
          ],
        ),

      ),

    );
  }
}
