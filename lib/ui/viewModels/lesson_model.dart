
import 'package:ecourse/model/video.dart';
import 'package:ecourse/services/navigation.dart';
import 'package:ecourse/services/youtube.dart';
import 'package:ecourse/utils/constant.dart';
import '../../locator.dart';
import 'base_model.dart';

class LessonViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  late APIService instance = locator<APIService>();


  Future<List<Video>> initPlayList() async {

    List<Video> _video  = await instance.fetchVideosFromPlaylist(playlistId: channelId);
    print("DATA ${_video.length.toString()}");

    return _video;
  }

}
