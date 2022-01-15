

import 'package:ecourse/model/video.dart';
import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/view/lesson/play_video.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          const BorderRadius.all(Radius.circular(defaultPadding / 2)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF282828).withOpacity(0.1),
              offset: const Offset(2, 2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ]),
      child: GestureDetector(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.75,
              child: Image.network(
                video.thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                'Title ${video.title}',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35.0,
                backgroundImage: NetworkImage(video.thumbnailUrl),
              ),
              title: Text(
                video.channelTitle.toString(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return VideoScreen(id: video.id);
          }));
        },
      )
    );
  }
}