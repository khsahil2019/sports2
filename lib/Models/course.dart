class Course {
  final String image;
  final String courseName;
  final String about;
  final String typeOfSport;
  final String duration;
  final String timings;
  final String price;
  final String level;
  final String rating;

  Course({
    required this.image,
    required this.courseName,
    required this.about,
    required this.typeOfSport,
    required this.duration,
    required this.timings,
    required this.price,
    required this.level,
    required this.rating,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      image: json['image'] ?? '',
      courseName: json['courseName'] ?? '',
      about: json['about'] ?? '',
      typeOfSport: json['typeOfSport'] ?? '',
      duration: json['duration'] ?? '',
      timings: json['timings'] ?? '',
      price: json['price'] ?? '',
      level: json['level'] ?? '',
      rating: json['rating'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'courseName': courseName,
      'about': about,
      'typeOfSport': typeOfSport,
      'duration': duration,
      'timings': timings,
      'price': price,
      'level': level,
      'rating': rating,
    };
  }
}
