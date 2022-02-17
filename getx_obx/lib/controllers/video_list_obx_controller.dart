import 'package:api_base/models/video_model.dart';
import 'package:get/get.dart';

class VideoListObxController extends GetxController{

  // Obs , RxString, RxInt, Rx + Kieu Du lieu
  // Obx = Observer + RxDart

 // int? number = 5;  // Int, String, double .....
  //var numberObs = 5.obs ;  // Gia tri dang Obs
  // Convert :
  // Int => Obs -  int.obs
  //obs => int - obs.value;

  var videoListObs = [].obs;

  updateVideoList({required List<VideoModel> videoList}){
    this.videoListObs = videoList.obs;
   //update();
  }

}