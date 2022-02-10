import 'package:api_base/data_sources/api_urls.dart';
import 'package:api_base/models/video_model.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/resources/utils/log.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServices {

  Future<List<VideoModel>> fetchVideoList() async {
    List<VideoModel> videoList = [];
    var videoListUri = ApiUrl.VIDEO_URL;
    var response ;
    try{
      response = await http.get(videoListUri);
    }
    catch(e)
    {
      print(LOAD_ERROR + e.toString());
    }
    var jsonBody = json.jsonDecode(response.body);
    Log().printJson(json: jsonBody);
    if(jsonBody['code']== 'success'){
      List jsonList = jsonBody['list'];
      for(var jsonVideo in jsonList){
        VideoModel videoModel = VideoModel.fromJson(jsonVideo);
        videoList.add(videoModel);
      }
    }
    return videoList;
  }


}