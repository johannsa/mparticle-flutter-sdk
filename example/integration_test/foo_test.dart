import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mparticle_flutter_sdk/mparticle_flutter_sdk.dart';
import 'package:mparticle_flutter_sdk/identity/identity_type.dart';
import 'package:mparticle_flutter_sdk/identity/identity_api_result.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("failing test example", (WidgetTester tester) async {
    // const loginKey = Key('Login');
    // final Finder loginButton = find.byKey(loginKey);

    // await tester.tap(loginButton);

    // await tester.pumpAndSettle();
    print('yoooo');
    MparticleFlutterSdk? instance = await MparticleFlutterSdk.getInstance();
    var identityRequest = MparticleFlutterSdk.identityRequest;
    identityRequest.setIdentity(
        identityType: IdentityType.CustomerId, value: 'abc');

    void identityCallbackSuccess(IdentityApiResult successResponse) {
      print("Success Response: $successResponse");
      instance?.getCurrentUser().then((user) {
        print(user?.getMPID());
        expect(user != null, true);
      });
    }

    instance?.identity
        .login(identityRequest: identityRequest)
        .then(identityCallbackSuccess);
  });
}
