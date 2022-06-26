import 'dart:convert';

import 'package:catch_pad/models/activity_model.dart';
import 'package:http/http.dart' as http;

class Requests {
  static fetchActivty() async {
    var request =
        http.Request('GET', Uri.parse('http://www.boredapi.com/api/activity/'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responsebody = await response.stream.bytesToString();
      var decodedJson = jsonDecode(responsebody);
      return ActivityModel.fromJson(decodedJson);
    } else {
      return "An error occured while trying to fetch activity data";
    }
  }
}
