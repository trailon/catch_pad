import 'dart:convert';

import 'package:catch_pad/constants/texts.dart';
import 'package:catch_pad/models/activity_model.dart';
import 'package:http/http.dart' as http;

class Requests {
  static fetchActivty(String givenUrl) async {
    var request = http.Request('GET', Uri.parse(givenUrl));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responsebody = await response.stream.bytesToString();
      var decodedJson = jsonDecode(responsebody);
      if (decodedJson["error"] == null) {
        ActivityModel activityModel = ActivityModel.fromJson(decodedJson);
        return activityModel;
      } else {
        return Strings.activityError;
      }
    } else {
      return Strings.activityError;
    }
  }
}
