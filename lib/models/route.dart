import 'package:flutter/cupertino.dart';

class RouteModel {
  final String ? points;
  final Distance ? distance;
  final TimeNeeded ? timeNeeded;
  final String ? startAddress;
  final String ? endAddress;

  RouteModel(
      { this.points,
       this.distance,
       this.timeNeeded,
       this.startAddress,
       this.endAddress});
}

class Distance {
  String ?text;
  int ?value;

  Distance.fromMap(Map data) {
    text = data["text"];
    value = data["value"];
  }

  Map toJson() => {"text": text, "value": value};
}

class TimeNeeded {
  String? text;
  int? value;

  TimeNeeded.fromMap(Map data) {
    text = data["text"];
    value = data["value"];
  }
}
