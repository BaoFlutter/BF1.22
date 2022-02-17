import 'package:api_base/models/video_model.dart';
import 'package:get/get.dart';

class VideoListController extends GetxController{
  List<VideoModel> videoList = [];

  updateVideoList({required List<VideoModel> videoList}){
    this.videoList = videoList;
   //update();
  }

}