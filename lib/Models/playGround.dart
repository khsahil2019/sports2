class Playground {
  final String image;
  final String facilityName;
  final String space;
  final String address1;
  final String address2;
  final String city;
  final String pincode;
  final List<String> availDays;
  final String startDate;
  final String endDate;
  final String distanceFromRailway;
  final String distanceFromCity;
  final String distanceFromAirport;
  final String mobileNumber;
  final String emailId;
  final String whatsappNumber;
  final String contactPerson1Name;
  final String contactPerson1Designation;
  final String contactPerson1MobileNumber;
  final String contactPerson1WhatsappNumber;
  final String contactPerson1EmailId;
  final String contactPerson2Name;
  final String contactPerson2Designation;
  final String contactPerson2MobileNumber;
  final String contactPerson2WhatsappNumber;
  final String contactPerson2EmailId;
  final String area;
  final List<String> property;
  final String indoorCapacity;
  final String outdoorCapacity;
  final List<String> activities;
  final List<String> facilitiesParticipant;
  final List<String> facilitiesAttendees;
  final List<String> safetySecurity;
  final String charges;

  Playground({
    required this.image,
    required this.facilityName,
    required this.space,
    required this.address1,
    required this.address2,
    required this.city,
    required this.pincode,
    required this.availDays,
    required this.startDate,
    required this.endDate,
    required this.distanceFromRailway,
    required this.distanceFromCity,
    required this.distanceFromAirport,
    required this.mobileNumber,
    required this.emailId,
    required this.whatsappNumber,
    required this.contactPerson1Name,
    required this.contactPerson1Designation,
    required this.contactPerson1MobileNumber,
    required this.contactPerson1WhatsappNumber,
    required this.contactPerson1EmailId,
    required this.contactPerson2Name,
    required this.contactPerson2Designation,
    required this.contactPerson2MobileNumber,
    required this.contactPerson2WhatsappNumber,
    required this.contactPerson2EmailId,
    required this.area,
    required this.property,
    required this.indoorCapacity,
    required this.outdoorCapacity,
    required this.activities,
    required this.facilitiesParticipant,
    required this.facilitiesAttendees,
    required this.safetySecurity,
    required this.charges,
  });

  factory Playground.fromJson(Map<String, dynamic> json) {
    return Playground(
      image: json['image'] ?? '',
      facilityName: json['facilityName'] ?? '',
      space: json['space'] ?? '',
      address1: json['address1'] ?? '',
      address2: json['address2'] ?? '',
      city: json['city'] ?? '',
      pincode: json['pincode'] ?? '',
      availDays: List<String>.from(json['availDays'] ?? []),
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      distanceFromRailway: json['distancefromRailway'] ?? '',
      distanceFromCity: json['distancefromCity'] ?? '',
      distanceFromAirport: json['distancefromAirport'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      emailId: json['emailId'] ?? '',
      whatsappNumber: json['whatsappNumber'] ?? '',
      contactPerson1Name: json['contactPerson1Name'] ?? '',
      contactPerson1Designation: json['contactPerson1Designation'] ?? '',
      contactPerson1MobileNumber: json['contactPerson1mobileNumber'] ?? '',
      contactPerson1WhatsappNumber: json['contactPerson1watsappNumber'] ?? '',
      contactPerson1EmailId: json['contactPerson1emailId'] ?? '',
      contactPerson2Name: json['contactPerson2Name'] ?? '',
      contactPerson2Designation: json['contactPerson2Designation'] ?? '',
      contactPerson2MobileNumber: json['contactPerson2mobileNumber'] ?? '',
      contactPerson2WhatsappNumber: json['contactPerson2watsappNumber'] ?? '',
      contactPerson2EmailId: json['contactPerson2emailId'] ?? '',
      area: json['area'] ?? '',
      property: List<String>.from(json['property'] ?? []),
      indoorCapacity: json['indoorCapacity'] ?? '',
      outdoorCapacity: json['outdoorCapacity'] ?? '',
      activities: List<String>.from(json['activities'] ?? []),
      facilitiesParticipant:
          List<String>.from(json['facilitiesParticipant'] ?? []),
      facilitiesAttendees: List<String>.from(json['facilitiesAttendees'] ?? []),
      safetySecurity: List<String>.from(json['safetySecurity'] ?? []),
      charges: json['charges'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'facilityName': facilityName,
      'space': space,
      'address1': address1,
      'address2': address2,
      'city': city,
      'pincode': pincode,
      'availDays': availDays,
      'startDate': startDate,
      'endDate': endDate,
      'distancefromRailway': distanceFromRailway,
      'distancefromCity': distanceFromCity,
      'distancefromAirport': distanceFromAirport,
      'mobileNumber': mobileNumber,
      'emailId': emailId,
      'whatsappNumber': whatsappNumber,
      'contactPerson1Name': contactPerson1Name,
      'contactPerson1Designation': contactPerson1Designation,
      'contactPerson1mobileNumber': contactPerson1MobileNumber,
      'contactPerson1watsappNumber': contactPerson1WhatsappNumber,
      'contactPerson1emailId': contactPerson1EmailId,
      'contactPerson2Name': contactPerson2Name,
      'contactPerson2Designation': contactPerson2Designation,
      'contactPerson2mobileNumber': contactPerson2MobileNumber,
      'contactPerson2watsappNumber': contactPerson2WhatsappNumber,
      'contactPerson2emailId': contactPerson2EmailId,
      'area': area,
      'property': property,
      'indoorCapacity': indoorCapacity,
      'outdoorCapacity': outdoorCapacity,
      'activities': activities,
      'facilitiesParticipant': facilitiesParticipant,
      'facilitiesAttendees': facilitiesAttendees,
      'safetySecurity': safetySecurity,
      'charges': charges,
    };
  }
}
