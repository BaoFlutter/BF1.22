import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoListProvider extends ChangeNotifier{
  List<VideoModel> videoList = [];

  getVideoList() async  {
    this.videoList = await ApiServices().fetchVideoList();
    notifyListeners();
  }

}