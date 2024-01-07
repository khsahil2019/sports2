class Event {
  final String image;
  final String eventType;
  final String activityName;
  final String venue;
  final String nameOfEvent;
  final String startDate;
  final String endDate;
  final String totalDays;
  final List<String> ageGroup;
  final String heightGroup;
  final String weightGroup;
  final String participantLevel;
  final List<String> participantGender;
  final List<String> reward;
  final String purposeEvent;
  final String whoCanAttend;
  final String dressCodeParticipant;
  final String dressCodeAttendees;
  final List<String> refreshmentParticipant;
  final List<String> refreshmentAttendees;
  final List<String> facilitiesAttendees;
  final List<String> facilitiesParticipant;
  final List<String> securityMeasure;
  final List<String> socialLink;

  final String bookTicketFrom;

  Event({
    required this.image,
    required this.eventType,
    required this.activityName,
    required this.venue,
    required this.nameOfEvent,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.ageGroup,
    required this.heightGroup,
    required this.weightGroup,
    required this.participantLevel,
    required this.participantGender,
    required this.reward,
    required this.purposeEvent,
    required this.whoCanAttend,
    required this.dressCodeParticipant,
    required this.dressCodeAttendees,
    required this.refreshmentParticipant,
    required this.refreshmentAttendees,
    required this.facilitiesAttendees,
    required this.facilitiesParticipant,
    required this.securityMeasure,
    required this.socialLink,
    required this.bookTicketFrom,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      image: json['image'] ?? '',
      eventType: json['eventType'] ?? '',
      activityName: json['activityName'] ?? '',
      venue: json['venue'] ?? '',
      nameOfEvent: json['nameOfEvent'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      totalDays: json['totalDays'] ?? '',
      ageGroup: List<String>.from(json['ageGroup'] ?? []),
      heightGroup: json['heightGroup'] ?? '',
      weightGroup: json['weightGroup'] ?? '',
      participantLevel: json['participantLevel'] ?? '',
      participantGender: List<String>.from(json['participantGender'] ?? []),
      reward: List<String>.from(json['reward'] ?? []),
      purposeEvent: json['purposeEvent'] ?? '',
      whoCanAttend: json['whoCanAttend'] ?? '',
      dressCodeParticipant: json['dressCodeParticipant'] ?? '',
      dressCodeAttendees: json['dressCodeAttendees'] ?? '',
      refreshmentParticipant:
          List<String>.from(json['refreshmentParticipant'] ?? []),
      refreshmentAttendees:
          List<String>.from(json['refreshmentAttendees'] ?? []),
      facilitiesAttendees: List<String>.from(json['facilitiesAttendees'] ?? []),
      facilitiesParticipant:
          List<String>.from(json['facilitiestParticipant'] ?? []),
      securityMeasure: List<String>.from(json['securityMeasure'] ?? []),
      socialLink: List<String>.from(json['socailLink'] ?? []),
      bookTicketFrom: json['bookTicketFrom'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'eventType': eventType,
      'activityName': activityName,
      'venue': venue,
      'nameOfEvent': nameOfEvent,
      'startDate': startDate,
      'endDate': endDate,
      'totalDays': totalDays,
      'ageGroup': ageGroup,
      'heightGroup': heightGroup,
      'weightGroup': weightGroup,
      'participantLevel': participantLevel,
      'participantGender': participantGender,
      'reward': reward,
      'purposeEvent': purposeEvent,
      'whoCanAttend': whoCanAttend,
      'dressCodeParticipant': dressCodeParticipant,
      'dressCodeAttendees': dressCodeAttendees,
      'refreshmentParticipant': refreshmentParticipant,
      'refreshmentAttendees': refreshmentAttendees,
      'facilitiesAttendees': facilitiesAttendees,
      'facilitiestParticipant': facilitiesParticipant,
      'securityMeasure': securityMeasure,
      'socailLink': socialLink,
      'bookTicketFrom': bookTicketFrom,
    };
  }
}
