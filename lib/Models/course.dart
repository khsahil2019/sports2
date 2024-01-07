class Course {
  final String image;
  final String courseName;
  final String about;
  final String typeOfSport;
  final List<String> preGender;
  final String startDate;
  final String endDate;
  final String hours;
  final String days;
  final String months;
  final List<String> ageGroup;
  final List<String> courseOffer;
  final List<String> courseOutcome;
  final List<String> courseContent;
  final String courseFees;

  Course({
    required this.image,
    required this.courseName,
    required this.about,
    required this.typeOfSport,
    required this.preGender,
    required this.startDate,
    required this.endDate,
    required this.hours,
    required this.days,
    required this.months,
    required this.ageGroup,
    required this.courseOffer,
    required this.courseOutcome,
    required this.courseContent,
    required this.courseFees,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      image: json['image'] ?? '',
      courseName: json['courseName'] ?? '',
      about: json['about'] ?? '',
      typeOfSport: json['typeOfSport'] ?? '',
      preGender: List<String>.from(json['preGender'] ?? []),
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      hours: json['hours'] ?? '',
      days: json['days'] ?? '',
      months: json['months'] ?? '',
      ageGroup: List<String>.from(json['ageGroup'] ?? []),
      courseOffer: List<String>.from(json['courseOffer'] ?? []),
      courseOutcome: List<String>.from(json['courseOutcome'] ?? []),
      courseContent: List<String>.from(json['courseContent'] ?? []),
      courseFees: json['courseFees'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'courseName': courseName,
      'about': about,
      'typeOfSport': typeOfSport,
      'preGender': preGender,
      'startDate': startDate,
      'endDate': endDate,
      'hours': hours,
      'days': days,
      'months': months,
      'ageGroup': ageGroup,
      'courseOffer': courseOffer,
      'courseOutcome': courseOutcome,
      'courseContent': courseContent,
      'courseFees': courseFees,
    };
  }
}
