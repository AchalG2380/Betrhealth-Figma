import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:betrhealth/auth/screens/signin_screen.dart';

void main() {
  testWidgets('SigninScreen shows validation errors on empty submit', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: const SigninScreen()));

    // Tap the Sign In button without entering anything
    await tester.tap(find.text('Sign In'));
    await tester.pump();

    // Expect validation errors to appear
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });
}
