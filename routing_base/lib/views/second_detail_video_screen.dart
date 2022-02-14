import 'package:api_base/models/video_model.dart';
import 'package:api_base/views/detail_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class SecondDetailVideoScreen extends StatefulWidget {
  final VideoModel videoModel;
  const SecondDetailVideoScreen({Key? key, required this.videoModel}) : super(key: key);

  @override
  _SecondDetailVideoScreenState createState() => _SecondDetailVideoScreenState();
}

class _SecondDetailVideoScreenState extends State<SecondDetailVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoModel.title!),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.border_color_rounded),
          onPressed: (){
           //Navigator.pop(context);
            Get.back();
           // var route = MaterialPageRoute(builder: (context) => DetailVideoScreen(videoModel: widget.videoModel));
           // Navigator.push(context, route);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.network(widget.videoModel.url_photo!),
            Html(data: widget.videoModel.description!)
          ],
        ),

      ),

    );
  }
}
