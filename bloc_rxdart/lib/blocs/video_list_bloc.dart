import 'package:api_base/data_sources/repository.dart';
import 'package:api_base/models/video_model.dart';
import 'package:rxdart/rxdart.dart';

class VideoListBloc{
  final _repository = Repository() ;

  final videoListSubject = PublishSubject<List<VideoModel>>();
  // put Data into Bloc
  putVideoListIntoBloc() async {
    List<VideoModel> videoList = await _repository.fetchAllVideos();
    videoListSubject.sink.add(videoList);
  }

  // Return Data Stream for Views
  Stream<List<VideoModel>> get videoListStream => videoListSubject.stream;

  // close stream if not neccessary
  dispose(){
    videoListSubject.close();
  }





}