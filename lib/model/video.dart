class Video {
  final String id;
  final String title;
  final String channelTitle;
  final String thumbnailUrl;


  Video({
    required this.id,
    required this.title,
    required this.channelTitle,
    required this.thumbnailUrl,

  });

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      channelTitle: snippet['channelTitle'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],

    );
  }
}