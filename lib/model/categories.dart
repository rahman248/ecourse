abstract class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

class Categories extends Category{
  final String name;
  final int numOfCourses;
  final String image;

  Categories(this.name, this.numOfCourses, this.image) : super(name, 0, image);
}


final categoriesData = [
  Categories ('Marketing', 17, 'assets/images/marketing.png'),
  Categories ('UX Design',  25, 'assets/images/ux_design.png'),
  Categories ('Photography', 13, 'assets/images/photography.png'),
  Categories ('Business', 17, 'assets/images/business.png'),
];