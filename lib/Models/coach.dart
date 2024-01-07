class Coach {
  final String image;
  final String fullName;
  final String gender;
  final List<String> sportGame;
  final String experience;
  final List<String> preGender;
  final String preLevel;
  final List<String> ageGroup;
  final String location;
  final List<String> availDays;
  final String certificate;
  final String diploma;
  final String degree;
  final String startDate;
  final String endDate;
  final List<String> facilities;
  final String hourlyPrice;
  final bool priceIncludesFacilities;
  final bool priceNotIncludesFacilities;
  final bool openForOutstation;
  final bool preferToBeInCity;
  final String country;
  final String state;
  final String city;
  final String address;
  final String pincode;
  final String email;
  final String contactNumber;
  final String whatsappNumber;

  Coach({
    required this.image,
    required this.fullName,
    required this.gender,
    required this.sportGame,
    required this.experience,
    required this.preGender,
    required this.preLevel,
    required this.ageGroup,
    required this.location,
    required this.availDays,
    required this.certificate,
    required this.diploma,
    required this.degree,
    required this.startDate,
    required this.endDate,
    required this.facilities,
    required this.hourlyPrice,
    required this.priceIncludesFacilities,
    required this.priceNotIncludesFacilities,
    required this.openForOutstation,
    required this.preferToBeInCity,
    required this.country,
    required this.state,
    required this.city,
    required this.address,
    required this.pincode,
    required this.email,
    required this.contactNumber,
    required this.whatsappNumber,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      image: json['image'] ?? '',
      fullName: json['fullName'] ?? '',
      gender: json['gender'] ?? '',
      sportGame: List<String>.from(json['sport_Game'] ?? []),
      experience: json['experince'] ?? '',
      preGender: List<String>.from(json['preGender'] ?? []),
      preLevel: json['preLevel'] ?? '',
      ageGroup: List<String>.from(json['ageGroup'] ?? []),
      location: json['location'] ?? '',
      availDays: List<String>.from(json['availDays'] ?? []),
      certificate: json['certificate'] ?? '',
      diploma: json['diploma'] ?? '',
      degree: json['degree'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      facilities: List<String>.from(json['facilities'] ?? []),
      hourlyPrice: json['hourlyPrice'] ?? '',
      priceIncludesFacilities: json['priceIncludesFacilities'] ?? false,
      priceNotIncludesFacilities: json['priceNotIncludesFacilities'] ?? false,
      openForOutstation: json['openForOutstation'] ?? false,
      preferToBeInCity: json['preferToBeInCity'] ?? false,
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      address: json['address'] ?? '',
      pincode: json['pincode'] ?? '',
      email: json['email'] ?? '',
      contactNumber: json['contactNumber'] ?? '',
      whatsappNumber: json['whatsappNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'fullName': fullName,
      'gender': gender,
      'sport_Game': sportGame,
      'experince': experience,
      'preGender': preGender,
      'preLevel': preLevel,
      'ageGroup': ageGroup,
      'location': location,
      'availDays': availDays,
      'certificate': certificate,
      'diploma': diploma,
      'degree': degree,
      'startDate': startDate,
      'endDate': endDate,
      'facilities': facilities,
      'hourlyPrice': hourlyPrice,
      'priceIncludesFacilities': priceIncludesFacilities,
      'priceNotIncludesFacilities': priceNotIncludesFacilities,
      'openForOutstation': openForOutstation,
      'preferToBeInCity': preferToBeInCity,
      'country': country,
      'state': state,
      'city': city,
      'address': address,
      'pincode': pincode,
      'email': email,
      'contactNumber': contactNumber,
      'whatsappNumber': whatsappNumber,
    };
  }
}
