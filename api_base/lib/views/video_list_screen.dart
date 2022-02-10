import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/video_model.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/detail_video_screen.dart';
import 'package:flutter/material.dart';
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  Future<List<VideoModel>>? futureVideoList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<VideoModel>>(
          future: futureVideoList,
          builder: (context, snapshot){
            if(snapshot.hasError) return Center(
              child: Text(LOAD_ERROR),
            );
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            List<VideoModel> videoList = snapshot.data!;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: videoList.length,
                itemBuilder: (BuildContext context, int index) {
                  VideoModel videoModel = videoList[index];
                  return GestureDetector(
                    child: Card(
                        color: Colors.amber,
                        child: Column(
                          children: [
                            Image.network(videoModel.url_photo!),
                            Text(videoModel.title!)
                          ],
                        )
                    ),
                    onTap: (){
                      var route = MaterialPageRoute(builder: (context)=> DetailVideoScreen(videoModel: videoModel));
                      Navigator.push(context, route);
                    },
                  );
                }
            );


          },
        ),

      ),

    );
  }

  loadVideo(){
    futureVideoList = ApiServices().fetchVideoList();
  }


}
