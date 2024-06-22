// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoryTypeGroup {
  static const String sports = 'sport';
  static const String movies = 'movie';
  static const String music = 'music';
  late String name;
  late String id;
  late String image;
  CategoryTypeGroup({
    required this.name,
    required this.id,
    required this.image,
  });
  CategoryTypeGroup.id(this.id) {
    if (id == CategoryTypeGroup.sports) {
      image = "assets/images/sport.png";
      name = "Sport";
    } else if (id == CategoryTypeGroup.movies) {
      image = "assets/images/movie.png";
      name = "Movie";
    } else {
      image = "assets/images/music.png";
      name = "Music";
    }
  }
  static List<CategoryTypeGroup> categoryTypeGroupList() {
    return [
      CategoryTypeGroup.id(CategoryTypeGroup.sports),
      CategoryTypeGroup.id(CategoryTypeGroup.movies),
      CategoryTypeGroup.id(CategoryTypeGroup.music),
    ];
  }
}
