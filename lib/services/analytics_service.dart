import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_flutter/amplify.dart';

class AnalyticsService {
  Future<void> recordEvent(String eventName) async {
    try {
      AnalyticsEvent _event = AnalyticsEvent(eventName);
      Amplify.Analytics.recordEvent(event: _event);
    } catch (e) {
      throw e;
    }
  }

  Future<void> identifyUser(String userId, String? useremail) async {
    try {
      AnalyticsUserProfile _userProfile = new AnalyticsUserProfile();
      _userProfile..email = useremail;
      print('User Id');
      print(userId);
      print('User email');
      print(useremail);

      Amplify.Analytics.identifyUser(userId: userId, userProfile: _userProfile);
    } catch (e) {
      throw e;
    }
  }
}
