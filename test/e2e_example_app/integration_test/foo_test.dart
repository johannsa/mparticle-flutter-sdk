import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mparticle_flutter_sdk/events/screen_event.dart';
import 'package:mparticle_flutter_sdk/mparticle_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("passing test example", (WidgetTester tester) async {
    MparticleFlutterSdk? mpInstance = await MparticleFlutterSdk.getInstance();
    ScreenEvent screenEvent1 = ScreenEvent(eventName: 'new screen event');
    mpInstance?.logScreenEvent(screenEvent1);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    print(prefs.getString('flutterTest'));
    if (Platform.isAndroid) {
      expect(prefs.getString('flutterTest') == 'MParticle.logScreen()', true);
    } else if (Platform.isIOS) {
      expect(prefs.getString('flutterTest') == 'logScreenEvent:', true);
    }
  });
}
