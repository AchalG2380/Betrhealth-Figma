import 'package:flutter_test/flutter_test.dart';
import 'package:betrhealth/core/utils/hash_utils.dart';

void main() {
  test('hashPassword returns consistent hash for same input', () {
    final hash1 = HashUtils.hashPassword('mypassword123');
    final hash2 = HashUtils.hashPassword('mypassword123');
    expect(hash1, equals(hash2));
  });

  test('hashPassword returns different hash for different input', () {
    final hash1 = HashUtils.hashPassword('password1');
    final hash2 = HashUtils.hashPassword('password2');
    expect(hash1, isNot(equals(hash2)));
  });
}
