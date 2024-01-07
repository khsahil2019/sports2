class UserProfile {
  final String image;
  final String fullName;
  final String emailId;
  final String password;
  final String contactNumber;
  final String address;
  final String dob;
  final String gender;
  final List<String> preGender;
  final String skillLevel;
  final String goals;

  UserProfile({
    required this.image,
    required this.fullName,
    required this.emailId,
    required this.password,
    required this.contactNumber,
    required this.address,
    required this.dob,
    required this.gender,
    required this.preGender,
    required this.skillLevel,
    required this.goals,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      image: json['image'] ?? '',
      fullName: json['fullName'] ?? '',
      emailId: json['emailId'] ?? '',
      password: json['password'] ?? '',
      contactNumber: json['contactNumber'] ?? '',
      address: json['address'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      preGender: List<String>.from(json['preGender'] ?? []),
      skillLevel: json['skillLevel'] ?? '',
      goals: json['goals'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'fullName': fullName,
      'emailId': emailId,
      'password': password,
      'contactNumber': contactNumber,
      'address': address,
      'dob': dob,
      'gender': gender,
      'preGender': preGender,
      'skillLevel': skillLevel,
      'goals': goals,
    };
  }
}
