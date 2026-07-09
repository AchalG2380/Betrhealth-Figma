import 'package:flutter_test/flutter_test.dart';
import 'package:betrhealth/core/utils/validators.dart';

void main() {
  group('Validators.email', () {
    test('returns error for empty email', () {
      expect(Validators.email(''), isNotNull);
    });

    test('returns error for invalid email format', () {
      expect(Validators.email('notanemail'), isNotNull);
    });

    test('returns null for valid email', () {
      expect(Validators.email('test@example.com'), isNull);
    });
  });

  group('Validators.password', () {
    test('returns error for empty password', () {
      expect(Validators.password(''), isNotNull);
    });

    test('returns error for password under 6 characters', () {
      expect(Validators.password('123'), isNotNull);
    });

    test('returns null for valid password', () {
      expect(Validators.password('secure123'), isNull);
    });
  });

  group('Validators.confirmPassword', () {
    test('returns error when passwords do not match', () {
      expect(Validators.confirmPassword('abc123', 'xyz789'), isNotNull);
    });

    test('returns null when passwords match', () {
      expect(Validators.confirmPassword('abc123', 'abc123'), isNull);
    });
  });
}
