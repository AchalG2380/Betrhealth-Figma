import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:betrhealth/auth/screens/signin_screen.dart';

void main() {
  testWidgets('SigninScreen shows validation errors on empty submit', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(home: const SigninScreen()));

    // Scroll the button into view to ensure it is hit-testable in SingleChildScrollView
    final buttonFinder = find.text('Sign In');
    await tester.ensureVisible(buttonFinder);
    await tester.tap(buttonFinder);
    await tester.pump();

    // Expect validation errors to appear
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });
}
