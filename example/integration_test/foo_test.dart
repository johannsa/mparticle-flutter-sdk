import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mparticle_flutter_sdk/events/screen_event.dart';
import 'package:mparticle_flutter_sdk/mparticle_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("passing test example", (WidgetTester tester) async {
    MparticleFlutterSdk? mpInstance = await MparticleFlutterSdk.getInstance();
    ScreenEvent screenEvent1 = ScreenEvent(eventName: 'new screen event');
    mpInstance?.logScreenEvent(screenEvent1);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    print(prefs.getString('flutterTest'));
    if (defaultTargetPlatform == TargetPlatform.android) {
      expect(prefs.getString('flutterTest') == 'MParticle.logScreen()', true);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      expect(prefs.getString('flutterTest') == 'logScreenEvent:', true);
    } else {
      // why doesn't this work even though it's a simple comparison?
      print('inside test');
      expect('flutterTest' == 'flutterTest', true);
      print(prefs.getKeys());
      print(prefs.getString('flutterTest'));
      print('outside test');
      expect(prefs.getString('flutterTest') == 'logScreenEvent:', true);
    }
  });
}
