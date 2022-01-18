class Categories {

  String title;
  String channel;
  String imagePath;
  int lessonSubscribe;



  Categories({
    this.title = '',
    this.channel= '',
    this.imagePath = '',
    this.lessonSubscribe = 0

  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'channel' : channel,
      'imagePath': imagePath,
      'lessonSubscribe': lessonSubscribe,

    };
  }

  static Categories? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return Categories(
      title: map['title'],
      channel: map['channel'],
      imagePath: map['imagePath'],
      lessonSubscribe: map['lessonSubscribe'],
    );
  }



 /* static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'User interface Design',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'User interface Design',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'User interface Design',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'User interface Design',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];*/
}