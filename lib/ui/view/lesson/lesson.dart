
import 'package:ecourse/model/video.dart';
import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/shared/video_card_shimmer.dart';
import 'package:ecourse/ui/view/lesson/video_card.dart';
import 'package:ecourse/ui/viewModels/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LessonViewModel>.reactive(
      viewModelBuilder: () => LessonViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: appBar('Learning Path'),
        body: SafeArea(
          child: FutureBuilder<List<Video>>(
            future: model.initPlayList(),
            builder: (context, snapshot) => snapshot.hasData ? ListView.builder(
              clipBehavior: Clip.none,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  VideoCard(video: snapshot.data![index]),
            )
                : ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => const VideoCardShimmer(),
            ),

          ),
        ),
      ),
    );
  }
  
}