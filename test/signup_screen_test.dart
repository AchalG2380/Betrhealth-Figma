import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:betrhealth/auth/screens/signup_screen.dart';

void main() {
  testWidgets('SignupScreen shows validation errors on empty submit', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: const SignupScreen()));

    final buttonFinder = find.text('Register');
    await tester.ensureVisible(buttonFinder);
    await tester.tap(buttonFinder);
    await tester.pump();

    expect(find.text('Name is required'), findsOneWidget);
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });
}
