class Comic {
  final String title;
  final String imageUrl;
  final int id;
  final String explaination;
  final String alt;

  Comic(
      {required this.title,
      required this.imageUrl,
      required this.id,
      required this.explaination,
      required this.alt});

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      title: json['title'],
      imageUrl: json['img'],
      id: json['num'],
      explaination: json['explaination'],
      alt: json['alt'],
    );
  }
}
