import 'package:catch_pad/api/requests.dart';
import 'package:catch_pad/models/activity_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Bored API Request for Fetching Activity', () async { // Got an int is not a double error during debug test at price variable and fixed it
    dynamic activityModelForTest = await Requests.fetchActivty();
    expect(activityModelForTest.runtimeType, ActivityModel);
  });
}
