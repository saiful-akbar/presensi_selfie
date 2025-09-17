import 'package:intl/intl.dart';

class TodayAttendanceEntity {
  final DateTime timeIn;
  final DateTime timeOut;
  final String latitudeIn;
  final String latitudeOut;
  final String longitudeIn;
  final String longitudeOut;
  final String locationIn;
  final String locationOut;
  final String workingHours;
  final String overtime;

  TodayAttendanceEntity({
    required this.timeIn,
    required this.timeOut,
    required this.latitudeIn,
    required this.latitudeOut,
    required this.longitudeIn,
    required this.longitudeOut,
    required this.locationIn,
    required this.locationOut,
    required this.workingHours,
    required this.overtime,
  });

  factory TodayAttendanceEntity.fromJson(Map<String, dynamic> json) {
    final latlongIn = json['latlong_in'] as String;
    final latlongInSplit = latlongIn.split(',');

    String latitudeIn = '';
    String longitudeIn = '';

    if (latlongInSplit.length > 1) {
      latitudeIn = latlongInSplit[0].trim();
      longitudeIn = latlongInSplit[1].trim();
    }

    final latlongOut = json['latlong_out'] as String;
    final latlongOutSplit = latlongOut.split(',');

    String latitudeOut = '';
    String longitudeOut = '';

    if (latlongOutSplit.length > 1) {
      latitudeOut = latlongOutSplit[0].trim();
      longitudeOut = latlongOutSplit[1].trim();
    }

    const dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';

    return TodayAttendanceEntity(
      timeIn: DateFormat(dateTimeFormat).parse(json['time_in'].toString()),
      timeOut: DateFormat(dateTimeFormat).parse(json['time_out'].toString()),
      latitudeIn: latitudeIn,
      latitudeOut: latitudeOut,
      longitudeIn: longitudeIn,
      longitudeOut: longitudeOut,
      locationIn: json['location_in'].toString(),
      locationOut: json['location_out'].toString(),
      workingHours: json['working_hours'].toString(),
      overtime: json['overtime'].toString(),
    );
  }
}
